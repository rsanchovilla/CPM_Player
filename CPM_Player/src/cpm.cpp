#include "stdafx.h"

#include "CPM_Player.h"
#include "fileio.h"
#include "console.h"
#include "cpm.h"
#include "z80.h"
#include "..\res\resource.h"

CPM::CPM(CONSOLE* parent) : console(parent)
{
	log = NULL;
	
	z80 = new Z80(this);
	memory = z80->memory;
	hThread = NULL;
	
	version_id = 0x22;
	cpm3_return_code = 0;

	CCP_BASE  = 0xfd00;
	BDOS_BASE = 0xfe00;
	BIOS_BASE = 0xff00;

	PrefetchFileLen = -1; // prefetch file cache empty
	PrefetchEnabled = 1; // prefetch enabled

    // to be used on CP/M-3 bank BIOS calls
    // Bank 0=system bank (where banked OS resides) not implemented
    // Bank 1=Bank for TPA
    // Bank 2=User bank
    current_bank=src_bank=dest_bank=1; 
    memset(banked_memory, 0, sizeof(banked_memory));
    extern int common_mem_start_addr; 
    common_mem_start_addr = 0xe000; 

	submit_active = 0;
	xsub_active = 0;
	xsub_wait_counter = 0;
    xsub_wait_counter_ms = 0; 
	xsub_delay = 5; // default delay 5 char status check before send pending xsub char
	ccp_active = 0;
	ccp_base=0;
	ccp_len=0;
    cold_boot=0; 
	params.running = FALSE; 
	emulation_running = 0;
    terminate_cpm_requested = 0;

    memset(drive_path, 0, sizeof(drive_path));
    memset(defined_drive_path, 0, sizeof(defined_drive_path));
    
}

CPM::~CPM()
{
	params.running = FALSE;
	if(z80) delete z80;
	if(log) delete log;
}

int CPM::GetMode(char cMode) 
{
	if (cMode == 'S') {
		return params.cpu_max_ips;
	} 
	return 0;
}


void CPM::SetMode(char cMode, int vMode)
{
	if (cMode == 'V') {
		// Version del CPM
  		version_id = (uint8) vMode;
	} else if (cMode == 'S') {
		// speed -> change cpu_max_ips
		int n = params.cpu_max_ips;
		if (vMode == +1) {
			// increase speed
			if (n < 1) return; // already max host speed
			n = n + n / 20;
			if (n > MAX_IPS) n = -1; // max host speed 
		} else if (vMode == -1) {
			// decrease speed
			if (n < 1) {
				n = MAX_IPS; // set max speed
			} else {
			    n = n - n / 20;
				if (n < 1000) n = MIN_IPS; // minimum speed: 1K
			}
		} else if (vMode == 0) {
			// set max speed
			n = -1;
		} else if (vMode == 4) {
			// set max speed
			n = 4*1000*1000;
        }
		params.cpu_max_ips = n;
        if (console) console->MaxIPS=n;
	} else if (cMode == 'L') {
		// Log: 1= activado, 0=desactivado
        extern int cpu_log; 
        extern int cpu_addr_log; 
		if (vMode==1) {
            if (cpu_log < 0) cpu_log=-cpu_log; 
            if (cpu_addr_log < 0) cpu_addr_log=-cpu_addr_log; 
			if (log) {
				// log already active
			} else {
				log = new LOG("cpm.log");
			}
		} else if (vMode==0) {
            if (cpu_log > 0) cpu_log=-cpu_log; 
			if (log) {
                Sleep(100); // horrible hack to allow cpm thread to finish any in progress adding-line-to-log-log
                delete log;
			    log = NULL;
            }
		} else if (vMode==2) {
            // reopen log if active
			if (log) {
				// log active
			    SetMode('L', 0); 
			    SetMode('L', 1); 
            }
		}
	} else if (cMode == 'B') {
		if ((vMode < 0x1000) || (vMode > 0xfd00)) {
			CCP_BASE  = 0xfd00;
		} else {
			CCP_BASE  = vMode; // 0xfd00;
		}
		BDOS_BASE = CCP_BASE + 0x100; // 0xfe00;
		BIOS_BASE = CCP_BASE + 0x200; // 0xff00;
	}  else if (cMode == 'P') {
		PrefetchEnabled = vMode;
	}  else if (cMode == 'X') {
		xsub_delay = vMode;
	}

}

/* --------------------------------------------------------------------------
	CP/M 
-------------------------------------------------------------------------- */

void CPM::Run(char* folder, char* file, 
			  int cpu_max_ips, 
			  int ccp_flag)
{

    char module_path[MAX_PATH], dir[MAX_PATH];
    char * fname;
	GetModuleFileName(NULL, module_path, MAX_PATH);
	int pt = strlen(module_path);
	while(module_path[pt] != '\\') pt--;
	module_path[pt + 1] = '\0';
	
	// mount given folder as A:
	strcpy_s(drive_path[0], folder);
	// mount folders for units B:, C:, ...
	for(int i = 1; i < 16; i++) {
        if (defined_drive_path[i][0]==0) {
            // if drive not defined on .ini file, try .\Drive_B\ folder
		    sprintf_s(drive_path[i], "%sDrive_%c\\", folder, 'A'+i);
        } else if (defined_drive_path[i][0]=='.') {
            // drive defined as relative path to A: unit
		    sprintf_s(drive_path[i], "%s%s", folder, defined_drive_path[i]);
        } else {
            // drive defined as absolute path 
		    sprintf_s(drive_path[i], "%s", defined_drive_path[i]);
        }
        GetFullPathName(drive_path[i],sizeof(dir), dir, &fname);
        drive_path[i][0] = 0;
        if (fname == NULL) {
		    DWORD dwAttrib = GetFileAttributes(dir);
		    if ((dwAttrib != -1) && (dwAttrib & FILE_ATTRIBUTE_DIRECTORY)) {
			    // drive available
                strcpy_s(drive_path[i], dir); 
            }
		} 			
	}
	for(int i = 0; i < 16; i++) {
		if ((drive_path[i][0]) && (log)) {
			char sLog[512];
			sprintf_s(sLog, "CP/M Drive %d (%c:) mounted at %s\n", i, 'A'+i, drive_path[i]);
			PrtLog(sLog);
		}
	}

    char command[MAX_PATH] = {0};
    char msg[256];
    
    //here ccp_flag is: 0->run .COM/.BAS/.SUB file, 1->run CCP command processor
    if (ccp_flag==IS_CCP) {
        // running CCP (no file to run)
		sprintf_s(file_path, "%s", folder);
	} else {
		sprintf_s(file_path, "%s%s", folder, file);
        // generate the A> prompt command line
	    int len = strlen(file);
        if ((len < 4) || (ccp_flag==0)) {
            strcpy_s(command, file);
        } else if (ccp_flag==IS_COM) {
       	    strcpy_s(command, file);
            command[len-4]=' '; // remove extension, add space
            command[len-3]=0;   // so user can add parameters
        } else if (ccp_flag==IS_SUB) {
            sprintf_s(command, "SUBMIT %s", file);
 	        int len = strlen(command);
            command[len-4]=' '; // remove extension, add space
            command[len-3]=0;   // so user can add parameters
        } else if (ccp_flag==IS_BAS) {
            sprintf_s(command, "MBASIC %s", file); 
 	        int len = strlen(command);
            command[len-4]=0;   // remove extension, does not add space
        }
	}
	
    ClearMemory();
    console->ExpectString(0,NULL); // init Expect String
	console->ClearScreen(true);
    sprintf_s(msg, "Welcome to CP/M Player for Win32 %s \r\n", CPM_Player_version);
	console->PutString(msg);
	console->PutString("\r\n");
	sprintf_s(msg, "[A:] %s\r\n", folder);
	console->PutString(msg);
	for(int i = 1; i < 16; i++) {
		if (drive_path[i][0]) {
        	sprintf_s(msg, "[%c:] %s\r\n", 'A'+i, drive_path[i]);
	        console->PutString(msg);
        }
    }    
    if (ccp_flag != IS_CCP) {
   	    console->PutString("\r\n");
		sprintf_s(msg, "A>%s", command);
		console->PutString(msg);
    	if (ccp_flag == 0) {
    	    console->PutString("\r\n");
            console->PutString("This is not a valid file. Can run only .COM/.SUB/.BAS files \r\n");	
            return;    
        }
    }
	
    extern void SaveRecentFiles();
    extern int AddToRecentFileList(char* pfolder, char* pfile);
    AddToRecentFileList(folder, file);
  	SaveRecentFiles();


	emulation_running = 0;
    terminate_cpm_requested=0; 
	params.running = FALSE;
	if(hThread) {
		WaitForSingleObject(hThread, INFINITE);
		CloseHandle(hThread);
	}
	hThread = NULL;
	
	params.cpm = this;
	params.console = console;
	params.cpu_max_ips = cpu_max_ips; // -> se ejecutan cpu_max_ips instrucciones z80 cada segundo
	params.ccp_flag = ccp_flag; 

	DWORD dwThreadID;
	hThread = CreateThread(NULL, 0, Thread, &params, 0, &dwThreadID);
    //threads are at normal priority	SetThreadPriority(hThread, THREAD_PRIORITY_ABOVE_NORMAL);
}

// return 1 if z80 cpu is running
int CPM::IsRunning()
{
    if (hThread == NULL) return 0; 
    if (emulation_running==0) return 0; 
    return 1; 
}

void CPM::Terminate()
{
	submit_active = 0;
	xsub_active = 0;
	xsub_wait_counter = 0;
    xsub_wait_counter_ms = 0; 

	params.running = FALSE;
    terminate_cpm_requested = 1; 
    Sleep(100); // pause before killing emulation thread. Should be > than any other sleep
	if(hThread) {
        WaitForSingleObject(hThread, 150);
		DWORD exit_code = 1;
		GetExitCodeThread(hThread, &exit_code);
		if (exit_code != 0) {
			MessageBox(NULL, "CP/M Thread still running", "CP/M Player Error", 0);
		}
		CloseHandle(hThread);
	}
	hThread = NULL;
	emulation_running = 0;
    terminate_cpm_requested = 0; 
}

void CPM::ClearMemory()
{
    // to be used on CP/M-3 bank BIOS calls
    // Bank 0=system bank (where banked OS resides) not implemented
    // Bank 1=Bank for TPA
    // Bank 2=User bank
    current_bank=src_bank=dest_bank=1; 
    for (int i=0; i<=0xffff; i++) memory[i]=0; 
    memset(banked_memory, 0, sizeof(banked_memory));
}

int CPM::GetHostFileName(char* CPM_fileName, char* FileName)
// convert CP/M D:FILENAME.EXT file spec to Win32 path\filename.ext
// according to drives defined in drive_path[unit]
// return -1 if using unmapped/invalid drive unit/filename too long/extension too long/drive unit but no filename 
// return 0 if valid filename 
{
    char CPM_fn[MAX_PATH]; 
    char fn[MAX_PATH]; 
    int n1, n2, n; 
    char c; 

    // remove any blank from CPM_fn
    n1=n2=0; 
    while (CPM_fileName[n1]==32) n1++; 
    while(1) {
        c = CPM_fileName[n1++]; 
        if (c<=32) c=0; 
        CPM_fn[n2++]=c; 
        if (c==0) break; 
    }
    int drive_unit=default_drive; 
    // has CPM filename a drive unit spec?
    if ((strlen(CPM_fn) >= 2) && (CPM_fn[1]==':')) {
        // yes, get it
        drive_unit = toupper(CPM_fn[0])-'A'; 
        if ((drive_unit >= 16) || (drive_unit <0) || 
            (drive_path[drive_unit][0]==0)) return -1; // signal bad external command (bad unit)
        if (strlen(CPM_fn) == 2) return -1; // drive unit but no filename 
        // remove drive from file name
        n=0; 
        while(1) {
            c=CPM_fn[n]=CPM_fn[n+2]; 
            if (c==0) break; 
            n++;
        }
    }
    // get filename length
    n=0; 
    while(1) {
        c=CPM_fn[n]; 
        if ((c=='.') || (c==0)) break;  
        n++; 
    }
    if ((n==0) || (n>8)) return -1; // missing filename or filename too long
    if (strlen(CPM_fn)-n > 4) return -1; // extension too long
    // set file_path variable with external command filemane
    sprintf_s(fn, "%s%s", drive_path[drive_unit], CPM_fn); 
    strcpy_s(FileName, MAX_PATH, fn);
    return 0; 
}


void CPM::InternalCommand(int SubCmd, char* sParam, char* smsg)
{
	// exec internal command 
	//			SubCmd=1 -> ERA, =2 -> REN, =3 -> XSUB, =4 -> SAVE, =5 -> SUBMIT, =6 -> TYPE

	char sLog[512];
	char fn[MAX_PATH];
	char fn1[MAX_PATH];
	char fn2[MAX_PATH];
    int rc; 

	if (log) {
		sprintf_s(sLog, "internal CP/M Program: ");
		PrtLog(sLog);
		if (SubCmd == 1) {
			sprintf_s(sLog, "ERA ");
		} else if (SubCmd == 2) {
			sprintf_s(sLog, "REN ");
		} else if (SubCmd == 3) {
			sprintf_s(sLog, "XSUB ");
		} else if (SubCmd == 4) {
			sprintf_s(sLog, "SAVE ");
		} else if (SubCmd == 5) {
			sprintf_s(sLog, "SUBMIT ");
		} else if (SubCmd == 6) {
			sprintf_s(sLog, "TYPE ");
		} else {
			sprintf_s(sLog, "Unknown (%d) ", SubCmd);
		}
		PrtLog(sLog);
		sprintf_s(sLog, "%s\n", sParam);
		PrtLog(sLog);
	}

	smsg[0]=0;
	if (sParam[0] == 0) { // all but XSUB have params
		if (SubCmd != 3) {
			sprintf_s(smsg, 80, "Error: Missing parameters\r\n");
			return;
		}
	} else {
		if (SubCmd == 3) { // XSUB has no params
			sprintf_s(smsg, 80, "Error: No parameters needed\r\n");
			return;
		}
	}
	int iCmd = 0;
	int bEqual = 0; // flag if "=" found
	fn1[0] = 0;
	fn2[0] = 0;
	BYTE b;
	// get filename 1
	for (int i=0; i<80; i++) {
		b = sParam[iCmd++];
		if ((b == 32) || (b == '=') || (b == 0)) {
			fn1[i] = 0;
			if (b != 32) iCmd--;
			break;
		}
		fn1[i] = toupper(b);
	}
	// skip spaces
	for (int i=0; i<80; i++) {
		b = sParam[iCmd++];
		if (b == '=') {
			bEqual = 1;
			break;
		}
		if (b == 32) continue;
		iCmd--;
		break;
	}
	// get filename 2
	for (int i=0; i<80; i++) {
		b = sParam[iCmd++];
		if ((b == 32) || (b == 0)) {
			fn2[i] = 0;
			if (b == 0) iCmd--;
			break;
		}
		fn2[i] = toupper(b);
	}

	
	if (SubCmd == 1) {
		// ERA fn1
        char dir[MAX_PATH];
        char * fname;
        rc=GetHostFileName(fn1, fn1); // get filename to erase
        if (rc < 0) {
			sprintf_s(smsg, 80, "Invalid filename \"%s\"\r\n", fn1);
			return;
        }
        GetFullPathName(fn1, sizeof(dir), dir, &fname); 
        if (fname) *fname=0; // remove fname from dir
		// loop on file with optional wildcards
		int n = 0;
		WIN32_FIND_DATA FindFileData;
		HANDLE hFind = FindFirstFile(fn1, &FindFileData);
		while (hFind != INVALID_HANDLE_VALUE) {
            sprintf_s(fn2, "%s%s", dir, FindFileData.cFileName); // FindFileData.cFileName only has the filename, not the path
			if (log) {
				sprintf_s(sLog, "Delete: %s\n", FindFileData.cFileName);
				PrtLog(sLog);
			}
			if (DeleteFile(fn2)) n++;
			if (!FindNextFile(hFind, &FindFileData)) {
				FindClose(hFind);
				hFind = INVALID_HANDLE_VALUE;
			}
		}	
		if (log) {
			sprintf_s(sLog, "Deleted %d file(s)\n", n);
			PrtLog(sLog);
		}
	} else if (SubCmd == 2) {
		// REN NewFn=OldFn
		if (fn1[0] == 0) {
			sprintf_s(smsg, 80, "Missing New filename (REN NewFN=OldFN)\r\n");
			return;
		}
		if (bEqual != 1) {
			sprintf_s(smsg, 80, "Missing equal sign (REN NewFN=OldFN)\r\n");
			return;
		}
		if (fn2[0] == 0) {
			sprintf_s(smsg, 80, "Missing Old filename (REN NewFN=OldFN)\r\n");
			return;
		}
        rc=GetHostFileName(fn2, fn2); 
        if (rc < 0) {
			sprintf_s(smsg, 80, "Invalid filename \"%s\"\r\n", fn2);
			return;
        }
        rc=GetHostFileName(fn1, fn1); 
        if (rc < 0) {
			sprintf_s(smsg, 80, "Invalid filename \"%s\"\r\n", fn1);
			return;
        }
		if (log) {
			sprintf_s(sLog, "Rename: %s -> %s\n", fn2, fn1);
			PrtLog(sLog);
		}
		if (!MoveFile(fn2, fn1)) {
			sprintf_s(smsg, 80, "Error renaming\r\n");
			return;
		}
	} else if (SubCmd == 3) {
		// XSUB
		xsub_active = 1;
		xsub_wait_counter = 0;
        xsub_wait_counter_ms = 0; 
	} else if (SubCmd == 4) {
		// SAVE nn fn2
		int nPages = 0;
		if (fn1[0] == 0) {
			sprintf_s(smsg, 80, "Missing Number of memory pages to save (SAVE nn FN)\r\n");
			return;
		}
		for (int i=0; i<10; i++) {
			if (fn1[i] == 0) break;
			int d = fn1[i] - '0';
			if ((d < 0) || (d > 9)) {
				sprintf_s(smsg, 80, "Invalid number of memory pages to save (SAVE nn FN)\r\n");
				return;
			}
			nPages = nPages * 10 + d;
			if (nPages > 255) {
				sprintf_s(smsg, 80, "Number of memory pages to save too big (SAVE nn FN)\r\n");
				return;
			}
		}
		if (nPages < 1) {
			sprintf_s(smsg, 80, "Number of memory pages to save must be >0 and <256 (SAVE nn FN)\r\n");
			return;
		}
		if (fn2[0] == 0) {
			sprintf_s(smsg, 80, "Missing file to save (SAVE nn FN)\r\n");
			return;
		}
        rc=GetHostFileName(fn2, fn2); 
        if (rc < 0) {
			sprintf_s(smsg, 80, "Invalid filename \"%s\"\r\n", fn2);
			return;
        }
		if (log) {
			sprintf_s(sLog, "Save %d pages ($0100 -> $%02xFF) to -> %s\n", nPages, fn2);
			PrtLog(sLog);
		}
	
		FILEIO* fio = new FILEIO();
	
		if (fio->Fopen(fn2, FILEIO_WRITE_BINARY)) 
			if (fio->Fwrite(memory + 256, 1, nPages*256-1) > 0) {
				fio->Fclose();
				nPages = 0;
			}
		delete fio;
		if (nPages > 0) {
			sprintf_s(smsg, 80, "Error saving memory\r\n");
			return;
		}
	} else if (SubCmd == 5) {
		// SUBMIT chaining
		if (fn1[0] == 0) {
			sprintf_s(smsg, 80, "Missing submit file (SUBMIT FN ...)\r\n");
			return;
		}
        rc=GetHostFileName(fn1, fn); 
        if (rc < 0) {
			sprintf_s(smsg, 80, "Invalid filename \"%s\"\r\n", fn1);
			return;
        }
		if ((strlen(fn) > 3) && (_stricmp(fn-4, ".SUB")==0)) {
			// ok, .sub extension
			sprintf_s(file_path, "%s", fn); // copy submit file to file to be executed
		} else {
			sprintf_s(file_path, "%s.SUB", fn); // add .SUB ext 
		}
		// remove submit file from param string
		int iCmd = -1;
		for (int i=0; i<128; i++) { 
			if (sParam[i] == 0) break;
			if (sParam[i] == 32) {
				iCmd = 0;
				continue;
			} 
			if (iCmd < 0) continue; 
			for (;;) { 
				BYTE b = sParam[iCmd++] = sParam[i++];
				if (b==0) break;
			}
			break;
		}
		if (log) {
			sprintf_s(sLog, "Submit chaining to %s\n", file_path);
			PrtLog(sLog);
		}
   	} else if (SubCmd == 6) {
		// TYPE fn1
        rc=GetHostFileName(fn1, fn); 
        if (rc < 0) {
			sprintf_s(smsg, 80, "Invalid filename \"%s\"\r\n", fn1);
			return;
        }
		if (log) {
			sprintf_s(sLog, "Type %s\n", fn);
			PrtLog(sLog);
		}
        char buf[1024];
		FILEIO* fio = new FILEIO();
	
		if (fio->Fopen(fn, FILEIO_READ_BINARY)) {
            // read file and print it on console
            // sense keypress to terminate TYPE command
            // sense emulation pause, and emulation termination
            int TypeExit = 0; 
            int EmptyLine = 1; 
            int n; 
            char c; 
            while (1) {
                n=fio->Fread(buf, 1, sizeof(buf)); 
			    if (n==0) break; // break if end of file/error
                for(int i = 0; i < n; i++) {
                    c=buf[i];
                    if (c==26) { 
                       TypeExit=1; 
                       break; // ^Z = end f ascii file 
                    } else if (c == 10) { 
                        EmptyLine=1; // <LF> opens a new line
                    } else if (c != 13) {
                        EmptyLine=0; // not <CR> -> line not empty
                    }
                    console->PutChar(c, true);
                    // type file can be a lengthly operation if file typed is big,
                    // or if terminal_max_cps setting is low (or both)
                    // so check each 32 chars printed for for keypressed/^C/Pause/Emulation Termination 
                    if ((i & 31) == 0) {
                       check_into_type_cmd:
                        if (terminate_cpm_requested) {
                            TypeExit=1; 
                            break; // emulation terminated
                        }
		                if (console->paused != 0) {
			                Sleep(50); // emulation paused by user
			                goto check_into_type_cmd;
		                } 
                        c=console->GetKeyStatus(1);
                        if (c) { // get key pressed
                            TypeExit = (c==3) ? 2:1; // = 2 if exit because ^C
                            break; // break if key pressed 
                        }
                    }
                }
                if (TypeExit) break; 
            }
			fio->Fclose();
            if (EmptyLine==0) console->PutString("\r\n");
            if (TypeExit==2) {
			    sprintf_s(smsg, 80, "^C");
			    return;
            }
        } else {
			sprintf_s(smsg, 80, "Error reading file\r\n");
			return;
        }
		delete fio;

	}
}

int CPM::GetSubmitLine(char* sCmd, char* sParam)
{
	// get next line from submit file, process unit changes, then 
    // set file_path, sCmd = "PROG" (sCmd[80]) and sParam = "PROG PARAM1 PARAM2 ..." (sParam[200])
	// return	-1 if no more lines in submit file 
    //          -2 if invalid external command (invalid if has extension or len > 8 chars) ot invalid unit
	//			 0 if external command 
	//			 1-ERA, 2-REN, 3-XSUB, 4-SAVE, 5-SUBMIT, 6-TYPE internal commands, 7=changed default drive spec

	int iSub = 0;
	int iLin = 0;
    char sLin[250]; 
	BYTE b;
	// copy line to smsg
	for(;;) {
		if (iSub >= 16*1024-1) break;
		b = submit_file[iSub++];
        if (b==9) b=32; // tab to space
		if ((b == 13) && (iLin == 0)) continue; // skip blank lines
        if (b==255) { //skip ;EXPECT command
            int len=submit_file[iSub++];
            iSub+=len; 
			continue;
        } else if (b==254) { // skip ;WAIT command
            iSub+=2; 
			continue;
        } // ;SEND command not need to be skipped: the sent chars are just here, but no preceeding command by
		if (b < 32) break;
		if ((b == 32) && (iLin == 0)) continue; // skip leading spaces
		if ((b == ';') && (iLin == 0)) { // skip comment
			for (int i=iSub;;i++) { // convert comment to spaces
				if (submit_file[i] < 32) break;
				submit_file[i] = ' ';
			}
			continue;
		}
        if (iLin < 240) sLin[iLin++] = b; 
	}
    sLin[iLin] = 0; // sLin = first line from submit file stored in mem. No comments, no leading blanks
	if (iLin == 0) return -1; // no more lines in submit file
	if (b == 0) iSub--;
	// remove first line from submit file
	for (int i=0;;) {
		if (iSub >= 16*1024-1) break;
		b = submit_file[iSub++];
		submit_file[i++] = b;
		if (b == 0) break;
	}
    // sLin is PROG PARAM1 PARAM2 
	// get PROG in sCmd
    int n; 
	for (n=0;n<70;n++) {
		b = sCmd[n] = sLin[n];
		if ((b==32) || (b==0)) break; 
	}
    sCmd[n]=0; 
    // skip space separation between PROG and PARAM1
    if (sLin[n]==32) n++; 
    // get PARAM1 PARAM2 ... if any in sParam
    sprintf_s(sParam, 190, "%s", sLin+n);
    // remove trailing blanks
    while (n=strlen(sParam)) { n--; if (sParam[n]!=32) break; sParam[n]=0; }
	// check if sCmd is an internal program
    if (_stricmp(sCmd, "ERA")==0) return 1; 
    if (_stricmp(sCmd, "REN")==0) return 2; 
    if (_stricmp(sCmd, "XSUB")==0) return 3; 
    if (_stricmp(sCmd, "SAVE")==0) return 4; 
    if (_stricmp(sCmd, "SUBMIT")==0) return 5; 
    if (_stricmp(sCmd, "TYPE")==0) return 6;
	// sCmd is not an internal command
    // check if begins with drive unit D:
    int drive_unit=default_drive; 
    int fn_start=0; 
    if ((strlen(sCmd) >= 2) && (sCmd[1]==':')) {
        // yes, get it
        int new_unit = toupper(sCmd[0])-'A'; 
        if ((new_unit >= 16) || (new_unit <0) || (drive_path[new_unit][0]==0)) {
            return -2; // signal bad external command (bad unit)
        }
        // set filepath accordng to new drive 
        strcpy_s(file_path, drive_path[new_unit]);
        if (strlen(sCmd) == 2) {
            // was a new default unit spec, apply it and terminate
            default_drive=new_unit; 
            return 7; // changed drive spec
        }
        fn_start=2; // sCmd starts at char 2, to skip drive spec
        drive_unit=new_unit; // use the stated unit
     }
     // sCmd is an external command 
     // check external command in sCmd: should have no extension, max 8 chars
     for(int i=0; i<8; i++) {
         if (sCmd[i+fn_start]==0) break;
         if (sCmd[i+fn_start]=='.') {return -2; } // external commands into submit files cannot have extension
     }
     if (strlen(sCmd + fn_start) > 8) {return -2; } // external command name too long
	 // set file_path variable with external command filemane
     sprintf_s(file_path, "%s%s.COM", drive_path[drive_unit], sCmd + fn_start); 
	 return 0;
}

DWORD WINAPI CPM::Thread(LPVOID pvoid)
{
	volatile PPARAMS pparams;
	pparams = (PPARAMS)pvoid;
	pparams->running = true;
	pparams->cpm->emulation_running = 1;
	
	BOOL console_terminated = FALSE;
    int ips_setting;       // user selected IPS speed of emulated cpu
    int cpu_time_slice_ms; // msec that CPU is running
	int cpu_slice = -1;    // how much instr should execute the CPU in cpu_time_slice_ms given ips_setting
    int count; 
	
	char sCmd[80]; 
	char sParam[512]; // command line parameters
	pparams->console->ResetKeyBuffer();

	if (pparams->cpm->params.ccp_flag == IS_CCP) {
		// just execute the CCP program, do not ask for command line parameters
		sParam[0] = 0;
	} else {
		// regular command -> ask for line command parameters
		pparams->console->GetString(sParam, 256, console_terminated, FALSE); // ^C not allowed
	}

	if(console_terminated || (!pparams->running)) {
		pparams->cpm->emulation_running = 0;
        pparams->cpm->terminate_cpm_requested = 0; 
		ExitThread(0);
		return 0;
	}
	pparams->console->PutString("\r\n");
	
	pparams->cpm->submit_active = 0;
	pparams->cpm->xsub_active = 0;
	pparams->cpm->xsub_wait_counter = 0;
    pparams->cpm->xsub_wait_counter_ms = 0; 
    pparams->cpm->default_drive = 0;

	char smsg[512];
	pparams->cpm->Initialize(sParam, smsg, 1,
							 pparams->cpm->params.ccp_flag);
	if (smsg[0] != 0) {
		// If error show message and stop
		pparams->console->PutString(smsg);
		pparams->running = FALSE;
        pparams->cpm->submit_active = 0; 
	}
	
	for(;;) { // loop on submit file
        if (pparams->cpm->terminate_cpm_requested) break; 
		if (!pparams->running) {	
            // no z80 program in execution
			if (pparams->cpm->submit_active == 0) break; // no submit active -> exit for loop
            // submit file active, read and decode first line
            char default_drive_letter = ('A' + pparams->cpm->default_drive); // save current default drive (GetSubmitLine can change it)
            int SubCmd; 
			SubCmd = pparams->cpm->GetSubmitLine(sCmd, sParam);
            // the read line from submit file. line is PRG PARAM1 PARAM2 ...
            // return sCmd = "PRG", sParam = "PARAM1 PARAM2 ..."
            //        SubCmd = the decoded command PRG
            // check if if submit file is terminated...
    		if (SubCmd == -1) {
                // yes, submit file terminated
              SubmitFileTermination:
				pparams->console->PutString("\r\nSUBMIT Terminated\r\n");
				pparams->cpm->submit_active = 0;
				pparams->console->Terminate();
				break; // no more submit commands -> exit for loop
			}
            // submit file not terminated. Print on console the line from submit file to be executed
			pparams->console->OpenNewLine(); 
            pparams->console->PutChar(default_drive_letter, false);
			pparams->console->PutString(">");
			pparams->console->PutString(sCmd); // print A>PRG PARAM1 PARAM2 ...
			pparams->console->PutString(" ");
			pparams->console->PutString(sParam);
			pparams->console->PutString("\r\n");
            // check if PRG is invalid
            if (SubCmd == -2) {
                // yes ... command has an extension, or more than 8 chars long
                pparams->console->PutString(sCmd);    // print the offening program
                pparams->console->PutString("?\r\n"); // followed by an "?"
                goto SubmitFileTermination;           // then terminate the submit file
            }
            // check if PRG is an internal command (ERA, REN, SAVE, XSUB, SUBMIT, TYPE, Default unit change)
			if (SubCmd > 0) {
                if (SubCmd==7) continue; // drive unit changed in GetSubmitLine, proceed to next submit line
			    // yes, is an internal command. Execute it
				pparams->cpm->InternalCommand(SubCmd, sParam, smsg);
				if (smsg[0] != 0) {
                    // some error returned
					pparams->console->PutString(smsg);  // print it 
					goto SubmitFileTermination;         // then terminate the submit file
				}
                // internal command processed without errors
                if (SubCmd == 3) pparams->console->PutString("(xsub active)\r\n"); // signal on console if XSUB is active
                if (SubCmd != 5) continue; // if not a chaining SUBMIT, proceed to next submit line
            }
			// execute program or chained submit file or change the current default unit
            if (SubCmd==0) {
                // load .COM program for execution
                // previous GetSubmitLine() call has updated file_path with the .COM file to be loaded
                if (pparams->cpm->cold_boot) {
                    // if previous prog terminated with cold boot -> init zero page when loading new prog
                    pparams->cpm->Initialize(sParam, smsg, 1, IS_COM);
                } else {
                    pparams->cpm->Initialize(sParam, smsg, 0, IS_COM);
                }
            } else {
                // load chained .SUB program
                // previous GetSubmitLine() call has updated file_path with the .SUB file to be loaded
                pparams->cpm->submit_active = 0; // to allow reload .SUB file into cpm->Initialize
                pparams->cpm->Initialize(sParam, smsg, 0, IS_SUB);
            }
			if (smsg[0] != 0) {
               // some error returned
    			pparams->console->PutString(smsg);  // print it 
				goto SubmitFileTermination;         // then terminate the submit file
			}
            // no errors ...
			if (SubCmd == 5) continue;  // if chained SUBMIT file -> loop to exec it
            // go ahead and execute loaded .COM file
			pparams->running = true;
		}

		if (pparams->console->paused != 0) {
			 Sleep(50); // emulation paused by user
			 continue;
		} 
        // get the current CPU IPS (inst per second) setting
		ips_setting = pparams->console->MaxIPS = pparams->cpu_max_ips;
        cpu_time_slice_ms = 1000 / FPS; // set a cpu time slice
		cpu_slice = ips_setting * cpu_time_slice_ms / 1000; // z80 inst to exec in cpu_time_slice_ms accorting to current ips_setting
		if (cpu_slice < 1) cpu_slice = -1;
        // cpu_time_slice_ms = 33 (with FPS = 30)
        // cpu_slice = -1 (max host speed) or =33...1.6M

        int term = pparams->console->mem_mapped_terminal_type; 
        if ((term == CRT_KAYPRO) || (term == CRT_OSBORNE) || (term == CRT_VIO) || (term == CRT_DAZZLER) || (term == CRT_TERM125) ) {
			pparams->cpm->z80->memory_maped_devices = true; 
		} else {
			pparams->cpm->z80->memory_maped_devices = false; 
		}
        // execute z80 intructions
        count=pparams->cpm->RunCPU(cpu_slice, cpu_time_slice_ms);
        if (pparams->console->IPS_count > 1000*1000*1000) pparams->console->IPS_count=0; 
		pparams->console->IPS_count += count; 
	}

	pparams->cpm->emulation_running = 0;
    pparams->cpm->terminate_cpm_requested=0; 
	ExitThread(0);
	return 0;
}

void CPM::Initialize(char* cmd, char* smsg, int init_zero_page,
					 int ccp_flag)
{
    // on entry, file_path global var contains the full qualified host file (path\fname.ext)
    //           selected for execution. 
    // if ccp_flag = IS_CCP -> loads CCP.COM into CP/M mem
    //               IS_COM -> loads file_path (should be a .COM file) into mem
    //                         loads cmd string as command line parameters 
    //               IS_BAS -> loads MBASIC.COM into CP/M mem
    //                         cmd points to locally created var cmdbas = "fname " + cmd
    //                         (file_path should be a .BAS file)
    //               IS_SUB -> loads file_path (should be a .SUB file) into mem
    //                         loads cmd string as command line parameters 
    // if init_zero_page = 1 -> initializes zero page, if =0 -> keep current values
    // return on smsg any error message

    extern LPVOID ccp_com_addr;
    extern DWORD  ccp_com_len;
    extern LPVOID mbasic_com_addr;
    extern DWORD  mbasic_com_len;

	smsg[0] = 0;
	
	char* load_file = NULL;
    char cmdbas[255];

    if (ccp_flag==IS_COM) {
    	load_file = file_path; // the .COM file to load into mem
    } else if (ccp_flag==IS_SUB) {
		submit_active = 2; 
		load_file = file_path; // the submit file to process
    } else if (ccp_flag==IS_BAS) {
		load_file = file_path; // the basic file to run
        // should get the .BAS filename (at the end of file_path) and put it at the beggining 
        // of command line params (var cmd), so it is: basic_prg_no_ext param1 param2 ...
        char *p;
        p = &file_path[strlen(file_path)-1]; // p points to last char of .BAS filename in file_path
        while ((*p) && (*p != '\\')) p--;    // p points to last "\" so p+1 points to filename
        sprintf_s(cmdbas, "%s", p+1);        // place filename in cmdbas
        p = &cmdbas[strlen(cmdbas)-1];       // p points to last char of .BAS filename in cmdbas
        while ((*p) && (*p != '.')) p--;     // p points to last "." 
        *p=0;                                // remove extension
        sprintf_s(p, 150, "%s", cmd);        // add cmd command line typed by user
        cmd=cmdbas;                          // cmd points to new created command line
    } else if (ccp_flag == 0) {
    	sprintf_s(smsg, 256, "Cannot run '%s'\r\n", load_file);	
		return;
    }
	
	if ((log) && (ccp_flag > IS_CCP)) {
		char sLog[512];
		sprintf_s(sLog, "Starting Program: %s \r\n"
                        "Command line    : %s \r\n", load_file, cmd);
		PrtLog(sLog);
	}

	if (ccp_flag==IS_CCP) { // load CCP
		BYTE *ptr = LPBYTE(ccp_com_addr);
		for(int i=0;i<int(ccp_com_len);i++) memory[TPA_BASE+i] = *(ptr++);
		if (log) PrtLog("Loaded CCP\n");
    } else if (ccp_flag==IS_BAS) {
		BYTE *ptr = LPBYTE(mbasic_com_addr);
		for(int i=0;i<int(mbasic_com_len);i++) memory[TPA_BASE+i] = *(ptr++);
		if (log) PrtLog("Loaded MBASIC\n");
	} else {
        // .COM and .SUB files are load in mem starting at 0x100
		int loaded_size = 0;
		FILEIO* fio = new FILEIO();
		if(fio->Fopen(load_file, FILEIO_READ_BINARY)) {
			for(int i = TPA_BASE; i < CCP_BASE; i++) {
				int d = fio->Fgetc();
				if(d != EOF) {
					memory[i] = d;
					loaded_size++;
				} else {
					memory[i] = 0;
					break;
				}
			}
			fio->Fclose();
			if (log) {
				char sLog[512];
				sprintf_s(sLog, "Loaded %d bytes: $0100 - $%04x\n", loaded_size, loaded_size+256-1);
				PrtLog(sLog);
			}
		} else {
			sprintf_s(smsg, 256, "Cannot open '%s'\x0D\x0A", load_file);	
			return;
		}
		delete fio;
		if (loaded_size == 0) {
			sprintf_s(smsg, 256, "Cannot load empty '%s'\x0D\x0A", load_file);	
			return;
		}
	}

    // to be used on CP/M-3 bank BIOS calls
    // Bank 0=system bank (where banked OS resides) not implemented
    // Bank 1=Bank for TPA
    // Bank 2=User bank
    current_bank=src_bank=dest_bank=1; 
	
	for(int i = 0; i < 16; i++) read_only[i] = false;
	dma_addr = 0x80;
	user_id = 0;
	delimiter = '$';
    RecordsToReadAtOnce = 1; 

    extern int iobyte; 
    if (init_zero_page==0) {
        iobyte = memory[3]; // save iobyte set by previous program
    } else {
    	for(int i = 0; i < 0x100; i++) {
	    	memory[i] = 0;
		    ioport[i] = 0;
    	}

    	// jump to BIOS 
	    memory[0x00] = 0xc3;
    	memory[0x01] = (BIOS_BASE + 3) & 0xff;
	    memory[0x02] = (BIOS_BASE + 3) >> 8;

    	// BIOS jump table
	    int BIOScode; 
    	for(int i = 0; i < 32; i++) { // generate fake BIOS jmp table

    		BIOScode = BIOS_BASE + 32 * 3 + i * 4;
	    	memory[BIOS_BASE + i*3 + 0] = 0xc3; //JMP
		    memory[BIOS_BASE + i*3 + 1] = BIOScode & 0xff;
    		memory[BIOS_BASE + i*3 + 2] = BIOScode >> 8;
	    	// special instr to simulate enter to BIOS
		    memory[BIOScode+0] = 0xed; // special opcode (undefined in regular z80)
    		memory[BIOScode+1] = 0xff; // to call BIOS function
	    	memory[BIOScode+2] = i;    // bios func called
		    memory[BIOScode+3] = 0xc9; // ret;
	    }
	
    	// jump to BDOS
	    memory[0x05] = 0xc3;
    	memory[0x06] = (BDOS_BASE + 6) & 0xff;
	    memory[0x07] = (BDOS_BASE + 6) >> 8;

        // put a HALT z80 instr just before BIOS jump table and at end of mem
        // so execution is halted if PC jumps to the middle of OS
        memory[BIOS_BASE-1]=0x76; // z80 halt opcode
        memory[0xFFFF]     =0x76; 

        if (version_id==201) {
            memory[0x08] = 0xFF; // CDOS needs this in its memory map
        }

    	// special instr to simulate enter to BDOS
	    memory[BDOS_BASE + 6] = 0xed; // special opcode (undefined in regular z80)
    	memory[BDOS_BASE + 7] = 0xfe; // to call BDOS function
	    memory[BDOS_BASE + 8] = 0xc9; // ret

        if (version_id==0x28) {
            // Personal CP/M needs some constats for BDOS function 113
            memory[BDOS_BASE + 16] = 27;  // ESC / K \0 -> VT52 termina identification
            memory[BDOS_BASE + 17] = '/'; 
            memory[BDOS_BASE + 18] = 'K'; 
            memory[BDOS_BASE + 19] = 0; 
            memory[BDOS_BASE + 24] = 255; // subfunctions suported by BDOS 113
            memory[BDOS_BASE + 25] = 255; 
            memory[BDOS_BASE + 26] = 255; 
            memory[BDOS_BASE + 27] = 15; 
            memory[BDOS_BASE + 28] = 255; // subfunctions emulated by BDOS 113
            memory[BDOS_BASE + 29] = 255; 
            memory[BDOS_BASE + 30] = 255; 
            memory[BDOS_BASE + 31] = 15; 
        }
    	
    	if (console->mem_mapped_terminal_type==CRT_VIO) {
	    	//IMSAI VIO memory model
            memory[0xF800] = 0xC9; // entry point for init VIO 
    		memory[0xF803] = 0xed; // special opcode (undefined in regular z80)
	    	memory[0xF804] = 0xff; // to call BIOS function
		    memory[0xF805] = 3;    // bios func 3 (conout) called
    		memory[0xF806] = 0xc9; // ret;
        }

    	// Set IOByte
	    memory[0x03] = iobyte; 
    	// default setting: CONSOLE=CRT, READER=PTR, PUNCH=PTP, LIST=LPT
	
    	// CCP default user (0) and drive (0)
	    memory[0x04] = 0;

    }
    // instr to simulate enter to CCP
    memory[CCP_BASE + 0] = 0xed; // special opcode (undefined in regular z80)
    memory[CCP_BASE + 1] = 0xfd; // to end execution and reload CCP. No need to ret

    // FCB
	char cmdt[512];
	sprintf_s(cmdt, "%s ", cmd);
	char* cmdp = cmdt;

    // clear FCB1 random access pointer
    memory[0x5c + 12] = 0; // ex
	memory[0x5c + 14] = 0; // s2
	memory[0x5c + 32] = 0; // cr

    // clear FCB2 random access pointer
    memory[0x6c + 12] = 0; // ex
	memory[0x6c + 14] = 0; // s2

    // init FCBs for command line params
	for(int i = 0; i < 11; i++) {
		memory[0x5d+i] = 32;
		memory[0x6d+i] = 32;
	}

	for(int i = 0; i < 2; i++) {
		// init FCBs for command line params if they are files
		for(;;) {
			if(cmdp[0] != ' ')
				break;
			cmdp++;
		}
		if(cmdp[0] == '\0')
			break;
		char paramt[512];
		strcpy_s(paramt, cmdp);
		char* ptr = strstr(paramt, " ");
		ptr[0] = '\0';
		
		char n[2] = { '.', '\0' };
		char* filep = (paramt[1] == ':') ? paramt + 2 : paramt;
		char* extp = strstr(filep, ".");
		extp = (extp != NULL) ? extp : n;
		extp[0] = '\0';
		extp++;
		
		uint8* drive = &memory[0x5c + 0x10 * i];
		uint8* file = drive + 1;
		uint8* ext = drive + 9;
		
		if(paramt[1] == ':') {
			if('A' <= paramt[0] && paramt[0] <= 'P')
				drive[0] = paramt[0] - 'A' + 1;
			else if('a' <= paramt[0] && paramt[0] <= 'p')
				drive[0] = paramt[0] - 'a' + 1;
			else
				drive[0] = 0;
		}
		else {
			drive[0] = 0;
		}
		int len = strlen(filep);
        if (len > 8) len=8; 
		for(int j = 0; j < len; j++)
			file[j] = (uint8)filep[j];
		for(int j = len; j < 8; j++)
			file[j] = ' ';
		for(int j = 0; j < 8; j++) {
			if(file[j] == '*') {
				for(int k = j; k < 8; k++)
					file[k] = '?';
			}
		}
		len = strlen(extp) > 3 ? 3 : strlen(extp);
		for(int j = 0; j < len; j++)
			ext[j] = (uint8)extp[j];
		for(int j = len; j < 3; j++)
			ext[j] = ' ';
		for(int j = 0; j < 3; j++) {
			if(ext[j] == '*') {
				for(int k = j; k < 3; k++)
					ext[k] = '?';
			}
		}
		
		cmdp = strstr(cmdp, " ") + 1;
	}
	
	// command line
	int len = 0; 
	if (strlen(cmd) > 0) {
	   sprintf_s(cmdt, " %s", cmd);
	   len = strlen(cmdt);
	}
	len = (len < 126) ? len : 126;
	memory[0x80] = len;
	for(int i = 0; i < 126; i++)
		if (i <= len) {
			memory[0x81 + i] = (uint8)cmdt[i];
		} else {
			memory[0x81 + i] = 0;
		}
	memory[0xff] = 0;
	
	// if submit create submit mem
	if (submit_active == 2) {
		submit_active = 1; 
		int iMem = 0x100;
		int iSub = 0;
		int iCmd;
		int cmdNum; 
		BYTE b;
		for(;;) {
			if (iSub >= 16*1024-1) break;
			b = memory[iMem++];
			if ((b < 32) && (b != 9) && (b != 13) && (b != 10)) break; // non ascii -> end of sub file
			if (b == 9) b = 32; // convert tab to space
			if (b == 10) continue; // ignore LF
			if (b == '^') {
				// caret -> ctrl char
				b = memory[iMem];
				if (b == '^') {
					submit_file[iSub++] = '^'; // double carret 
					iMem++;
					continue;
				}
				if ((b >= 'A') && (b <= '[')) { // ^Char to its ascii equivalent
					submit_file[iSub++] = b - 'A' + 1;
					iMem++;
					continue;
				}
				b = '^';
			}
            if (b == ';') {
                // check for ;expect "xxx" #nn ^c AAA ;comment     command
                extern int ParseString(char *sIn, char *sOut, int size);
                static char sExp[10] = "EXPECT ";
                int n=1; 
                for (int i=0; i<(int) strlen(sExp); i++) {
                    if (toupper(memory[iMem + i]) != sExp[i]) n=0; 
                }
                if (n) { // found EXPECT -> process it
                    iMem += strlen(sExp); // skip command
                    submit_file[iSub++] = 0xFF; // char $FF in submit file -> indicates a expect string
                    submit_file[iSub++] = 0;    // expect string length will be placed here. It is not a bull terminated string
                    // place the expected string into the submit file
                    n=ParseString((char *) &memory[iMem], (char *) &submit_file[iSub], 250); // max length of expect string = 250 chars
                    if (n==0) {
                        // missing expect string
                        iSub-=2; // undo                         
                    } else {
                        submit_file[iSub-1] = n;    // save expect string length
                        iSub += n; // skip in submit_file the expect string
                    }
                    // skip input line until <cr><lf>
                    SkipUntilCR: 
                    while (1) {
                        b=memory[iMem++]; 
                        if (b==9) b=32; 
                        if ((b==13) && (memory[iMem]==13)) continue; // <CR><CR> -> ignore spurious <CR>
                        if ((b==13) && (memory[iMem]==10)) { // <CR><LF>
                            iMem++; break; 
                        } else if (b < 32) break; // non ascii
                    }
                    continue; 
                }
                // check for ;wait 123   or    ;wait 123s   command
                n=1; 
                static char sWa[10] = "WAIT ";
                for (int i=0; i<(int) strlen(sWa); i++) {
                    if (toupper(memory[iMem + i]) != sWa[i]) n=0; 
                }
                if (n) { // found WAIT -> process it
                    iMem += strlen(sWa); // skip command
                    while (memory[iMem]==32) iMem++;
                    int xsub_wait=0; 
                    int xsub_wait_is_in_sec=0; // =1 if the wait value is in seconds
                    while (b=memory[iMem]) {
                        if ((b<'0') || (b>'9')) break; 
                        xsub_wait=xsub_wait*10+b-'0'; 
                        iMem++; 
                    }
                    if ((b=='s') || (b=='S')) xsub_wait_is_in_sec=1; 
                    if (xsub_wait_is_in_sec) {
                        // wait time expressed in seconds
                        if (xsub_wait==0) xsub_wait=1; 
                        if (xsub_wait > 99) xsub_wait=99; // max wait 100 seconds 
                        xsub_wait=10000+xsub_wait; 
                        // when xsub_wait in range 10000.. -> wait is in seconds
                    } else {
                        // wait time expressed keyboard getstatus scans
                        if (xsub_wait >= 10000) xsub_wait=9999; // max wait 10000
                        // when xsub_wait in range 0..9999.. -> wait is GetStatusKey count
                    }
                    submit_file[iSub++] = 0xFE; // char $FE in submit file -> indicates a wait on sending chars to program
                    submit_file[iSub++] = 128 + (xsub_wait & 127);        // lower 7bits, Avoid having a zero
                    submit_file[iSub++] = 128 + ((xsub_wait >> 7) & 127); // higher 7 bits
                    goto SkipUntilCR; 
                }
                // check for ;send command
                n=1; 
                static char sSe[10] = "SEND ";
                for (int i=0; i<(int) strlen(sSe); i++) {
                    if (toupper(memory[iMem + i]) != sSe[i]) n=0; 
                }
                if (n) { // found SEND -> process it
                    iMem += strlen(sSe); // skip command
                    while (memory[iMem]==32) iMem++;
                    // place the send string into the submit file
                    n=ParseString((char *) &memory[iMem], (char *) &submit_file[iSub], 250); // max length of send string = 250 chars
                    if (n==0) {
                        // missing send string
                    } else {
                        iSub += n; // skip in submit_file the send string
                    }
                    // skip input line until <cr><lf>
                    goto SkipUntilCR; 
                }
            }
			if (b != '$') {
				// not $x -> save char in sub file and continue;
				submit_file[iSub++] = b;
				continue;
			}
			// parse $x 
			b = memory[iMem];
			if ((b < '1') || (b > '9')) {
				submit_file[iSub++] = '$';
				continue; // not $1 to $9 -> keep $
			}
			iMem++;
			// insert cmd line param
			cmdNum = b - '0'; 
			iCmd = 0;
			for (;;) {
				// set b= first param char or #00
				for(;;) {
					b = cmd[iCmd++];
					if (b == 0) break; // cmd line finished -> no more cmd params
					if (b == 32) continue; // skip initial spaces
					break;
				}
				if (b == 0) break; // no more params
				// param found
				cmdNum--;
				iCmd--;
				// iterate over param, copy if is the one selected
				for(;;) {
					b = cmd[iCmd++];
					if (b == 0) break; // cmd line finished 
					if (b == 32) break; // space -> end of param
					if (cmdNum == 0) submit_file[iSub++] = b;
				}
			}
			// command line param $n copied to sub_file
		}
		submit_file[iSub++] = 0; // end of submit file;
		params.running = FALSE;
	}

	// detect if is a CCP (Command Processor)
	ccp_active = 0;
	if ((memory[0x103] == 'C') &&
		(memory[0x104] == 'C') &&
		(memory[0x105] == 'P') &&
		(memory[0x106] == '_') &&
		(memory[0x107] == 'R') &&
		(memory[0x108] == 'Q')) {
		// detected magic string 
		// aknowledge
		memory[0x107] = 'O';
		memory[0x108] = 'K';
		// activate CCP support BDOS calls
		ccp_active = 1;
		if (log) PrtLog("CCP Detected! -> Activate BDOS support calls\n");
	}
    z80->Reset(CCP_BASE);
}

/* --------------------------------------------------------------------------
	CPU
-------------------------------------------------------------------------- */

void CPM::PrtLog(char* sLog)
{
	if (log) log->OutLog(sLog);
}

int CPM::RunCPU(int cpu_slice, int cpu_time_slice_ms)
// cpu_time_slice_ms = 33 (with FPS = 30)
// cpu_slice = -1 (max host speed) or =33...1.6M
{
    // if host can achieve say 10M z80 IPS, it will need 10msec to exec this
    int inst_to_exec= 200000;
	int ms1,ms2,count;

	if (cpu_slice < 1) {
        // max host speed. Execute a reasonable number of instr at once, and return
        count = z80->Run(inst_to_exec); 
        return count; 
    }

    // controlled IPS
	ms1 = GetTimeMS();
	count = 0;

	for(;;) {
        if (cpu_slice-count < inst_to_exec) inst_to_exec = cpu_slice-count;
        if (inst_to_exec > 0) {
		    count += z80->Run(inst_to_exec); 
        }
		ms2 = GetTimeMS() - ms1;
		if (ms2 < 0) break; // word wrap
		if (ms2 >= cpu_time_slice_ms) break; // max time of execution
		if (count >= cpu_slice) {
			Sleep(cpu_time_slice_ms-ms2); // wait to end of time slice to achieve user selected IPS 
			break;
		}
        if (params.running == FALSE) break;
	}
	return count; //cpu_inst_executed 
}

extern int cpu_log; 
extern int cpu_addr_log; 

void CPM::SaveRAM(void)
{
    // Save RAM to A: folder. Saves from addr 0000 up to addr FFFF
    char SaveRAMfname[MAX_PATH];
    static int nRAMfile=0; // number of ram file saves

    if (nRAMfile > 99) return; // out of sequence numbers
	if (drive_path[0][0] == 0) return; // no A: folder defined
    while (1) {
        sprintf_s(SaveRAMfname, "%sSave_RAM_%02d.bin", drive_path[0], nRAMfile); 
        if (Fexists(SaveRAMfname)) {
            // file exists. try next filename in sequence
            nRAMfile++;
            if (nRAMfile > 99) return; // out of sequence numbers
            continue; 
        }
        // ram filename not exists -> use it
        break; 
    }
    FILEIO* fio = new FILEIO();
	if(fio->Fopen(SaveRAMfname, FILEIO_WRITE_BINARY)==0) {
        // cannot open file -> exit
        delete fio;
        return; 
	}
   	if(fio->Fwrite(memory, 1, 64*1024) == 0) {
        // write error
	    fio->Fclose();
		delete fio;
        return; 
	}
    fio->Fclose();
	delete fio;
    char s[MAX_PATH+100];
    sprintf_s(s, "Memory Dumped and saved into file: \r\n%s", SaveRAMfname);
	MessageBox(NULL, s, "CP/M Player", 0);
}

void CPM::WriteMemory(uint16 addr, uint8 data)
{
    int term = console->mem_mapped_terminal_type; 
	if ((term  == CRT_OSBORNE) && (CCP_BASE <= 0xe100)
                               && (console->mem_mapped_terminal_subtype != CRT_OSBORNE_EXEC)) {
		// Osborne 1 memory model
		// F000: begin of video mem. 128 chars x 24 lines. Bit7=underline
		if((cpu_log > 0) && log && ((addr >= 0xe100) && (addr < 0xf000))) {
			char string[256];
			sprintf_s(string, "Write BIOS ADDR = %4x, data = %2x\n", addr, data);
			log->OutLog(string);
		}
		if ((addr >= 0xf000) && (addr < (0xf000 + 128 * 24))) {
			// write video mem
			int n = addr - 0xf000;
			int x_pos = n & 0x7f;
			int y_pos = n >> 7;
			BYTE c = data & 0x7f;
			if (c < 32) c += 128; // graphics chars are rendered as chars 128 ..
			console->MappedVideoMem(x_pos, y_pos, 1, c); // SET Char
			BYTE attrib = console->MappedVideoMem(x_pos, y_pos, 4, 0); // GET Attrib
			if (data & 0x80) {
				attrib |= 4;
			} else {
				attrib &= ~4;
			}
			console->MappedVideoMem(x_pos, y_pos, 2, attrib); // SET Attrib
			console->RequestRefreshScreen(false);
		}
	} else if ((term == CRT_OSBORNE) && (console->mem_mapped_terminal_subtype == CRT_OSBORNE_EXEC)) {
		// Osborne Executive memory model
		if((cpu_log > 0) && log && (addr >= 0xf000)) {
			char string[256];
			sprintf_s(string, "Read BIOS ADDR = %4x\n", addr);
			log->OutLog(string);
		}
		if ((ioport[0] & 0x80) && (addr < 0x1000)) {
			// write char definition ram
			if ((addr < 0) || (addr >= sizeof(console->Osborne_CharGenerator))) {
				// write out of range
			} else {
				if (console->Osborne_use_CharGenerator != 1) { // osborne 8 x 10 standar char font
					console->Osborne_use_CharGenerator = 1;
					memset(console->Osborne_CharGenerator, 0, sizeof(console->Osborne_CharGenerator));
				}
				console->Osborne_CharGenerator[addr] = data;
   			    console->RequestRefreshScreen(true); // full redraw, as chars are redefined
                return; 
			}
		} else if ((ioport[0] & 0x40) && (addr >= 0xc000) && (addr < (0xc000 + 128 * 24))) {
			// write video mem
			int n = addr - 0xc000;
			int x_pos = n & 0x7f;
			int y_pos = n >> 7;
			BYTE c = data & 0x7f;
			if (c < 32) c += 128; // graphics chars are rendered as chars 128 ..
			console->MappedVideoMem(x_pos, y_pos, 1, c); // SET Char
			BYTE attrib = console->MappedVideoMem(x_pos, y_pos, 4, 0); // GET Attrib
			if (data & 0x80) {
				attrib |= 1;
			} else {
				attrib &= ~1;
			}
			console->MappedVideoMem(x_pos, y_pos, 2, attrib); // SET Attrib
			console->RequestRefreshScreen(false); 
            return; 
		} else if ((ioport[0] & 0x40) && (addr >= 0xd000) && (addr < (0xd000 + 128 * 24))) {
			// write video attrib mem
			int n = addr - 0xd000;
			int x_pos = n & 0x7f;
			int y_pos = n >> 7;
			BYTE attrib = 0;
			//	CPM Player attributes:	bit0: Reverse
			//							bit1: underline
			//							bit2: bright
			//							bit3: blink	
			//                          bit4: alternate charset
			// Osborne Executive attrib:bit7: Hi
			//							bit6: underline
			//							bit5: blink
			//							bit4: alternate font
			//							Bit7 character: reverse
			BYTE data = 0; // convert cpm player attrib to osborne atrib standart
			if (data & (1 << 4)) attrib |= 16;
			if (data & (1 << 6)) attrib |= 2;
			if (data & (1 << 7)) attrib |= 4;
			if (data & (1 << 5)) attrib |= 8;
			console->MappedVideoMem(x_pos, y_pos, 2, attrib); // SET Attrib
			console->RequestRefreshScreen(false);
            return; 
		}
	} else if (term  == CRT_KAYPRO) {
		// Kaypro memory model
		if ((ioport[28] & 0x80) && (addr >= 0x3000) && (addr < (0x3000 + 128 * 25))) {
			// write video mem
			int n = addr - 0x3000;
			int x_pos = n & 0x7f;
			int y_pos = n >> 7;
			BYTE c = data & 0x7f;
			if (c < 32) c += 128; // graphics chars are rendered as chars 128 ..
			console->MappedVideoMem(x_pos, y_pos, 1, c); // SET Char
			console->RequestRefreshScreen(false);
            return;
		}
	} else if (term  == CRT_VIO) {
		//IMSAI VIO memory model
        if (addr == 0xF7FF) {
            // write to VIO command byte
            console->MappedVideoMem(0, 0, 5, data); // SET VIO Mode (this also sets for a full redraw)
            if (log) log->OutLog("VIO: Set Mode");
        } else if (addr == 0xF780) {
            // write to VIO firmware CURLIN cursor line 
            console->MappedVideoMem(-1, data, 7, 0); // cursor pos y (line)
            return;
        } else if (addr == 0xF781) {
            // write to VIO firmware CURCOL cursor line 
            console->MappedVideoMem(data, -1, 7, 0); // cursor pos x (column)
            return;
        } else if ((addr >= 0xF000) && (addr < 0xF000 + 80 * 24)) {
            // write in card video mem, mapped in cpu address space
            int x_pos, y_pos; 
            int mode = console->MappedVideoMem(0, 0, 6, 0); // GET VIO Mode 
            int n = addr - 0xF000;
            if (mode & 1) {
			    x_pos = n % 40; // 40 columns mode
			    y_pos = n / 40;
            } else {
			    x_pos = n % 80; // 80 columns mode
			    y_pos = n / 80;
            }
            // ignore 12 lines mode
			console->MappedVideoMem(x_pos, y_pos, 1, data); // SET Char
			console->RequestRefreshScreen(false);
            return; 
        } else if (addr >= 0xF000) {
            if (log) log->OutLog("VIO: writing to firmware RAM/ROM (not implemented)");
        }
	} else if (term  == CRT_TERM125) {
		// WaveMate Termina-125 memory model
        if ((addr >= 0xC000) && (addr < 0xC000 + 64 * 32)) {
            // write in card video mem, mapped in cpu address space
            int x_pos, y_pos; 
            int n = addr - 0xC000;
	        x_pos = n & 63; 
	        y_pos = n / 64;
		    console->MappedVideoMem(x_pos, y_pos, 1, data); // SET Char
	    	console->RequestRefreshScreen(false);
            return; 
        }
	} else if (term  == CRT_DAZZLER) {
		// Dazzler memory model
        // check if writing to mem used as framebuffer by dazzler card
        if (console->DazzlerCard(1, addr, data)) { 
            // yes, addr belongs to mem region used as dazzler framebufer
            console->RequestRefreshScreen(false);
        }
	}
	memory[addr] = data;
}

uint8 CPM::ReadMemory(uint16 addr)
{
    //YYY
    if (addr == 0xfe72) return 255; else // cursor visible
    if (addr == 0xfe75) return (uint8) console->SetMode('I', -1)+1; else // cursor xpos
    if (addr == 0xfe76) return (uint8) console->SetMode('I', -2)+1; else // cursor ypos
    if (addr == 0xfed0) return 0; else // esc in progress
    if (addr == 0xfe52) return 0; else // style selection keys pressed
    if (addr == 0xfe54) return 0; else // shift keys pressed
    if (addr == 0xfe72) return 1; else // cursor visible
    if (addr == 0xfe7a) return 0; else // current attribs 
    if (addr == 0xfe80) return 0; else // lang code 0=US
    if (addr == 0xfe78) return 0; else // = 1 when sending the second byte of two-bytes char to console
    if ((addr >= 0xfe10) && (addr < 0xff00)) {
        int a=0; 
    }

	int term = console->mem_mapped_terminal_type; 
	if ((term  == CRT_OSBORNE) && (CCP_BASE <= 0xe100) 
                               && (console->mem_mapped_terminal_subtype != CRT_OSBORNE_EXEC)) {
		// Osborne 1 memory model
		if((cpu_log > 0) && log && ((addr >= 0xe100) && (addr < 0xf000))) {
			char string[256];
			sprintf_s(string, "Read BIOS ADDR = $%4x\n", addr);
			log->OutLog(string);
		}
		if ((addr >= 0xf000) && (addr < (0xf000 + 128 * 24))) {
			// read video mem
			int n = addr - 0xf000;
			int x_pos = n & 0x7f;
			int y_pos = n >> 7;
			BYTE data = console->MappedVideoMem(x_pos, y_pos, 3, 0); // GET Char
			if (data == 0) data = 32; // 0 char is blank on screen but must be read as space
			if (data > 127) data -= 128; // chars > 128 are graphic chars 0..31
			BYTE attrib = console->MappedVideoMem(x_pos, y_pos, 4, 0); // GET Attrib
			if (attrib & 4) {
				data |= 0x80;
			} else {
				data &= 0x7f;
			}
			return data;
		} else if (((addr >= 0xE57F) && (addr < 0xE587)) ||
			       ((addr >= 0xE17F) && (addr < 0xE187))) {
			// return lo addr for cursor key definition. Starts at e600
			if ((addr & 1) == 0) {
				return 0xe6; // hi part 0xE6xx
			}
			// lo part
			BYTE data;
			if (addr >= 0xE57F) {
				data = (addr-0xE57F) << 1;
			} else {
				data = (addr-0xE17F) << 1;
			}
			return data;
		} else if ((addr >= 0xE600) && (addr < 0xE604)) {
			int n = (addr - 0xE600);
			if (n == 0) return 5; // up key = ^E
			if (n == 1) return 4; // right key = ^D
			if (n == 2) return 0x18; // down key = ^X
			if (n == 3) return 0x13; // left key = ^S
		}
	} else if ((term == CRT_OSBORNE) && (console->mem_mapped_terminal_subtype == CRT_OSBORNE_EXEC)) {
		// Osborne Executive memory model
		if ((ioport[0] & 0x40) && (addr >= 0xc000) && (addr < (0xc000 + 128 * 24))) {
			// read video mem
			int n = addr - 0xc000;
			int x_pos = n & 0x7f;
			int y_pos = n >> 7;
			BYTE data = console->MappedVideoMem(x_pos, y_pos, 3, 0); // GET Char
			if (data == 0) data = 32; // 0 char is blank on screen but must be read as space
			if (data > 127) data -= 128; // chars > 128 are graphic chars 0..31
			BYTE attrib = console->MappedVideoMem(x_pos, y_pos, 4, 0); // GET Attrib
			if (attrib & 1) {
				data |= 0x80;
			} else {
				data &= 0x7f;
			}
			return data;
		} else if ((ioport[0] & 0x40) && (addr >= 0xd000) && (addr < (0xd000 + 128 * 24))) {
			// read video attrib mem
			int n = addr - 0xd000;
			int x_pos = n & 0x7f;
			int y_pos = n >> 7;
			BYTE attrib = console->MappedVideoMem(x_pos, y_pos, 4, 0); // GET Attrib
			//	CPM Player attributes:	bit0: Reverse
			//							bit1: underline
			//							bit2: bright
			//							bit3: blink	
			//                          bit4: alternate charset
			// Osborne Executive attrib:bit7: Hi
			//							bit6: underline
			//							bit5: blink
			//							bit4: alternate font
			BYTE data = 0; // convert cpm player attrib to osborne atrib standart
			if (attrib & 16) data |= (1 << 4); 
			if (attrib & 2) data |= (1 << 6);
			if (attrib & 4) data |= (1 << 7);
			if (attrib & 8) data |= (1 << 5);
			return data;
		}
	} else if (term  == CRT_KAYPRO) {
		//Kaypro memory model
		if ((ioport[28] & 0x80) && (addr >= 0x3000) && (addr < (0x3000 + 128 * 25))) {
			// read video mem
			int n = addr - 0x3000;
			int x_pos = n & 0x7f;
			int y_pos = n >> 7;
			BYTE data = console->MappedVideoMem(x_pos, y_pos, 3, 0); // GET Char
			if (data == 0) data = 32; // 0 char is blank on screen but must be read as space
			if (data > 127) data -= 128; // chars > 128 are graphic chars 0..31
			return data;
		}
    } else if (term == CRT_VIO) {
        if (addr == 0xF780) {
            // read from VIO firmware CURLIN cursor line 
            return console->MappedVideoMem(0, 1, 8, 0); // cursor pos y (line)
        } else if (addr == 0xF781) {
            // read from VIO firmware CURCOL cursor line 
            return console->MappedVideoMem(1, 0, 8, 0); // cursor pos x (column)
        } else if ((addr >= 0xF000) && (addr < 0xF000 + 80 * 24)) {
            int x_pos, y_pos; 
            int mode = console->MappedVideoMem(0, 0, 6, 0); // GET VIO Mode 
            int n = addr - 0xF000;
            if (mode & 1) {
			    x_pos = n % 40; // 40 columns mode
			    y_pos = n / 40;
            } else {
			    x_pos = n % 80; // 80 columns mode
			    y_pos = n / 80;
            }
            // ignore 12 lines mode
			return console->MappedVideoMem(x_pos, y_pos, 3, 0); // GET Char
        } else if (addr >= 0xF000) {
            if (log) log->OutLog("VIO: reading from firmware RAM/ROM (not implemented)");
        }
    } else if (term == CRT_TERM125) {
        if ((addr >= 0xC000) && (addr < 0xC000 + 64 * 32)) {
            int x_pos, y_pos; 
            int n = addr - 0xC000;
	        x_pos = n & 63; 
	        y_pos = n / 64;
			return console->MappedVideoMem(x_pos, y_pos, 3, 0); // GET Char
        }
    }
	return memory[addr];
}

void CPM::WriteIO(uint8 laddr, uint8 haddr, uint8 data)
{
	if((cpu_log > 0) && log) {
        if (cpu_addr_log > 0) {
            // start of cpu log not reached yet
        } else {
		    char string[256];
		    sprintf_s(string, "WriteIO ADDR = $%02x, DATA = $%02x\n", laddr, data);
	    	log->OutLog(string);
        }
	}
	int term = console->mem_mapped_terminal_type; 
	if (term  == CRT_OSBORNE) {
        if (laddr == 0) {
		    // osborne executive banked memory control
		    ioport[0] = data;
		    // writing on port 0 switch from osborne 1 memory model 
		    // to osborne executive banked memory model
            console->mem_mapped_terminal_subtype = CRT_OSBORNE_EXEC; 
        }
	} else if (term  == CRT_KAYPRO) {
	    if (laddr == 7) {
		    // Kaypro II write keyboard status
		    ioport[7] = data;
	    } else if (laddr == 28) {
		    // Kaypro II write banked memory control
		    ioport[28] = data;
        }
	} else if (term  == CRT_DAZZLER) {
		//Dazzler memory model
        if ((laddr==0xE) || (laddr==0xF)) {
		    console->DazzlerCard(2, laddr, data); // OUT to dazzler port laddr.
		    console->RequestRefreshScreen(false);
        }
	} else if (term  == CRT_TERM125) {
        if ((laddr==0x10) || (laddr==0x11)) {
            console->Term125_FictionalHiresVectorEngine(laddr, data);
            // no need call RequestRefreshScreen. Already called into Term125_FictionalHiresVectorEngine
        }
	}
}

uint8 CPM::ReadIO(uint8 laddr, uint8 haddr)
{
	uint8 ret = 0xff;

	int term = console->mem_mapped_terminal_type; 
	if ((laddr == 0) && (term  == CRT_OSBORNE)) {
        if (console->mem_mapped_terminal_subtype != CRT_OSBORNE_EXEC) {
    		console->mem_mapped_terminal_subtype = CRT_OSBORNE_EXEC; 
	    	ioport[0] = 1; // default osborne executive start-up value
		}
		// osborne executive banked memory control
		ret = ioport[0];
	} else if (term  == CRT_KAYPRO) {
        if (laddr == 5) {
   		    // Kaypro II read keyboard data
            ret = console->GetKey();
        } else if (laddr == 7) {
    		// Kaypro II read keyboard status
	    	// bit0 true = char available
		    // bit2 true = no chars available
    		if (console->GetKeyStatus(0)) {
	    		ret = ioport[7] | 1;
		    	ret = ret & (255 - 4);
			    ioport[7] = ret;
    		} else {
	    		ret = ioport[7] | 4;
		    	ret = ret & (255 - 1);
			    ioport[7] = ret;
		    }
        } if (laddr == 28) {
		    // Kaypro II read banked memory control
		    ret = ioport[28];
        }
    } else if (term  == CRT_DAZZLER) {
		//Dazzler memory model
        if (laddr==0xE) {
            // IN from dazzler port laddr scan lines/frame counter
    		ret = console->DazzlerCard(3, laddr, 0); 
        } if ((laddr >= 0x18) && (laddr <= 0x1c)) {
            // joystick ports
    		ret = console->DazzlerCard(4, laddr, 0); 
            console->RequestRefreshScreen(false); // so joy state on screen is refreshed
        }
	}
	if((cpu_log > 0) && log) {
        if (cpu_addr_log > 0) {
            // start of cpu log not reached yet
        } else {
    		char string[256];
	    	sprintf_s(string, "ReadIO ADDR = $%02x, DATA = $%02x\n", laddr, ret);
		    log->OutLog(string);
        }
	}
	return ret;
}




