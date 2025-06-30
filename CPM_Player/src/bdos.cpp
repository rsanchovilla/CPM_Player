#include "stdafx.h"

#include "fileio.h"
#include "console.h"
#include "cpm.h"
#include "z80.h"

bool CPM::CCP(uint16 *PC)
{
	if(log) log->OutLog("Terminated: Return to CCP\n");
	if (ccp_active == 1) {
		*PC = LoadAndRunCCP();
		return true; 
	} else {
		if (!submit_active) {
			console->PutString("\x0D\x0ATerminated: Return to CCP\x0D\x0A");
			console->Terminate();
		}
		params.running = false;
		return false;
	}
}

bool CPM::BDOS(int num, uint16 *CallerPC, uint16 *regBC, uint16 *regDE, uint16 *regHL, uint8 *regA, uint16 *PC)
{
    extern int cpu_log;
    extern int cpu_addr_log; 

	bool retval = true;
	bool UndefBDOSCall = false; 
	BYTE code; 
    uint16 sv_BC, sv_DE, sv_HL; 

    cold_boot = 0; 

	if(log && (num != 1) && // console input
		      (num != 2) && // console output
			  (num != 6) && // direct console I/O
			  (num != 9) && // output string
			  (num != 10) && // buffered console input
			  (num != 11)) { // console status
		char string[256];
		sprintf_s(string, "BDOS Call %d (BC=$%04x DE=$%04x, HL=$%04x, A=$%02x, Caller PC=$%04x)\n", num, *regBC, *regDE, *regHL, *regA, *CallerPC);
		log->OutLog(string);
	}
    sv_HL=*regHL; // save regs on entry
    sv_BC=*regBC; 
    sv_DE=*regDE; 

	switch(num)
	{
	case 0:
		// system reset
		if (log) log->OutLog("   System Reset\n");
        cold_boot = 1; // signal cold boot requested to end current program
		if (ccp_active == 1) {
			// CCP active -> restore and jump to CCP 
			*PC = LoadAndRunCCP();
		} else {
			if (!submit_active) {
				console->PutString("\x0D\x0ATerminated: BDOS call 0\x0D\x0A");
				console->Terminate();
			}
			params.running = false;
			retval = false;
		}
		break;
	case 1:
		// console input
    	code = console->GetChar();
		console->PutChar(code, true);
		*regA = code;
		if(log) { 
			char string[256];
			sprintf_s(string, "BDOS Call 1 C_READ Console Input (A=$%02x, Caller PC=$%04x): ", code, *CallerPC);
			log->OutLog(string);
			log->OutLogOneChar(code);
			log->OutLog("\n");
		}
		break;
	case 2:
		// console output
		code = *regDE & 0xff;
		console->PutChar(code, true);
		if(log) { 
			char string[256];
			sprintf_s(string, "BDOS Call 2 C_WRITE Console Output (E=$%02x, Caller PC=$%04x): ", code, *CallerPC);
			log->OutLog(string);
			log->OutLogOneChar(code);
			log->OutLog("\n");
		}
		break;
	case 3:
		// auxiliary (reader) input
		if (log) log->OutLog("   Read Reader (A=$1A): <EOF>\n");
		*regA = 0x1a;
		break;
	case 4:
		// auxiliary (punch) output
		if(log) { 
  			code = *regDE & 0xff;
			char string[256];
			sprintf_s(string, "   Write Punch (AUX:) (E=$%02x): ", code);
			log->OutLog(string);
			log->OutLogOneChar(code);
			log->OutLog("\n");
		}		
		break;
	case 5:
		// printer output
        code = *regDE & 0xff;
        if (((memory[3] >> 6) & 3) < 2) { // check IOByte
            // LIST redirected to console   		
	    	console->PutChar(code, true);
        } else {
            // list sent to physical printer port 
            if ((console) && (console->printer_log)) {
                console->printer_log->OutLogByte(code);
            }
        }
		if(log) { 
			char string[256];
			sprintf_s(string, "   Write List (PRN:) (E=$%02x): ", code);
			log->OutLog(string);
			log->OutLogOneChar(code);
			log->OutLog("\n");
		}		
		break;
	case 6:
		// direct console I/O
		if((*regDE & 0xff) == 0xff) {
			code = console->GetKey();
			*regA = code; 
			*regHL = (*regHL & 0xff00) | *regA; //copy return RegA also in RegL. Needed by prologz

			// Nonblocking, returns 0 when no key has been pressed
   		    if(log) if ((*regA > 0)||(cpu_log > 0)) { 
                char string[256];
				sprintf_s(string, "BDOS Call 6 C_RAWIO Console In (Non-Blocking) (E=$%02x, A=$%02x, Caller PC=$%04x): ", *regDE & 0xff, code, *CallerPC);
				log->OutLog(string);
				log->OutLogOneChar(code);
				log->OutLog("\n");
			}
		}
		else if((*regDE & 0xff) == 0xfe) {
			code = (console->GetKeyStatus(0)) ? 0xff : 0;
			*regA = code; 
   		    if(log) if ((code > 0)||(cpu_log > 0)) { 
				char string[256];
				sprintf_s(string, "BDOS Call 6 C_RAWIO Console In (char waiting status) (E=$%02x, A=$%02x, Caller PC=$%04x)\n", *regDE & 0xff, code, *CallerPC);
				log->OutLog(string);
			}
		}
		else if((*regDE & 0xff) == 0xfd) {
			code = console->GetChar();
			*regA = code; 
			if(log) { 
				char string[256];
				sprintf_s(string, "BDOS Call 6 C_RAWIO Console In (Blocking) (E=$%02x, A=$%02x, Caller PC=$%04x): ", *regDE & 0xff, code, *CallerPC);
				log->OutLog(string);
				log->OutLogOneChar(code);
				log->OutLog("\n");
			}
		}
		else {
			code = *regDE & 0xff;
			console->PutChar(code, true);
			if(log) { 
				char string[256];
				sprintf_s(string, "BDOS Call 6 C_RAWIO Console Out (E=$%02x, Caller PC=$%04x): ", code, *CallerPC);
				log->OutLog(string);
				log->OutLogOneChar(code);
				log->OutLog("\n");
			}
		}
		break;
	case 7:
		// auxiliary input status
        extern int iobyte; 
		if (version_id == 0x22) {
			// CP/M 2.2
			*regA = iobyte = memory[3];
			if(log) { 
				char string[256];
				sprintf_s(string, "   Get IOByte (A=$%02x): ", *regA);
				log->OutLog(string);
			}
		} else {
			if (log) log->OutLog("   Aux Input Status (A=$00)\n");
			*regA = 0; //no char is ready to input form aux port
		}
		break;
	case 8:
		// auxiliary output status
		if (version_id == 0x22) {
			// CP/M 2.2
			iobyte = memory[3] = (*regDE & 0xff);
			if(log) { 
				char string[256];
				sprintf_s(string, "   Set IOByte (E=$%02x): ", memory[3]);
				log->OutLog(string);
			}
		} else {
			if (log) log->OutLog("   Aux Outpuy Status (A=$FF)\n");
			*regA = 0xff; //AUX can accept chars for output
		}

		break;
	case 9:
		// output string
		{
			if(log) { 
				char s[256];
				sprintf_s(s, "BDOS Call 9 C_WRITESTR (DE=$%04x, Caller PC=$%04x): ", *regDE, *CallerPC);
				log->OutLog(s);
			}
			BYTE c; 
			int bLast = false; // flag: true=printing last char
			for(int i = 0; i < 512; i++) {
				c = memory[*regDE + i]; 
				if (c == delimiter) break;
				if ((memory[*regDE + i +1] == delimiter) || (i == 511)) bLast=true;
				console->PutChar(c, bLast);
				if(log) log->OutLogOneChar(c);
				if (bLast) break;
                if (terminate_cpm_requested) break; 
			}
			if(log) log->OutLog("\n");
		}
		break;
	case 10:
		// buffered console input. Line editing allowed
		char string[512];
		uint16 addr;
		addr = (*regDE == 0) ? dma_addr : *regDE;
		BOOL console_terminated;
		console_terminated = FALSE;
		console->GetString(string, memory[addr], console_terminated, TRUE); // ^C allowed
		if (!console_terminated) {
			int len = strlen(string);
			memory[addr + 1] = len;
			for(int i = 0; i < len; i++)
				memory[addr + i + 2] = (uint8)string[i];
			memory[addr + len + 2] = 0;
			if(log) { 
				char s[256];
				sprintf_s(s, "BDOS Call 10 C_READSTR Buffered Console Input (DE=$%04x, Caller PC=$%04x, addr=$%04x, len=%d) '%s'\n", *regDE, *CallerPC, addr, len, string);
				log->OutLog(s);
			}
			if ((len == 1) && (string[0] == 3)) {
				// ^C pressed -> WBOOT
				if (log) log->OutLog("   ^C during buffered console input -> WBOOT\n");
				if (ccp_active == 1) {
					*PC = LoadAndRunCCP();
				} else {
					if (!submit_active) {
						console->PutString("\x0D\x0ATerminated: Ctrl-C in BDOS call 10\x0D\x0A");
						console->Terminate();
					}
					params.running = false;
					retval = false;
				}
			}
		}
		break;
	case 11:
		// console status
		int code;
		code = (console->GetKeyStatus(0)) ? 0xff : 0;
		*regA = code;
		if(log) if ((*regA > 0)||(cpu_log > 0)) { 
			char string[256];
			sprintf_s(string, "BDOS Call 11 C_STAT Console Status (A=$%02x, Caller PC=$%04x)\n", *regA, *CallerPC);
			log->OutLog(string);
		}
		break;
	case 12:
		// return version number
		*regHL = version_id;
		*regA = version_id;
		if(log) { 
			char string[256];
			sprintf_s(string, "   Return Version (A = HL=$%02x)\n", *regA);
			log->OutLog(string);
		}
		break;
	case 13:
		// reset discs
		if (log) log->OutLog("   Reset disks\n");
		{
			for(int i = 0; i < 16; i++)
				read_only[i] = false;
			dma_addr = 0x80;
			*regA = 0;
			
			memory[0x04] = 0; // CCP default user (0) and drive (0)
			default_drive = 0; // default user (0) and drive (0)
			
			char path[MAX_PATH];
			sprintf_s(path, "%s$*.*", drive_path[0]);
			WIN32_FIND_DATA fd;
			HANDLE hFind = FindFirstFile(path, &fd);
			
			if(hFind != INVALID_HANDLE_VALUE) {
				do {
					if(!(fd.dwFileAttributes & FILE_ATTRIBUTE_DIRECTORY)) {
						*regA = 0xff;
						break;
					}
				}
				while(FindNextFile(hFind, &fd));
				FindClose(hFind);
			}
		}
		break;
	case 14:
		// select disc
        int drive; 
        drive = *regDE & 255; 
   	    if(log) {
			char sLog[80];
   		    sprintf_s(sLog, "   Log-In Disk (select disk) E=%d (%c:)\n", drive, drive < 16 ? 'A'+drive : '?');
		    log->OutLog(sLog);
		}
		if((drive < 16) && (drive_path[drive][0]!=0)) {
			default_drive = drive;
			*regA = 0;
		} else {
			*regA = 0xff;
			*regHL = (*regHL & 0xff) | 0x400;
		}
		break;
	case 15:
		// open file
		if(OpenFile(*regDE)) {
			*regA = 0;
			*regHL = 0; // needed for BBC Basic Return  RegL=RegA=0
		}
		else {
			*regA = 0xff;
			*regHL = *regHL & 0x80ff;
		}
		break;
	case 16:
		// close file
		if(CloseFile(*regDE)) {
			*regA = 0;
			*regHL = 0; // needed for BBC Basic Return  RegL=RegA=0
		}
		else {
			*regA = 0xff;
			*regHL = *regHL & 0x80ff;
		}
		break;
	case 17:
		// search for first
		if(SearchFirstFile(*regDE, regHL)) {
			*regA = 0;
		}
		else {
			*regA = 0xff;
		}
        if (version_id != 201) {
		    *regHL = (*regHL & 0xff00) | *regA; //copy return RegA also in RegL
        } else {
            // on CDOS, leave regHL as return. Holds the Dir entry address found. Needed by WordMaster 0.66
        }
		break;
	case 18:
		// search for next
		if(SearchNextFile(*regDE, regHL)) {
			*regA = SearchFileDirBlock;
		}
		else {
			*regA = 0xff;
		}
        if (version_id != 201) {
		    *regHL = (*regHL & 0xff00) | *regA; //copy return RegA also in RegL
        } else {
            // on CDOS, leave regHL as return. Holds the Dir entry address found. Needed by WordMaster 0.66
        }
		break;
	case 19:
		// delete file
		if(RemoveFile(*regDE)) {
			*regA = 0;
			*regHL = 0;
		}
		else {
			*regA = 0xff;
			*regHL = *regHL & 0xff;
		}
		break;
	case 20:
		// read next record
        *regA = SequentialRead(*regDE) ? 0 : 1;
		*regHL = *regA; // needed by SPL
		break;
	case 21:
		// write next record
		*regA = SequentialWrite(*regDE) ? 0 : 1;
		*regHL = *regA; // needed by SPL
		break;
	case 22:
		// create file
		if(CreateNewFile(*regDE)) {
			*regA = 0;
			*regHL = 0; // needed for BBC Basic Return  RegL=RegA=0
		}
		else {
			*regA = 0xff;
			*regHL = (*regHL & 0xff) | 0x400;
		}
		break;
	case 23:
		// rename file
		if(RenameFile(*regDE)) {
			*regA = 0;
		}
		else {
			*regA = 0xff;
			*regHL = *regHL & 0xff;
		}
		break;
	case 24:
		// return bitmap of logged-in drives
		if (log) log->OutLog("   Return Log Code (return bitmap of logged-in drives)\n");
		// set logged drives based on available drives defined
		*regHL = 0;
		for(int i = 0; i < 16; i++) {
			if (drive_path[i][0]) *regHL |= (1 << i);
		}
		break;
	case 25:
		// return current drive
		*regA = default_drive;
		if(log) { 
			char string[256];
			sprintf_s(string, "   Read Drive Num (return current drive: A=$%02x)\n", *regA);
			log->OutLog(string);
		}
		break;
	case 26:
		// set dma address
		dma_addr = *regDE;
		if(log) { 
			char string[256];
			sprintf_s(string, "   Set DMA Address DE=$%04x\n", dma_addr);
			log->OutLog(string);
		}
        *regA=0; // needed by MFBASIC, because it checks for A=0 as result ok on every BDOS call
		break;
	case 27:
		// Get alloc vector
   		if (version_id != 201) { 
            // CPM flavor
    		*regHL = SetCPMtable(2); // get Alloc vector
            if (log) {
			    sprintf_s(string, "   Get Alloc Vector addr in HL\n");
			    log->OutLog(string);
            }
        } else {
            // CDOS return extra params
            *regBC = SetCPMtable(2); // get Alloc vector
            *regDE = 256; // number of clusters in current disk (fake value)
            *regA  = 8;  // number of records per cluster (fake value)
            if (log) {
			    sprintf_s(string, "   Get Alloc Vector addr in BC, DE, A\n");
			    log->OutLog(string);
            }
        }

		break;
	case 28:
		// software write-protect current disc
		if (log) log->OutLog("   Write Prot Disk (software write-protect current disc)\n");
		if(default_drive < 16)
			read_only[default_drive] = true;
		break;
	case 29:
		// return bitmap of read-only drives
		*regHL = 0;
		for(int i = 0; i < 16; i++) {
			if(read_only[i]) *regHL |= (1 << i);
		}
		if (log) {
			sprintf_s(string, "   Get R/O Vector HL\n");
			log->OutLog(string);
		}
		break;
	case 30:
		// set file attributes
		if (log) log->OutLog("   Set File Attrib\n");
		if(ChangeFileAttributes(*regDE)) {
			*regA = 0;
		}
		else {
			*regA = 0xff;
			*regHL = *regHL & 0xff;
		}
		break;
	case 31:
		// Get addr for DPB (Disk Parameter Block)
		*regHL = SetCPMtable(0); // populate DPB
		if(log) { 
			char string[256];
			sprintf_s(string, "   Get addr for DPB (Disk Parameter Block) HL=$%04x\n", *regHL);
			log->OutLog(string);
		}
		break;
	case 32:
		// get/set user number
		if((*regDE & 0xff) == 0xff) {
			*regA = user_id;
		} else if((*regDE & 0xff) < 16) {
			user_id = *regDE & 0xff;
		}
		if(log) { 
			char string[256];
			sprintf_s(string, "   Set/Get Usr Code DE=$%04x\n", user_id);
			log->OutLog(string);
		}
		break;
	case 33:
		// random access read record
		*regA = RandomRead(*regDE) ? 0 : 1;
		*regHL = *regA; // needed by BBC Basic
		break;
	case 34:
		// random access write record
		*regA = RandomWrite(*regDE) ? 0 : 2;
		*regHL = *regA; // needed by BBC Basic
		break;
	case 35:
		// compute file size
		if (log) log->OutLog("   Compute File Size\n");
		if(CalcFileSize(*regDE)) {
			*regA = 0;
		} else {
			*regA = 0xff;
			*regHL = *regHL & 0xff;
		}
		break;
	case 36:
		// update random access pointer
		int record, ex, s2, cr, extend; 
		ex = memory[*regDE + 12] & 0x1f;
		s2 = memory[*regDE + 14] & 0x3f;
		cr = memory[*regDE + 32] & 0x7f;
		extend = (s2 << 5) + ex;
		record = extend * 128 + cr; // get current record
		// max 64 * 32 = 2048 extentes de 16K -> 32M max tamaño de fichero en lectura secuencial

		memory[*regDE + 33] = record & 0xff;
		memory[*regDE + 34] = (record >> 8) & 0xff;
		memory[*regDE + 35] = (record >> 16) & 0x3f;
		// max 3FFFFF records de 128 bytes -> 512M max fichero en lectura random
		if(log) { 
			char string[256];
			sprintf_s(string, "   Set Random Rec (update random access pointer) FCB=DE=$%04x, record=%d)\n", *regDE, record);
			log->OutLog(string);
		}
		break;
	case 37:
		// selectively reset disc drives
		if (log) log->OutLog("   Reset Drive (selectively reset disc drives)\n");
		for(int i = 0; i < 16; i++) {
			if(*regDE & (1 << i))
				read_only[i] = false;
		}
		*regA = 0;
		break;
	case 38:
		// MP/M: Access Drive
		if (log) log->OutLog("   MP/M: Access Drive\n");
		*regA = 0; // in CP/M 3 this is allways successfull
		break;
	case 39:
		// MP/M: Free Drive
		if (log) log->OutLog("   MP/M: Free Drive\n");
		*regA = 0xFF; // in CP/M 3 this is allways successfull
		break;
	case 40:
		// write random with zero fill
		*regA = RandomWrite(*regDE) ? 0 : 2;
		*regHL = *regA; // needed by BBC Basic
		break;
	case 41:
		// MP/M: Test and Write Record
		if (log) log->OutLog("   MP/M: Test and Write Record\n");
		*regA = 0xff; // in CP/M 3 this is allways successfull
		*regHL = *regHL & 0xff;
		break;
	case 42:
		// MP/M: Lock Record
		if (log) log->OutLog("   MP/M: Lock Record\n");
		*regA = 0; // in CP/M 3 this is allways successfull
		break;
	case 43:
		// MP/M: UnLock Record
		if (log) log->OutLog("   MP/M: UnLock Record\n");
		*regA = 0; // in CP/M 3 this is allways successfull
		break;
	case 44:
		// CP/M 3: Set Multi-Record Count
        // Set number of records to read/write at once
		if (version_id != 49) { UndefBDOSCall = true; *regA = 0; break; }
        int nrec; 
        nrec = (*regDE) & 0xff; 
        if ((nrec > 128) || (nrec < 1)) {
            *regA = 0xff; // returns error: invalid number of records
        } else {
            *regA = 0;  
            RecordsToReadAtOnce=nrec; 
        }
		if (log) {
            char sLog[100]; 
            sprintf_s(sLog, "   CP/M 3: Set Multi-Record Count to %d records\n", RecordsToReadAtOnce);
            log->OutLog(sLog); 
        }
		break;
	case 45:
        if (version_id == 0x28) {
            // Personal CP/M: Set Error Mode
    		if (log) log->OutLog("   Personal CP/M: Set Error Mode\n");
	    	// there is no return value
        } else if (version_id == 0x31) {
    		// CP/M 3: Set Error Mode
    		if (log) log->OutLog("   CP/M 3: Set Error Mode\n");
	    	// there is no return value
        } else {
            UndefBDOSCall = true; *regA = 0; break; 
        }
		break;
	case 46:
		// CP/M 3: Get Disk Free Space
		if (log) log->OutLog("   CP/M 3: Get Disk Free Space\n");
		*regA = 0xff; // this allways returns 16 * 256 free sectors
		memory[dma_addr + 0] = 0;
		memory[dma_addr + 1] = 0x10;
		memory[dma_addr + 2] = 0;
		break;
	case 47:
		// CP/M 3: Chain to Program
   	    if(log) {
			char s[80];
			char sLog[80];

			for(int i=0; i<80; i++) {
				s[i] = memory[dma_addr + i];
			}
			sLog[79] = 0;
			sprintf_s(sLog, "   CP/M 3: Chain to Program (UNSUPPORTED): %s\n", s);
		    log->OutLog(sLog);
		}
		// there is no return value
		break;
	case 48:
		// CP/M 3 / Personal CP/M: Flush Buffers
		if (log) log->OutLog("   CP/M 3: Flush Buffers\n");
		*regA = 0; // in CP/M 3 this is allways successfull
		break;
	case 49:
		// CP/M 3: Set/Get System Control Block 
		*regA = 0; 
		*regHL = 0;
        if (memory[*regDE + 1] != 0) {
    		if (log) log->OutLog("   CP/M 3: Set System Control Block (Not Implemented)\n");
        } else {
            int offset = memory[*regDE]; 
            if (offset == 0xf9) {
                extern int common_mem_start_addr; 
                *regA = common_mem_start_addr & 255; 
                *regHL = common_mem_start_addr; 
        		if (log) {
                    char sLog[100]; 
                    sprintf_s(sLog, "   CP/M 3: Get System Control Block: Common memory base address %04x\n", *regHL);
                    log->OutLog(sLog); 
                }
            } else {
    		    if (log) log->OutLog("   CP/M 3: Get System Control Block (offset not Implemented)\n");
            }
        }
		break;
	case 50:
		// CP/M 3: Direct BIOS call
   	    if(log) {
			char sLog[300];
			sprintf_s(sLog, "   CP/M 3: Direct BIOS call (UNSUPPORTED): DE=$%04x (BIOSPB Addr)\n", *regDE);
		    log->OutLog(sLog);
			sprintf_s(sLog, "   BIOSPB contents: FUNC=$%02x, AREG=$%02x, BCREG=$%04x, DEREG=$%04x, HLREG=$%04x\n", 
				               memory[*regDE], memory[*regDE + 1], 
							   memory[*regDE + 2] + (int)memory[*regDE + 3] * 256, 
							   memory[*regDE + 4] + (int)memory[*regDE + 5] * 256, 
							   memory[*regDE + 6] + (int)memory[*regDE + 7] * 256);
		    log->OutLog(sLog);
		}
		// there is no return value
		break;
	case 59:
		// CP/M 3: Load Overlay 
		if (log) log->OutLog("   CP/M 3: Load Overlay (UNSUPPORTED)\n");
		*regA = 0xff; // this allways returns error
		*regHL = *regHL & 0xff + 1;
		break;
	case 60:
		// CP/M 3: Call Resident System Extension 
		if (log) log->OutLog("   CP/M 3: Call Resident System Extension (RSX) (UNSUPPORTED)\n");
		*regA = 0xff; // this allways returns error
		*regHL = *regHL & 0xff + 1;
		break;
	case 98:
		// CP/M 3: Free Blocks
		if (log) log->OutLog("   CP/M 3: Free Blocks\n");
		*regA = 0; // in CP/M 3 this is allways successfull
		break;
	case 99:
		// CP/M 3: Truncate File
		if(TruncateFile(*regDE)) {
			*regA = 0;
		} else {
			*regA = 0xff;
			*regHL = *regHL & 0xff;
		}		
		break;
	case 100:
		// CP/M 3: Set Directory Label
		if (log) log->OutLog("   CP/M 3: Set Directory Label (UNSUPPORTED)\n");
		*regA = 0xff; // this allways returns error
		*regHL = *regHL & 0xff + 1;
		break;
	case 101:
		// CP/M 3: Get Directory Label
		if (log) log->OutLog("   CP/M 3: Set Directory Label (UNSUPPORTED)\n");
		*regA = 0xff; // this allways returns error
		*regHL = *regHL & 0xff + 1;
		break;
	case 102:
		// CP/M 3: Read File date and password
		if (log) log->OutLog("   CP/M 3: Read File date and password\n");
		*regA = 0; // in CP/M 3 this is allways successfull
		break;
	case 103:
		// CP/M 3: Write file XFCB
		if (log) log->OutLog("   CP/M 3: Write file XFCB\n");
		*regA = 0; // in CP/M 3 this is allways successfull
		break;
	case 104:
		// CP/M 3: Set Date and Time
		if (log) log->OutLog("   CP/M 3: Set Date and Time\n");
		// no return value
		break;
	case 105:
		// CP/M 3: Get Date and Time
		if (log) log->OutLog("   CP/M 3: Get Date and Time\n");
		SYSTEMTIME tmeCurrent;
		GetLocalTime(&tmeCurrent);
		memory[*regDE+0] = 1; //Day 1 = 1/1/1978
		memory[*regDE+1] = 0;
		int nn;
		nn = tmeCurrent.wHour;
		nn = ((nn / 10) << 4) + (nn % 10);
		memory[*regDE+2] = nn;
		nn = tmeCurrent.wMinute;
		nn = ((nn / 10) << 4) + (nn % 10);
		memory[*regDE+3] = nn;
		nn = tmeCurrent.wSecond;
		nn = ((nn / 10) << 4) + (nn % 10);
		*regA = nn;
		break;
	case 106:
		// CP/M 3: Set Default Password
		if (log) log->OutLog("   CP/M 3: Set Default Password\n");
		// no return value
		break;
	case 107:
		// CP/M 3: Return Serial Number
		if (log) log->OutLog("   CP/M 3: Return Serial Number\n");
		memory[*regDE+0] = 1; // Serial numebr: 1
		memory[*regDE+1] = 0;
		memory[*regDE+2] = 0;
		break;
	case 108:
		// Get/Set Program Return Code
		if (log) log->OutLog("   CP/M 3: Get/Set Program Return Code\n");
		if (*regDE == 0xffff) {
			*regHL = cpm3_return_code;
		} else {
			cpm3_return_code = *regDE;
		}
		break;
	case 109:
        if (version_id == 0x28) {
    		if (log) log->OutLog("   Personal CP/M: Get/Set Console Mode\n");
    		if (*regDE == 0xffff) {
	    		*regHL = 0;
		    }
        } else if (version_id == 0x31) {
    		if (log) log->OutLog("   CP/M 3: Get/Set Console Mode\n");
    		if (*regDE == 0xffff) {
	    		*regHL = 0;
		    }
        } else {
            UndefBDOSCall = true; *regA = 0; break; 
        }
		break;
	case 110:
		// get/set String Delimiter
		if (log) log->OutLog("   CP/M 3: Get/Set String Delimiter\n");
		if(*regDE == 0xffff)
			*regA = delimiter;
		else
			delimiter = *regDE & 0xff;
		break;
	case 111:
		// Print Block
		if (log) log->OutLog("   CP/M 3: Print Block\n");
		{
			uint16 addr;
			int len;
			addr = memory[*regDE] + (memory[*regDE+1] << 8);
			len = memory[*regDE+2] + (memory[*regDE+3] << 8);
			if (len > 1000) len = 1000;
			for(int i=0;i<len;i++) {
                console->PutChar(memory[addr+i], true);
                if (terminate_cpm_requested) break; 
            }
		}
		break;
	case 112:
		// List Block
		if (log) log->OutLog("   CP/M 3: List Block\n");
		break;
	case 113:
        if (version_id != 0x28) { UndefBDOSCall = true; *regA = 0; break; }
   		if (log) log->OutLog("   Personal CP/M: Direct Screen Function\n");
        // get the terminal function from addr pointed by DE
        int subfunc, col,row, ad;
        ad=*regDE; 
        subfunc=memory[ad];
        col    =memory[ad+1];
        row    =memory[ad+2];
        addr   =memory[ad+1] + memory[ad+2]*256; // addr of extended info
        if (subfunc==0) {
            // return supported functions
            *regHL = BDOS_BASE + 24; 
            if (log) log->OutLog("   SubFn=0 (return supported functions), Return Bitmap on address given by HL\n");
        } else if (subfunc==1) {
            // return emulated functions
            *regHL = BDOS_BASE + 28; 
            if (log) log->OutLog("   SubFn=1 (return emulated functions), Return Bitmap on address given by HL\n");
        } else if (subfunc==2) {
            // display size
            *regHL = 80 *256 + 24; // 80 cols, 24 lines
            if (log) log->OutLog("   SubFn=2 (display size), Return 80 cols, 24 lines in HL\n");
        } else if (subfunc==3){
            // identify terminal: returns HL = addr of "\x1b/K\x00" (ESC / K \0)
            if (log) log->OutLog("   SubFn=3 (identify terminal), Return addr of VT52 identification string (ESC / K \0)\n");
            *regHL = BDOS_BASE + 16; 
        } else if (subfunc==4) {
    		if (log) log->OutLog("   SubFn=4 (cursor up)\n");
            console->ExecCtrlSeqAction(CON_UP, 0, 0, 0);  // cursor up
        } else if (subfunc==5) {
    		if (log) log->OutLog("   SubFn=5 (cursor down)\n");
            console->ExecCtrlSeqAction(CON_DOWN, 0, 0, 0);  
        } else if (subfunc==6) {
    		if (log) log->OutLog("   SubFn=6 (cursor left)\n");
            console->ExecCtrlSeqAction(CON_LEFT, 0, 0, 0);  
        } else if (subfunc==7) {
    		if (log) log->OutLog("   SubFn=7 (cursor right)\n");
            console->ExecCtrlSeqAction(CON_RIGHT, 0, 0, 0);  
        } else if (subfunc==8) {
    		if (log) log->OutLog("   SubFn=8 (cursor home)\n");
            console->ExecCtrlSeqAction(CON_HOME, 0, 0, 0);  
        } else if (subfunc==9) {
    		if (log) log->OutLog("   SubFn=9 (cursor ON)\n");
            console->ExecCtrlSeqAction(CON_CUR_ON, 0, 0, 0);  
        } else if (subfunc==10) {
    		if (log) log->OutLog("   SubFn=10 (cursor OFF)\n");
            console->ExecCtrlSeqAction(CON_CUR_OFF, 0, 0, 0);  
        } else if (subfunc==11) {
            // set cursor to col, row
            if (log) {
                char sLog[100];
                sprintf_s(sLog, "   SubFn=11 (cursor pos) set at x=%d, y=%d\n", col-1, row-1); 
                log->OutLog(sLog);
            }
            console->ExecCtrlSeqAction(CON_POS_XY, 0, col-1, row-1); 
        } else if (subfunc==12) {
    		if (log) log->OutLog("   SubFn=12 (clear screen)\n");
            console->ExecCtrlSeqAction(CON_CLS, 0, 0, 0);  
        } else if (subfunc==13) {
    		if (log) log->OutLog("   SubFn=13 (erase to end of line)\n");
            console->ExecCtrlSeqAction(CON_EOL, 0, 0, 0);  
        } else if (subfunc==14) {
            // erase to end of screen
    		if (log) log->OutLog("   SubFn=14 (erase to end of screen)\n");
            console->ExecCtrlSeqAction(CON_EOS, 0, 0, 0);  
        } else if (subfunc==15) {
    		if (log) log->OutLog("   SubFn=15 (enter ANSI mode - not implemented)\n");
        } else if (subfunc==16) {
    		if (log) log->OutLog("   SubFn=16 (enter VT52 mode - not implemented)\n");
        } else if (subfunc==17) {
    		if (log) log->OutLog("   SubFn=17 (enter graphic mode - not implemented)\n");
        } else if (subfunc==18) {
    		if (log) log->OutLog("   SubFn=18 (exit graphic mode - not implemented)\n");
        } else if (subfunc==19) {
    		if (log) log->OutLog("   SubFn=19 (enter alternate keypad mode - not implemented)\n");
        } else if (subfunc==20) {
    		if (log) log->OutLog("   SubFn=20 (exit alternate keypad mode - not implemented)\n");
        } else if (subfunc==21) {
    		if (log) log->OutLog("   SubFn=21 (enter hold screen mode - not implemented)\n");
        } else if (subfunc==22) {
    		if (log) log->OutLog("   SubFn=22 (exit hold screen mode - not implemented)\n");
        } else if (subfunc==23) {
    		if (log) log->OutLog("   SubFn=23 (enter reverse video)\n");
            console->ExecCtrlSeqAction(CON_REVERSE_ON, 0, 0, 0);  // reverse on
        } else if (subfunc==24) {
    		if (log) log->OutLog("   SubFn=24 (exit reverse video)\n");
            console->ExecCtrlSeqAction(CON_REVERSE_OFF, 0, 0, 0);  // reverse on
        } else if (subfunc==25) {
    		if (log) log->OutLog("   SubFn=25 (reverse line-feed)\n");
            console->ExecCtrlSeqAction(CON_REVERSE_LF, 0, 0, 0);  // reverse on
        } else if (subfunc==26) {
    		if (log) log->OutLog("   SubFn=26 (enable wrap arround at end of line - not implemented)\n");
        } else if (subfunc==27) {
    		if (log) log->OutLog("   SubFn=27 (enable truncate chars at end of line - not implemented)\n");
        } else {
            if (log) {
                char sLog[100];
                sprintf_s(sLog, "   SubFn=%d unknown\n", subfunc); 
                log->OutLog(sLog);
            }
        }
		break;
	case 128:
		// CDOS: Read Console blocking no echo 
		if (version_id != 201) { UndefBDOSCall = true; *regA = 0; break; }
		// console input
		code = console->GetChar();
		// no echo
		*regA = code;
		if(log) { 
			char string[256];
			sprintf_s(string, "CDOS: Read Console (no echo, blocking) (A=$%02x): ", code);
			log->OutLog(string);
			log->OutLogOneChar(code);
			log->OutLog("\n");
		}
		
		break;

    case 129:
		// CDOS: get user register pointer
		if (version_id != 201) { UndefBDOSCall = true; *regA = 0; break; }
		if (log) log->OutLog("   CDOS: get user register pointer (not implemented)\n");
		*regA = 0;
		break;

    case 130:
		// CDOS: set user ctrl-c
		if (version_id != 201) { UndefBDOSCall = true; *regA = 0; break; }
		if (log) log->OutLog("   CDOS: set user ctrl-c (not implemented)\n");
		*regA = 0;
		break;

    case 131:
		// CDOS: read logical records
		if (version_id != 201) { UndefBDOSCall = true; *regA = 0; break; }
		if (log) log->OutLog("   CDOS: read logical records (not implemented)\n");
		*regA = 0;
		break;

    case 132:
		// CDOS: write logical records
		if (version_id != 201) { UndefBDOSCall = true; *regA = 0; break; }
		if (log) log->OutLog("   CDOS: write logical records (not implemented)\n");
		*regA = 0;
		break;

	case 134:
		// CDOS: parse ascii filename to FCB
		if (version_id != 201) { UndefBDOSCall = true; *regA = 0; break; }
        char file[20];
		// HL = addr of ascii "d:filename.ext" in mem lo load in the fcb
        // DE = the address of fcb to build up
        // sterminators = string of valid filename terminators (<32 and >127 are always terminators)
        *regHL = ParseFileName((uint16)(*regHL), (uint16)(*regDE), "/=,", file); // return HL=addr of last char of filename
		if (log) {
            char sLog[100];
            sprintf_s(sLog, "   CDOS: Parse filename '%s' to FCB\n", file); 
            log->OutLog(sLog);
        }
		break;

    case 135:
		// CDOS: update dir entry
		if (version_id != 201) { UndefBDOSCall = true; *regA = 0; break; }
		if (log) log->OutLog("   CDOS: update dir entry (not implemented)\n");
		*regA = 0;
		break;

    case 136:
		// CDOS: link to program (chain to program)
		if (version_id != 201) { UndefBDOSCall = true; *regA = 0; break; }
		if (log) log->OutLog("   CDOS: link to program (not implemented)\n");
		*regA = 0;
		break;

    case 137:
		// CDOS: Multiply
		// needed by cromemco cobol
		if (version_id != 201) { UndefBDOSCall = true; *regA = 0; break; }
		if (log) log->OutLog("   CDOS: Multiply Integers\n");
		*regDE = ((*regHL) * (*regDE)) & 0xffff;
		break;
	case 138:
		// CDOS: Divide
		if (version_id != 201) { UndefBDOSCall = true; *regA = 0; break; }
		if (log) log->OutLog("   CDOS: Divide Integers\n");
		int r,q;
		q = (*regHL) / (*regDE); r = (*regHL) % (*regDE);
		*regDE = r;
		*regHL = q;
		break;

    case 139:
		// CDOS: home drive
		if (version_id != 201) { UndefBDOSCall = true; *regA = 0; break; }
		if (log) log->OutLog("   CDOS: home drive (not implemented)\n");
		*regA = 0;
		break;

    case 140:
		// CDOS: eject diskette
		if (version_id != 201) { UndefBDOSCall = true; *regA = 0; break; }
		if (log) log->OutLog("   CDOS: eject diskette (not implemented)\n");
		*regA = 0;
		break;

    case 141:
		// CDOS: get CDOS version
		if (version_id != 201) { UndefBDOSCall = true; *regA = 0; break; }
		if (log) log->OutLog("   CDOS: get version\n");
		*regBC = 0x201;
		*regA = 0;
		break;

    case 142:
		// CDOS: set special crt function
		if (version_id != 201) { UndefBDOSCall = true; *regA = 0; break; }
		if (log) log->OutLog("   CDOS: set special crt function\n");
        // get the terminal function from DE
        int D,E;
        D=(*regDE) >> 8; E=(*regDE) & 0xff; 
        if (E!=0) {
            // cursor movement
            int x,y;
            x=(D-1); // x=0..79
            y=(E-1); // y=0..23
            if (log) {
                char sLog[100];
                sprintf_s(sLog, "   cursor pos at x=%d, y=%d\n", x, y); 
                log->OutLog(sLog);
            }
            console->ExecCtrlSeqAction(CON_POS_XY, 0, x, y); 
        } else if (D==0) { 
    		if (log) log->OutLog("   clear screen\n");
            console->ExecCtrlSeqAction(CON_CLS, 0, 0, 0);  // clear screen
        } else if (D==1) { 
    		if (log) log->OutLog("   home\n");
            console->ExecCtrlSeqAction(CON_HOME, 0, 0, 0);  // home
        } else if (D==2) { 
    		if (log) log->OutLog("   cursor left\n");
            console->ExecCtrlSeqAction(CON_LEFT, 0, 0, 0); // cursor left
        } else if (D==3) { 
    		if (log) log->OutLog("   cursor right\n");
            console->ExecCtrlSeqAction(CON_RIGHT, 0, 0, 0);  // cursor right
        } else if (D==4) { 
    		if (log) log->OutLog("   cursor up\n");
            console->ExecCtrlSeqAction(CON_UP, 0, 0, 0);  // cursor up
        } else if (D==5) { 
    		if (log) log->OutLog("   cursor down\n");
            console->ExecCtrlSeqAction(CON_DOWN, 0, 0, 0);  // cursor down
        } else if (D==6) { 
    		if (log) log->OutLog("   clear to end of line\n");
            console->ExecCtrlSeqAction(CON_EOL, 0, 0, 0);  // clear to end of line
        } else if (D==7) { 
    		if (log) log->OutLog("   clear to end of screen\n");
            console->ExecCtrlSeqAction(CON_EOS, 0, 0, 0);  // clear to end of screen
        } else if (D==8) { 
            if (log) log->OutLog("   intensity set to high light (implemented as Bright On)\n");                
            console->ExecCtrlSeqAction(CON_BRIGHT_ON, 0, 0, 0);  // bright on
        } else if (D==9) { 
            if (log) log->OutLog("   intensity set to low light (implemented as Bright On)\n");                
            console->ExecCtrlSeqAction(CON_BRIGHT_ON, 0, 0, 0);  // bright on
        } else if (D==10) { 
    		if (log) log->OutLog("   intensity set to normal\n");
            console->ExecCtrlSeqAction(CON_BRIGHT_OFF, 0, 0, 0);  // bright off
        } else if (D==11) { 
            if (log) log->OutLog("   keyboard enable (ignored)\n");                
        } else if (D==12) { 
            if (log) log->OutLog("   keyboard disable (ignored)\n");                
        } else if (D==13) { 
            if (log) log->OutLog("   dynamic function keys (ignored)\n");                
        } else if (D==14) { 
            if (log) log->OutLog("   static function keys (ignored)\n");                
        } else if (D==15) { 
            if (log) log->OutLog("   protected field begin (not implemented)\n");                
        } else if (D==16) { 
            if (log) log->OutLog("   protected field end (not implemented)\n");                
        } else if (D==17) { 
    		if (log) log->OutLog("   blink on\n");
            console->ExecCtrlSeqAction(CON_BLINK_ON, 0, 0, 0);  // blink on
        } else if (D==18) { 
    		if (log) log->OutLog("   blink off\n");
            console->ExecCtrlSeqAction(CON_BLINK_OFF, 0, 0, 0);  // blink off
        } else if (D==19) { 
            if (log) log->OutLog("   send from cursor pos to end of line (ignored)\n");                
        } else if (D==20) { 
            if (log) log->OutLog("   send from cursor pos to end of screen (ignored)\n");                
        } else if (D==21) { 
            if (log) log->OutLog("   transmit screen out aux port (ignored)\n");                
        } else if (D==22) { 
            if (log) log->OutLog("   delete char at cursor\n");                
            console->ExecCtrlSeqAction(CON_DEL_CHR, 0, 0, 0);  // delete char
        } else if (D==23) { 
            if (log) log->OutLog("   insert char at cursor\n");                
            console->ExecCtrlSeqAction(CON_INS_CHR, 0, 0, 0);  // insert char
        } else if (D==24) { 
    		if (log) log->OutLog("   delete line\n");
            console->ExecCtrlSeqAction(CON_DEL_LIN, 0, 0, 0);  // delete line 
        } else if (D==25) { 
    		if (log) log->OutLog("   insert line\n");
            console->ExecCtrlSeqAction(CON_INS_LIN, 0, 0, 0);  // insert line
        } else if (D==26) { 
            if (log) log->OutLog("   formated screen on (not implemented)\n");                
        } else if (D==27) { 
            if (log) log->OutLog("   formated screen off (not implemented)\n");                
        } else if (D==28) { 
    		if (log) log->OutLog("   reverse on\n");
            console->ExecCtrlSeqAction(CON_REVERSE_ON, 0, 0, 0);  // reverse on
        } else if (D==29) { 
    		if (log) log->OutLog("   reverse off\n");
            console->ExecCtrlSeqAction(CON_REVERSE_OFF, 0, 0, 0);  // reverse off
        } else if (D==30) { 
    		if (log) log->OutLog("   underline on\n");
            console->ExecCtrlSeqAction(CON_UNDER_ON, 0, 0, 0);  // underline on
        } else if (D==31) { 
    		if (log) log->OutLog("   underline off\n");
            console->ExecCtrlSeqAction(CON_UNDER_OFF, 0, 0, 0);  // underline off
        } else if (D==32) { 
            if (log) log->OutLog("   display message on (ignored)\n");                
            // status line is allways visible 
        } else if (D==33) { 
            if (log) log->OutLog("   display message off\n");
            console->ExecCtrlSeqAction(CON_CLEAR_STATUS_LINE, 0, 0, 0);  
        } else if (D==34) { 
            if (log) log->OutLog("   cpu message deposit (not implemented)\n");                
        } else if (D==35) { 
            if (log) log->OutLog("   insert char off (not implemented)\n");                
        } else if (D==36) { 
            if (log) log->OutLog("   graphic mode on (not implemented)\n");                
        } else if (D==37) { 
            if (log) log->OutLog("   graphic mode off (not implemented)\n");                
        } else if (D==38) { 
    		if (log) log->OutLog("   cursor on\n");
            console->ExecCtrlSeqAction(CON_CUR_ON, 0, 0, 0);  // cursor on
        } else if (D==39) { 
    		if (log) log->OutLog("   cursor off\n");
            console->ExecCtrlSeqAction(CON_CUR_OFF, 0, 0, 0);  // cursor off
        } else if (D==40) { 
            if (log) log->OutLog("   memory lock\n");                
            console->ExecCtrlSeqAction(CON_SET_TOP_LIN_LOCK, 0, 0, 0);  
        } else if (D==41) { 
            if (log) log->OutLog("   memory lock off\n");                
            console->ExecCtrlSeqAction(CON_RESET_ALL_LIN_LOCKS, 0, 0, 0);  
        } else if (D==42) { 
            if (log) log->OutLog("   line lock (not implemented)\n");                
        } else if (D==43) { 
            if (log) log->OutLog("   line unlock (not implemented)\n");                
        } else if (D==44) { 
            if (log) log->OutLog("   read char at cursor (not implemented)\n");                
        } else if (D==45) { 
            if (log) log->OutLog("   alarm on (ignored)\n");                
        } else if (D==46) { 
            if (log) log->OutLog("   alarm off (ignored)\n");                
        } else {
            if (log) log->OutLog("   unknown operation\n");                
        }
		// no return params
		break;

    case 143:
		// CDOS: set date
		if (version_id != 201) { UndefBDOSCall = true; *regA = 0; break; }
		if (log) log->OutLog("   CDOS: set date (not implemented)\n");
		*regA = 0;
		break;

    case 144:
		// CDOS: read date
		if (version_id != 201) { UndefBDOSCall = true; *regA = 0; break; }
        SYSTEMTIME lt;
        GetLocalTime(&lt);
        *regA = (uint8) lt.wDay;
        *regBC = lt.wMonth * 256 + lt.wYear-1900;             
		if (log) {
            char sLog[100];
            sprintf_s(sLog, "   CDOS: read date: A=%d Day, B=%d Month, C=%d Year-1900\n", 
                                lt.wDay, lt.wMonth, lt.wYear); 
            log->OutLog(sLog);
        }
		break;

    case 145:
		// CDOS: set time of day
		if (version_id != 201) { UndefBDOSCall = true; *regA = 0; break; }
		if (log) log->OutLog("   CDOS: set time of day (not implemented)\n");
		*regA = 0;
		break;

    case 146:
		// CDOS: read time of day
		if (version_id != 201) { UndefBDOSCall = true; *regA = 0; break; }
        GetLocalTime(&lt);
        *regA = (uint8) lt.wSecond;
        *regBC = lt.wMinute * 256 + lt.wHour;             
		if (log) {
            char sLog[100];
            sprintf_s(sLog, "   CDOS: read time of day: A=%d Seconds, B=%d Minutes, C=%d Hours\n", 
                                lt.wSecond, lt.wMinute, lt.wHour); 
            log->OutLog(sLog);
        }
		break;

    case 147:
		// CDOS: set program return code
		if (version_id != 201) { UndefBDOSCall = true; *regA = 0; break; }
		if (log) log->OutLog("   CDOS: set program return code (not implemented)\n");
		*regA = 0;
		break;

    case 148:
		// CDOS: set file attributes
		if (version_id != 201) { UndefBDOSCall = true; *regA = 0; break; }
		if (log) log->OutLog("   CDOS: set file attributes (not implemented)\n");
		*regA = 0;
		break;

    case 149:
		// CDOS: read disk label
		if (version_id != 201) { UndefBDOSCall = true; *regA = 0; break; }
		if (log) log->OutLog("   CDOS: read disk label (not implemented)\n");
		*regA = 0;
		break;

    case 150:
		// CDOS: turn motors off
		if (version_id != 201) { UndefBDOSCall = true; *regA = 0; break; }
		if (log) log->OutLog("   CDOS: turn motors off (not implemented)\n");
		*regA = 0;
		break;

    case 151:
		// CDOS: set bottom of ram
		if (version_id != 201) { UndefBDOSCall = true; *regA = 0; break; }
		if (log) log->OutLog("   CDOS: set bottom of ram (not implemented)\n");
		*regA = 0;
		break;

    case 152:
		// CDOS: read current record
		// CP/M 3: Parse FileName
		if (version_id == 49) { 
            // DE points to a pair of pointers:
            //      DEFW    ascii-address
            //      DEFW    fcb-address
            char file[20] = {0}; // 
    		int fn = memory[*regDE+0] + memory[*regDE+1]*256;  // fn points to ascii "d:filename.ext" in mem lo load in the fcb
            int fcb = memory[*regDE+2] + memory[*regDE+3]*256; // the address of fcb to build up
            // sterminators = string of valid filename terminators (<32 and >127 are always terminators)
            if ((fn >= 0xF000) || (fcb >= 0xF000)) {
                *regHL=0xFFFF; // invalid filename
            } else {
                fn = ParseFileName(fn, fcb, ";=><.:,[]/|", file); // return last addr of char of filename
                memory[fcb+0x1a]=0; // length of password
                // clear last 4 bytes of fcb
                memory[fcb+0x20]=memory[fcb+0x21]=memory[fcb+0x22]=memory[fcb+0x23]=0;
                fn++;
                char c=memory[fn]; 
                // returned in HL is 0FFFFh if the ASCII filename was invalid; 
                //                   0 if the ASCII filename was terminated with a zero or a carriage return; 
                //                   and otherwise the address of the next character after the filename.
                if ((c==0) || (c==13)) {
                    *regHL=0; 
                } else {
                    *regHL=fn; 
                }
            }
            if (log) {
                char sLog[100];
                sprintf_s(sLog, "   CP/M 3: Parse FileName: '%s' to FCB\n", file); 
                log->OutLog(sLog);
            }
        } else if (version_id == 201) { 
		    if (log) log->OutLog("   CDOS: read current record (not implemented)\n");
		    *regA = 0;
        } else { UndefBDOSCall = true; *regA = 0; break; }
		break;

    case 153:
		// CDOS: write current record
		if (version_id != 201) { UndefBDOSCall = true; *regA = 0; break; }
		if (log) log->OutLog("   CDOS: write current record (not implemented)\n");
		*regA = 0;
		break;

    case 154:
		// CDOS: check if allocated
		if (version_id != 201) { UndefBDOSCall = true; *regA = 0; break; }
		if (log) log->OutLog("   CDOS: check if allocated (not implemented)\n");
		*regA = 0;
		break;

    case 156:
        // CDOS list directory
		if (version_id != 201) { UndefBDOSCall = true; *regA = 0; break; }
		if (log) log->OutLog("   CDOS: list directory\n");

        char s[80];
        int nFiles, TotalKB; 
        int sv_dma_addr; 
        uint16 dummyHL; 
        sv_dma_addr = dma_addr; 
        dma_addr=*regDE; 

        nFiles=0; 
        TotalKB=0; 
        memset(s, 32, sizeof(s)); 

		// search for first
		if(SearchFirstFile(dma_addr, &dummyHL)) while(1) {
            int ex,s2,rc,record,sizeKB; 
            for (int i=0; i<8; i++) { // copy filename
                s[i]=memory[dma_addr + i + 1]; 
            }
            for (int i=0; i<3; i++) { // copy ext
                s[10+i]=memory[dma_addr + i + 9]; 
            }
            ex=memory[dma_addr + 12];
			s2=memory[dma_addr + 14];
			rc=memory[dma_addr + 15];
		    extend = (s2 << 5) + ex;
		    record = extend * 128 + rc; // get current record
            sizeKB=(record * 128) / 1024; 
            nFiles++;
            TotalKB+=sizeKB;
            sprintf_s(&s[14], 20, "%5dK           ", sizeKB); 
            for (int i=0; s[i]; i++) console->PutChar(s[i], false); 
            if ((nFiles & 1)==0) {console->PutChar(13, false); console->PutChar(10, false); }
    		// search for next
		    if(SearchNextFile(dma_addr, &dummyHL)==0) break;
		}
        if ((nFiles & 1)==1) {console->PutChar(13, false); console->PutChar(10, false); }
        sprintf_s(s, "*** %d Files, %d Entries, %d K Displayed, 999K Left ***", nFiles, nFiles, TotalKB);
        console->PutString(s);

        dma_addr = sv_dma_addr; 
		*regHL = *regA = 0; 
        break; 

    case 157:
		// CDOS: set options
		if (version_id != 201) { UndefBDOSCall = true; *regA = 0; break; }
		if (log) log->OutLog("   CDOS: set options (not implemented)\n");
		*regA = 0;
		break;

    case 158:
		// CDOS: delete extents
		if (version_id != 201) { UndefBDOSCall = true; *regA = 0; break; }
		if (log) log->OutLog("   CDOS: delete extents (not implemented)\n");
		*regA = 0;
		break;

    case 159:
		// CDOS: get master drive
		if (version_id != 201) { UndefBDOSCall = true; *regA = 0; break; }
		if (log) log->OutLog("   CDOS: get master drive\n");
		*regBC = *regBC & 0xff;
		*regA = 0;
		break;
	case 254:
		// CCP support BDOS call
		if (ccp_active == 0) { UndefBDOSCall = true; *regA = 0; break; }
		if (log) log->OutLog("   CCP BDOS call\n");
		int ccp_func; 
		ccp_func= *regBC >> 8;
		if (ccp_func == 128) {
			if (log) log->OutLog("   Save CCP\n");
			// save CCP: DE=start addr, HL=lenght in bytes
			ccp_base = *regDE; 
			ccp_len = *regHL;
			if (ccp_len > 32768) {*regA = 0xff; break; } // ccp too big
			for (int i=0; i<ccp_len; i++) ccp_mem[i] = memory[ccp_base + i]; // backup ccp 
		} else if (ccp_func == 129) {
			if (log) log->OutLog("   Deactivate CCP\n");
			ccp_active = 0;
		}
		*regA = 0;
		break;
	default:
		UndefBDOSCall = true; 
		*regA = 0;
	}

    if (version_id == 201) { 
        // CDOS preserves regs HL, BC, DE on entry except when returning values on them
        if ((num==138) || (num==134) || (num==27) || (num==17)|| (num==18)) { 
            /* return on HL */ 
        } else *regHL=sv_HL; // restore initial value
    }

	if(log) {
		if (UndefBDOSCall == true) {
			char string[256];
			sprintf_s(string, "   Unknown BDOS Call %d (A=$%02x, BC=$%04x, DE=$%04x, HL=$%04x)\n", num, *regA, *regBC, *regDE, *regHL);
			log->OutLog(string);
		}
	    if ((num != 1) && 
		    (num != 2) && 
			(num != 6) && 
			(num != 9) && 
			(num != 10) && 
			(num != 11)) {
			char string[256];
			sprintf_s(string, "   Done BDOS Call %d (HL=$%04x) A=$%02x\n", num, *regHL, *regA);
			log->OutLog(string);
		}
	}
	return retval;
}

/* FCB Layout

DR F1 F2 F3 F4 F5 F6 F7 F8 T1 T2 T3 EX S1 S2 RC  .FILENAMETYP....
AL AL AL AL AL AL AL AL AL AL AL AL AL AL AL AL  ................
CR R0 R1 R2                                      ....

The bytes in it have the following meanings: 
FCB+00h DR - Drive. 0 for default, 1-16 for A-P. In DOSPLUS,
             bit 7 can be set to indicate that the operation should work with
             subdirectories rather than files.
           
FCB+01h Fn - Filename, 7-bit ASCII. The top bits of the filename bytes
             (usually referred to as F1' to F8') have the following
             meanings:
               F1'-F4' - User-defined attributes. Any program can use
                        them in any way it likes. The filename in the
                        disc directory has the corresponding bits set.
               F5'-F8' - Interface attributes. They modify the 
                        behaviour of various BDOS functions or 
                        indicate error conditions. In the directory
                        these bits are always zero.
FCB+09h Tn - Filetype, 7-bit ASCII. T1' to T3' have the following
             meanings:
               T1' - Read-Only. 
               T2' - System (hidden). System files in user 0 can be
                    opened from other user areas.
               T3' - Archive. Set if the file has not been changed
                    since it was last copied.
FCB+0Ch EX - Current extent (0-31)
FCB+0Dh S1 - Reserved.   
FCB+0Eh S2 - Current extension high bits (0-63)
FCB+0Fh RC - Record Count of extent
FCB+10h AL - file's allocation blocks used 
FCB+20h CR - Current record within extent (0-127)
FCB+21h Rn - Random access record number (not CP/M 1). A 16-bit 
             value in CP/M 2 (with R2 used for overflow); an 18-bit
             value in CP/M 3. 

Record to be accesed with SEQUENTIAL READ/WRITE: 
	ex = memory[fcb_addr + 12] & 0x1f;
	s2 = memory[fcb_addr + 14] & 0x3f;
	cr = memory[fcb_addr + 32] & 0x7f;
	extend = (s2 << 5) + ex;
	record = extend * 128 + cr; // get current record

Read/Write sequential uses s2-ex-cr to acceses file record
program can set them to seek the file at a given 
record (0 -> (63*32 + 31)*128+127=262143 higher record)
max 64 * 32 = 2048 extents with 16K -> 32M max file size for sequential read/write

Open File only set s2 to zero -> if ex cr has are non-zero on open file 
is opened at ex-cr record (0 -> 31*128+127=4095 -> up to 4096*128=524 KB)
open also sets rc with the total number of records of opened file or 128 if 
file size > 16KB

On random read/write, the accesed receord is
  	 record = r0 + r1 << 8 + (r2 & 0x3f) << 16
That is max 3FFFFF records de 128 bytes -> 512M max file size for random read/write

max file size CP/M 3.0 is 03FFFF records (32M). s2 is anded with 0x3f
max file size CP/M 2.2 is 00FFFF records (8M). s2 is anded with 0x0f -> this is not enforces by CP/M Player



SearchFile sets ex s2 rc based of fileelength
	int records = (size+127) >> 7;
	int extents = records >> 7; 
	int rc = records & 127;
	int ex = extents & 31;
	int s2 = extents >> 5; if (s2 > 63) s2 = 63;
	memory[dma_addr + 12] = ex;
	memory[dma_addr + 14] = s2;
	memory[dma_addr + 15] = rc;

*/

uint16 CPM::LoadAndRunCCP()
{
		if (log) {
			char string[256];
			sprintf_s(string, "   Load and jump to CCP (PC=$%04x Len=$%04x)\n", ccp_base, ccp_len);
			log->OutLog(string);
		}
		for (int i=0; i<ccp_len; i++) memory[ccp_base + i] = ccp_mem[i]; // restore ccp 
		return ccp_base;
}


uint16 CPM::ParseFileName(uint16 fn, uint16 fcb, char * sterminators, char * file)
// fn = address in memory if ascii string "d:filename.ext" lo load in the fcb
// fcb = the address of fcb to build up
// sterminators = string of valid filename terminators (<32 and >127 are always terminators)
// return addr of last char of filename
// return in *file the parsed filename (to be printed in log). Must be char file[20]
{
    int c, ext, nfcb;
    char * fnterm; 
    // init 
	memory[fcb] = 0; for (int i=1; i<12;i++) memory[fcb+i] = 32; 
    memset(file, 0, 20); 
	ext = 0;
    // skip leading spaces
    while (memory[fn]==32) {fn=(fn+1)&0xffff;}
    // check drive letter
    if (memory[fn+1]==':') {
        c=memory[fn]; 
        memory[fcb]=c-'A'+1; // set the drive letter in fcb
        fn += 2; // skip drive letter "D:" (2 chars)
        file[0]=c; file[1]=':';
    }
    // scan filename
    nfcb=1; // filename starts at offset 1 into fcb
	for (;;) { 
		c = memory[fn++];
        if (c=='.') break; 
		if ((c >= 'a') && (c <= 'z')) c = c + 'A' - 'a';
        fnterm = sterminators; 
        if (fnterm) while (*fnterm) {
            if (c==*fnterm)  {
                c=0; // hit a filename terminator
                break; 
            } 
            fnterm++;
        }
		if ((c <= 32) || (c >= 128)) {
			return fn-1; // end of filename -> stop scanning. HL=last char of filename
		} else if (c=='*') {
            // fill filename with ?
            c='?'; 
            while (nfcb <= 8) {
                file[strlen(file)]=c;
                memory[fcb+nfcb]=c; nfcb++; 
            }
            continue; 
        }
        if (nfcb > 8) continue; // ignore filename with more than 8 chars
        file[strlen(file)]=c;
        memory[fcb+nfcb]=c; nfcb++; 
    }
    // scan extension
    nfcb=9;
    if (c=='.') {
        file[strlen(file)]='.';
        for (;;) { 
	        c = memory[fn++];
    		if ((c >= 'a') && (c <= 'z')) c = c + 'A' - 'a';
            fnterm = sterminators; 
            if (fnterm) while (*fnterm) {
                if (c==*fnterm)  {
                    c=0; // hit a filename terminator
                    break; 
                } 
                fnterm++;
            }
		    if ((c <= 32) || (c >= 128)) {
			    return fn-1; // end of filename -> stop scanning. HL=last char of filename
            } else if (c=='*') {
                // fill extension with ?
                c='?'; 
                while (nfcb <= 11) {
                    file[strlen(file)]=c;
                    memory[fcb+nfcb]=c; nfcb++; 
                }
                continue; 
            }
            if (nfcb > 11) continue; // ignore extension with more than 8 chars
            file[strlen(file)]=c;
            memory[fcb+nfcb]=c; nfcb++; 
        }
    }
    return 0; 
}

bool CPM::OpenFile(uint16 fcb_addr)
{
    // CDOS initializes cr ex so allways opens file at its start
    if (version_id == 201) { 
        memory[fcb_addr + 12] = 0; //ex 
        memory[fcb_addr + 32] = 0; //cr
    }
	int drive = (memory[fcb_addr] == 0) ? default_drive : memory[fcb_addr] - 1;

	if(log) {
		char mes[256], file[12];
		int record, ex, cr; 
		// s2 is cleared on opening
		ex = memory[fcb_addr + 12] & 0x1f;
		cr = memory[fcb_addr + 32] & 0x7f;
		record = ex * 128 + cr; // open file at this record 
		// max 32 extents de 16K -> 512K max seek por on opening file
		for(int i = 0; i < 11; i++)
			file[i] = memory[fcb_addr + i + 1];
		file[11] = '\0';
		if ((ex+cr) == 0) {
			sprintf_s(mes, "   OPEN %c: ('%s')\n", 'A'+drive, file);
		} else {
			sprintf_s(mes, "   OPEN %c: ('%s', record=%d) ex cr = $%02x $%02x\n", 'A'+drive, file, record, ex, cr);
		}
		log->OutLog(mes);
	}
	
	if(drive > 15)
		return false;
	
	if (IsFilePrefeched(fcb_addr)) ClearFilePrefetch();

	char file[MAX_PATH];
	int size = -1;
	int open_err = 0;

	if (!GetFullPath1(drive, &memory[fcb_addr + 1], file)) {
		open_err = 15; //Win32 error for ERROR_INVALID_DRIVE
	} else {
		FILEIO* fio = new FILEIO();
	
		if(fio->Fopen(file, FILEIO_READ_BINARY)) {
			size = fio->Size(); // check if file exists
			fio->Fclose();
		} else {
			open_err = errno;
		}

		// set RC -> record count for file len
		// needed for NS5BAS to load basic files
		if (size >= 128*128) { 
			memory[fcb_addr + 15] = 128;
		} else {
			memory[fcb_addr + 15] = (size+127) >> 7;
		}
		if (size >= 0) {
			// file to open not found -> no error in CP/M. OPEN is for read or write
		
			int block = size % 16384;
			for(int i = 0; i < 16; i++)
				memory[fcb_addr + i + 16] = (size > i * 1024) ? i + 1 : 0;
		
			// initialize fcb
			// does not init ex s1 rc at memory[fcb_addr + 12], + 13, + 15
			memory[fcb_addr + 14] = 0; // s2 is zero. If not cleared on open PascalP does not work

			// if EX or CR are cleard, DRI LINK does not work
			// does not init cr at memory[fcb_addr + 32] 
			// does not init r0 r1 r2 at [[fcb_addr + 33], +34, +35
		
			// Last Record Byte Count (CP/M Plus)
			if(memory[fcb_addr + 32] == 0xff)
				memory[fcb_addr + 32] = (block < 0) ? 0 : (block < 16384) ? ((block >> 7) & 0xff) : 127;
				
			if(log) {
			    char sLog[256];
				sprintf_s(sLog, "   Opened Ok '%s' - %d Bytes, %d record(s)\n", file, size, ((size+127) >> 7));
				log->OutLog(sLog);
			}

			return true;
		}
		delete fio;
	}

	if(log) {
	    char sLog[256];
	    sprintf_s(sLog, "   Cannot Open '%s' (errno %d)\n", file, open_err);
	    log->OutLog(sLog);
	}
	return false;
}

bool CPM::CloseFile(uint16 fcb_addr)
{
	if(log) {
		char mes[256], file[12];
		for(int i = 0; i < 11; i++)
			file[i] = memory[fcb_addr + i + 1];
		file[11] = '\0';
		sprintf_s(mes, "   CLOSE ('%s')\n", file);
		log->OutLog(mes);
	}
	
	int drive = (memory[fcb_addr] == 0) ? default_drive : memory[fcb_addr] - 1;
	if(drive > 15)
		return false;
	
	if (IsFilePrefeched(fcb_addr)) ClearFilePrefetch();

	char file[MAX_PATH];
	if (GetFullPath1(drive, &memory[fcb_addr + 1], file)) {
		FILEIO* fio = new FILEIO();
	
		if(fio->Fopen(file, FILEIO_READ_BINARY)) {
			int size = fio->Size();
			fio->Fclose();
			delete fio;
		
			int ex = (memory[fcb_addr + 12] & 0x1f) | (memory[fcb_addr + 13] << 5);
			int block = size - ex * 16384;
			for(int i = 0; i < 16; i++)
				memory[fcb_addr + i + 16] = (block > i * 1024) ? i + 1 : 0;
			
			if(log) {
			    char sLog[256];
			    sprintf_s(sLog, "   Closed Ok '%s' - %d Bytes\n", file, size);
				log->OutLog(sLog);
			}
			return true;
		}
		delete fio;
	}
	if(log) {
	    char sLog[256];
	    sprintf_s(sLog, "   Cannot Close '%s'\n", file);
	    log->OutLog(sLog);
	}
	return false;
}

bool CPM::SearchFirstFile(uint16 fcb_addr, uint16 * regHL)
{
	find_num = find_idx = 0;
	char path[MAX_PATH];
    SearchFileDirBlock = 0; 

	int drive;
	if (memory[fcb_addr] == '?') {
		// match any drive -> converted to match to default
		drive = default_drive;
	} else {
		drive = (memory[fcb_addr] == 0) ? default_drive : memory[fcb_addr] - 1;
	}
	if(drive > 15) {
		if(log) {
			char mes[256];
			sprintf_s(mes, "   Search in invalid drive: num > 15");
			log->OutLog(mes);
		}
		return false;
	} else if (drive_path[drive][0] == 0) {
		if(log) {
			char mes[256];
			sprintf_s(mes, "   Search Drive %d (%c:) - path not defined\n", drive, drive + 'A');
			log->OutLog(mes);
		}
		return false;
	} else {
		sprintf_s(path, "%s*.*", drive_path[drive]);
		if(log) {
			char mes[256], file[12];
			for(int i = 0; i < 11; i++)
				file[i] = memory[fcb_addr + i + 1];
			file[11] = '\0';
			sprintf_s(mes, "   SEARCH 1ST ('%s', drive=%d) at %s\n", file, drive, path);
			log->OutLog(mes);
		}
	}

	WIN32_FIND_DATA fd;
	HANDLE hFind = FindFirstFile(path, &fd);
	
	if(hFind != INVALID_HANDLE_VALUE) {
		do {
			if(!(fd.dwFileAttributes & FILE_ATTRIBUTE_DIRECTORY)) {
				char file[MAX_PATH], ext[MAX_PATH];
				strcpy_s(file, fd.cFileName);

				if(log) {
					char sLog[256];
					sprintf_s(sLog, "   File '%s' ", file);
					log->OutLog(sLog);
				}
				
				char* pt = strstr(file, ".");
				if(pt != NULL) {
					strcpy_s(ext, pt + 1);
					pt[0] = '\0';
				}
				else {
					ext[0] = '\0';
				}

				if((strlen(file) > 8) || (strlen(ext) > 3)) {
					if(log) {
						char sLog[256];
						sprintf_s(sLog, "-> Not visible to CP/M: filename len not 8.3 (is %d.%d)\n", strlen(file), strlen(ext));
						log->OutLog(sLog);
					}
					continue;
				}
				BYTE c;
				int nOk = 1;
				for (int i=0; i<8;i++) {
					c = toupper(file[i]);
					if (c == 0) break;
					if ((c == '<') || (c == '>') || (c == '.') || (c == ',') || 
						(c == ';') || (c == ':') || (c == '=') || (c == '?') || 
						(c == '[') || (c == ']') || (c == '_') || (c == ' ') || 
						(c  > 126)) {
						nOk = 0; 
						break;
					}
				}
				if (nOk == 1) for (int i=0; i<3;i++) {
					c = toupper(ext[i]);
					if (c == 0) break;
					if ((c == '<') || (c == '>') || (c == '.') || (c == ',') || 
						(c == ';') || (c == ':') || (c == '=') || (c == '?') || 
						(c == '[') || (c == ']') || (c == '_') || (c == ' ') || 
						(c  > 126)) {
						nOk = 0; 
						break;
					}
				}
				if (nOk == 0) {
					if(log) {
						char sLog[256];
						sprintf_s(sLog, "-> Not visible to CP/M: invalid char in filename: ");
						log->OutLog(sLog);
						log->OutLogOneChar(c);
						log->OutLog("\n");
					}
					continue;
				}

				{
					uint8 cmp[11];
					memset(cmp, 0x20, sizeof(cmp));
					int len = strlen(file);
					for(int i = 0; i < len; i++)
						cmp[i] = (uint8)file[i];
					len = strlen(ext);
					for(int i = 0; i < len; i++)
						cmp[i + 8] = (uint8)ext[i];
					bool flag = true; // si filename de fcb = '' -> matchea con cualquier file
					if (memory[fcb_addr+1]) for(int i = 0; i < 11; i++) {
						uint8 v1 = memory[fcb_addr + i + 1];
						uint8 v2 = cmp[i];
						v1 = ('a' <= v1 && v1 <= 'z') ? v1 + 'A' - 'a' : v1;
						v2 = ('a' <= v2 && v2 <= 'z') ? v2 + 'A' - 'a' : v2;
						if(v1 != v2 && v1 != '?') {
							flag = false;
							break;
						}
					}
					if (find_num >= MAX_FIND_FILE) {
						if(log) {
							char sLog[256];
							sprintf_s(sLog, "-> Too many files found (Max: %d)\n", MAX_FIND_FILE);
							log->OutLog(sLog);
						}
					} else if (!flag) {
						if(log) {
							char sLog[256];
							sprintf_s(sLog, "-> Does not match searched file spec\n");
							log->OutLog(sLog);
						}
					} else {
						// al least! file matched
						for(int i = 0; i < 11; i++) {
							uint8 v = cmp[i];
							find_files[find_num][i] = ('a' <= v && v <= 'z') ? v + 'A' - 'a' : v;
						}
						find_files[find_num][11] = drive;
						find_num++;
						if(log) {
							char sLog[256];
							sprintf_s(sLog, "-> File Match\n");
							log->OutLog(sLog);
						}
					}
				}
			}
		}
		while(FindNextFile(hFind, &fd));
		FindClose(hFind);
	}
	if(log) {
		char sLog[256];
		sprintf_s(sLog, "   Total: %d file(s) matched\n", find_num);
		log->OutLog(sLog);
	}

	if(find_num > 0) {
		int size = 0;
		if (GetFullPath1(find_files[find_idx][11], find_files[find_idx], path)) {
			FILEIO* fio = new FILEIO();
			if(fio->Fopen(path, FILEIO_READ_BINARY)) {
				size = fio->Size();
				fio->Fclose();
			}
			delete fio;
            
			memset(memory + dma_addr, 0, 32);
			for(int i = 0; i < 11; i++)
				memory[dma_addr + i + 1] = find_files[find_idx][i];
			memory[dma_addr + 13] = (size < 16384) ? ((size >> 7) & 0xff) : 127;
			for(int i = 0; i < 16; i++)
				memory[dma_addr + i + 16] = (size > i * 1024) ? i + 1 : 0;
			find_idx++;
	
			int records = (size+127) >> 7;
			int extents = records >> 7; 
			int rc = records & 127;
			int ex = extents & 31;
			int s2 = extents >> 5; if (s2 > 63) s2 = 63;
			memory[dma_addr + 12] = ex;
			memory[dma_addr + 14] = s2;
			memory[dma_addr + 15] = rc;

       		if (version_id == 201) { 
                // wordmaster 0.66 relies on HL=address of dir entry on dbos func call
                *regHL=dma_addr; 
            }

			if(log) {
			    char sLog[256];
			    sprintf_s(sLog, "   SearchFirstFile Ok '%s' - %d Bytes\n", path, size);
				log->OutLog(sLog);
			}

            // store dir entry en DMA + 32*SearchFileDirBlock;

			return true;
		}
	}
	if(log) {
	    char sLog[256];
	    sprintf_s(sLog, "   SearchFirstFile: File not found\n");
	    log->OutLog(sLog);
	}
	return false;
}

bool CPM::SearchNextFile(uint16 fcb_addr, uint16 * regHL)
{
	if(log) {
		char mes[256];
		sprintf_s(mes, "   SEARCH NEXT\n");
		log->OutLog(mes);
	}
	
	if(find_idx < find_num) {
		int size = 0;
		char path[MAX_PATH];
		if (GetFullPath1(find_files[find_idx][11], find_files[find_idx], path)) {
			FILEIO* fio = new FILEIO();
			if(fio->Fopen(path, FILEIO_READ_BINARY)) {
				size = fio->Size();
				fio->Fclose();
			}
			delete fio;

            // select next dir block
            SearchFileDirBlock = (SearchFileDirBlock + 1) & 3; 
            uint16 dma = dma_addr + 32*SearchFileDirBlock; 

			memset(memory + dma, 0, 32);
			for(int i = 0; i < 11; i++)
				memory[dma + i + 1] = find_files[find_idx][i];
			memory[dma + 13] = (size < 16384) ? ((size >> 7) & 0xff) : 127;
			for(int i = 0; i < 16; i++)
				memory[dma + i + 16] = (size > i * 1024) ? i + 1 : 0;
			find_idx++;

			int records = (size+127) >> 7;
			int extents = records >> 7; 
			int rc = records & 127;
			int ex = extents & 31;
			int s2 = extents >> 5; if (s2 > 63) s2 = 63;
			memory[dma + 12] = ex;
			memory[dma + 14] = s2;
			memory[dma + 15] = rc;

            if (version_id == 201) { 
                // wordmaster 0.66 relies on HL=address of dir entry on dbos func call
                *regHL=dma; 
            }

			if(log) {
			    char sLog[256];
			    sprintf_s(sLog, "   SearchNextFile Ok '%s' - %d Bytes\n", path, size);
			    log->OutLog(sLog);
			}
			return true;
		}
	}
	if(log) {
	    char sLog[256];
	    sprintf_s(sLog, "   SearchNextFile: No more Files\n");
	    log->OutLog(sLog);
	}
	return false;
}

bool CPM::RemoveFile(uint16 fcb_addr)
{
	if(log) {
		char mes[256], file[12];
		for(int i = 0; i < 11; i++)
			file[i] = memory[fcb_addr + i + 1];
		file[11] = '\0';
		sprintf_s(mes, "   DELETE ('%s')\n", file);
		log->OutLog(mes);
	}
	
	int drive = (memory[fcb_addr] == 0) ? default_drive : memory[fcb_addr] - 1;
	if(drive > 15) return false;

	if (submit_active) {
		if ((memory[fcb_addr +  1] == '$') && 
			(memory[fcb_addr +  2] == '$') && 
			(memory[fcb_addr +  3] == '$') && 
			(memory[fcb_addr +  4] == ' ') && 
			(memory[fcb_addr +  9] == 'S') && 
			(memory[fcb_addr + 10] == 'U') && 
			(memory[fcb_addr + 11] == 'B')) {
		// deleting $$$.SUB terminates submit batch file processing
			submit_active = 0;
		}
	}
	if (IsFilePrefeched(fcb_addr)) ClearFilePrefetch();
	
	char file[MAX_PATH];
	if (GetFullPath1(drive, &memory[fcb_addr + 1], file)) {
		return DeleteFile(file) ? true : false;
	} else {
		return false; 
	}
}

bool CPM::CreateNewFile(uint16 fcb_addr)
{
	if(log) {
		char mes[256], file[12];
		for(int i = 0; i < 11; i++)
			file[i] = memory[fcb_addr + i + 1];
		file[11] = '\0';
		sprintf_s(mes, "   CREATE ('%s')\n", file);
		log->OutLog(mes);
	}

	int drive = (memory[fcb_addr] == 0) ? default_drive : memory[fcb_addr] - 1;
	if(drive > 15)
		return false;
	
	// software read only
	if(read_only[drive])
		return false;

	if (IsFilePrefeched(fcb_addr)) ClearFilePrefetch();
	
	char file[MAX_PATH];
	if (!GetFullPath1(drive, &memory[fcb_addr + 1], file)) {
		return false;
	}
	FILEIO* fio = new FILEIO();
	
	if(fio->Fopen(file, FILEIO_READ_BINARY)) {
		fio->Fclose();
		delete fio;
		return false;
	}
	
	if(fio->Fopen(file, FILEIO_WRITE_BINARY)) {
		fio->Fclose();
		delete fio;
		
		// initialize fcb
		memory[fcb_addr + 12] = memory[fcb_addr + 13] = memory[fcb_addr + 14] = 0; // current extent
		memory[fcb_addr + 15] = 128; // rc - record count in extent
		memory[fcb_addr + 32] = 0; // seq record count cr
		// does not init r0 r1 r2 at [[fcb_addr + 33], +34, +35
		
		if(log) {
		    char sLog[256];
		    sprintf_s(sLog, "   CreateNewFile Ok '%s'\n", file);
		    log->OutLog(sLog);
		}
		return true;
	}
	delete fio;
	return false;
}

bool CPM::RenameFile(uint16 fcb_addr)
{
	if(log) {
		char mes[256], file_org[12], file_new[12];
		for(int i = 0; i < 11; i++)
			file_org[i] = memory[fcb_addr + i + 1];
		for(int i = 0; i < 11; i++)
			file_new[i] = memory[fcb_addr + i + 17];
		file_org[11] = file_new[11] = '\0';
		sprintf_s(mes, "   RENAME ('%s' -> '%s')\n", file_org, file_new);
		log->OutLog(mes);
	}
	
	int drive = (memory[fcb_addr] == 0) ? default_drive : memory[fcb_addr] - 1;
	if(drive > 15)
		return false;
	
	if (IsFilePrefeched(fcb_addr)) ClearFilePrefetch();
	if (IsFilePrefeched(fcb_addr+16)) ClearFilePrefetch();

	char file_org[MAX_PATH], file_new[MAX_PATH];
	if (!GetFullPath1(drive, &memory[fcb_addr + 1], file_org)) return false; 
	if (!GetFullPath1(drive, &memory[fcb_addr + 17], file_new)) return false; 
	return MoveFile(file_org, file_new) ? true : false;
}

bool CPM::TruncateFile(uint16 fcb_addr)
{
	int record = memory[fcb_addr + 33] | 
		         (memory[fcb_addr + 34] << 8) |
				 ((memory[fcb_addr + 34] & 3) << 16);

	if(log) {
		char mes[256], file[12];
		for(int i = 0; i < 11; i++)
			file[i] = memory[fcb_addr + i + 1];
		file[11] = '\0';
		sprintf_s(mes, "   TRUNCATE ('%s', record=%d)\n", file, record);
		log->OutLog(mes);
	}
	
	int drive = (memory[fcb_addr] == 0) ? default_drive : memory[fcb_addr] - 1;
	if(drive > 15)
		return false;
	
	if (IsFilePrefeched(fcb_addr)) ClearFilePrefetch();

	char file[MAX_PATH];
	if (!GetFullPath1(drive, &memory[fcb_addr + 1], file)) return false; 

	FILEIO* fio = new FILEIO();
	if(fio->Fopen(file, FILEIO_READ_BINARY)) {
		int size = fio->Size();
        if ((size << 7) <= record) {
			fio->Fclose();
			delete fio;
			return false;
		}
		fio->Ftruncate((record+1) * 128);
		fio->Fclose();
	}
	delete fio;
	return true;

}

bool CPM::ChangeFileAttributes(uint16 fcb_addr)
{
	if(log) {
		char mes[256], file[12];
		for(int i = 0; i < 11; i++)
			file[i] = memory[fcb_addr + i + 1];
		file[11] = '\0';
		sprintf_s(mes, "   CHANGE ATTRIB ('%s')\n", file);
		log->OutLog(mes);
	}

	int drive = (memory[fcb_addr] == 0) ? default_drive : memory[fcb_addr] - 1;
	if(drive > 15)
		return false;
	
	char file[MAX_PATH];
	if (!GetFullPath1(drive, &memory[fcb_addr + 1], file)) return false; 

	FILEIO* fio = new FILEIO();
	
	if(fio->Fopen(file, FILEIO_READ_BINARY)) {
		int size = fio->Size();
		fio->Fclose();
		delete fio;
		
		// Last Record Byte Count (CP/M Plus)
		int ex = (memory[fcb_addr + 12] & 0x1f) | (memory[fcb_addr + 13] << 5);
		int block = size - ex * 16384;
		memory[fcb_addr + 32] = (block < 0) ? 0 : (block < 16384) ? ((block >> 7) & 0xff) : 127;
		return true;
	}
	return false;
}

bool CPM::CalcFileSize(uint16 fcb_addr)
{
	int drive = (memory[fcb_addr] == 0) ? default_drive : memory[fcb_addr] - 1;
	if(drive > 15)
		return false;
	
	char file[MAX_PATH];
	if (!GetFullPath1(drive, &memory[fcb_addr + 1], file)) return false; 
	FILEIO* fio = new FILEIO();
	
	if(fio->Fopen(file, FILEIO_READ_BINARY)) {
		int size = fio->Size();
		int record = 0;
		if (size > 0) record = (size + 127) >> 7;
		memory[fcb_addr + 33] = record & 0xff;
		memory[fcb_addr + 34] = (record >> 8) & 0xff;
		memory[fcb_addr + 35] = (record >> 16) & 0x3f;
		fio->Fclose();
		delete fio;

		if(log) {
		    char sLog[256];
		    sprintf_s(sLog, "   CalcFileSize Ok '%s' - %d Bytes, %d Records\n", file, size, record);
		    log->OutLog(sLog);
		}

		return true;
	}
	delete fio;

	if(log) {
	    char sLog[256];
	    sprintf_s(sLog, "   Cannot CalcFileSize '%s'\n", file);
	    log->OutLog(sLog);
	}
	return false;
}

bool CPM::SequentialRead(uint16 fcb_addr)
{
	int record, ex, s2, cr, extend; 
	ex = memory[fcb_addr + 12] & 0x1f;
	s2 = memory[fcb_addr + 14] & 0x3f;
	cr = memory[fcb_addr + 32] & 0x7f;
	extend = (s2 << 5) + ex;
	record = extend * 128 + cr; // get current record

    int nrec = RecordsToReadAtOnce; 
    int dma = dma_addr; 
    while (1) {
        
    	if(log) {
	    	char mes[256], file[12];
		    for(int i = 0; i < 11; i++)
    			file[i] = memory[fcb_addr + i + 1];
	    	file[11] = '\0';
		    sprintf_s(mes, "   SEQ READ ('%s', record=%d)\n", file, record);
    		log->OutLog(mes);
	    }
	
    	if (!ReadFileFechetched(fcb_addr, dma, record)) return false;
	    
    	record++;

    	// save current record
	    cr = record & 0x7f;
	    extend = record >> 7;
	    ex = extend & 0x1f;
	    s2 = (extend >> 5) & 0x3f;
	    memory[fcb_addr + 32] = cr;
	    memory[fcb_addr + 12] = ex;
	    memory[fcb_addr + 14] = s2;

        nrec--;
        if (nrec < 1) break; 
        dma = (dma + 128) & 0xffff; 
    }
	
	if(log) {
	    char sLog[256];
	    sprintf_s(sLog, "   Read %d record(s) at dma_addr=$%04x: ", RecordsToReadAtOnce, dma_addr);
	    log->OutLog(sLog);
		for(int i=0; i<128; i++) {
			sLog[i] = memory[dma_addr+i];
			if ((sLog[i] < 32) || (sLog[i] > 127)) sLog[i] = '.';
		}
		sLog[128] = 13;
		sLog[129] = 10;
		sLog[130] = 0;
	    log->OutLog(sLog);
	}
	return true;
}

bool CPM::SequentialWrite(uint16 fcb_addr)
{
	int record, ex, s2, cr, extend; 
	ex = memory[fcb_addr + 12] & 0x1f;
	s2 = memory[fcb_addr + 14] & 0x3f;
	cr = memory[fcb_addr + 32] & 0x7f;
	extend = (s2 << 5) + ex;
	record = extend * 128 + cr; // get current record
	
	if(log) {
		char mes[256], file[12];
		for(int i = 0; i < 11; i++)
			file[i] = memory[fcb_addr + i + 1];
		file[11] = '\0';
		sprintf_s(mes, "   SEQ WRITE ('%s', record=%d)\n", file, record);
		log->OutLog(mes);
	}
	
	int drive = (memory[fcb_addr] == 0) ? default_drive : memory[fcb_addr] - 1;
	if(drive > 15)
		return false;
	
	if(read_only[drive])
		return false;
	
	if (IsFilePrefeched(fcb_addr)) ClearFilePrefetch();

	char file[MAX_PATH];
	if (!GetFullPath1(drive, &memory[fcb_addr + 1], file)) return false; 

	FILEIO* fio = new FILEIO();

	if(!fio->Fopen(file, FILEIO_READ_WRITE_BINARY)) {
		delete fio;
		return false;
	}
	if(fio->Fseek(record * 128, FILEIO_SEEK_SET)) {
		fio->Fclose();
		delete fio;
		return false;
	}

    int nrec = RecordsToReadAtOnce; 
    int dma = dma_addr; 
    while (1) {

    	if(fio->Fwrite(memory + dma, 1, 128) == 0) {
	    	fio->Fclose();
		    delete fio;
		    return false;
	    }

    	// ex, s1, cr
	    record++;

	    // save current record
	    cr = record & 0x7f;
	    extend = record >> 7;
	    ex = extend & 0x1f;
	    s2 = (extend >> 5) & 0x3f;
	    memory[fcb_addr + 32] = cr;
	    memory[fcb_addr + 12] = ex;
	    memory[fcb_addr + 14] = s2;

        nrec--;
        if (nrec < 1) break; 
        dma = (dma + 128) & 0xffff; 
    }

    fio->Fclose();
	delete fio;
	
	if(log) {
	    char sLog[256];
	    sprintf_s(sLog, "   Write %s: %d record(s), dma_addr=$%04x: ", file, RecordsToReadAtOnce, dma_addr);
	    log->OutLog(sLog);
		for(int i=0; i<128; i++) {
			sLog[i] = memory[dma_addr+i];
			if (sLog[i] < 32) sLog[i] = '.';
		}
		sLog[128] = 13;
		sLog[129] = 10;
		sLog[130] = 0;
	    log->OutLog(sLog);
	}
	return true;
}

bool CPM::RandomRead(uint16 fcb_addr)
{
	int record = memory[fcb_addr + 33] +
		         (memory[fcb_addr + 34] << 8) +
				 ((memory[fcb_addr + 35] & 0x3f) << 16);
	
	if(log) {
		char mes[256], file[12];
		for(int i = 0; i < 11; i++)
			file[i] = memory[fcb_addr + i + 1];
		file[11] = '\0';
		sprintf_s(mes, "   RANDON READ ('%s', record=%d)\n", file, record);
		log->OutLog(mes);
	}
	
	if (!ReadFileFechetched(fcb_addr, dma_addr, record)) return false;
	
	// no se incrementa el record leido

	// save current record
	int ex, s2, cr, extend; 
	cr = record & 0x7f;
	extend = record >> 7;
	ex = extend & 0x1f;
	s2 = (extend >> 5) & 0x3f;
	memory[fcb_addr + 32] = cr;
	memory[fcb_addr + 12] = ex;
	memory[fcb_addr + 14] = s2;
	
	if(log) {
	    char sLog[256];
	    sprintf_s(sLog, "   Read at dma_addr=$%04x: ", dma_addr);
	    log->OutLog(sLog);
		for(int i=0; i<128; i++) {
			sLog[i] = memory[dma_addr+i];
			if (sLog[i] < 32) sLog[i] = '.';
		}
		sLog[128] = 13;
		sLog[129] = 10;
		sLog[130] = 0;
	    log->OutLog(sLog);
	}
	return true;
}

bool CPM::RandomWrite(uint16 fcb_addr)
{
	int record = memory[fcb_addr + 33] +
		         (memory[fcb_addr + 34] << 8) +
				 ((memory[fcb_addr + 35] & 0x3f) << 16);
	
	if(log) {
		char mes[256], file[12];
		for(int i = 0; i < 11; i++)
			file[i] = memory[fcb_addr + i + 1];
		file[11] = '\0';
		sprintf_s(mes, "   RANDOM WRITE ('%s', drive= %d, record=%d)\n", file, memory[fcb_addr], record);
		log->OutLog(mes);
	}
	
	int drive = (memory[fcb_addr] == 0) ? default_drive : memory[fcb_addr] - 1;
	if(drive > 15)
		return false;
	
	// software read only
	if(read_only[drive])
		return false;
	
	if (IsFilePrefeched(fcb_addr)) ClearFilePrefetch();	

	char file[MAX_PATH];
	if (!GetFullPath1(drive, &memory[fcb_addr + 1], file)) return false; 

	FILEIO* fio = new FILEIO();
	
	if(!fio->Fopen(file, FILEIO_READ_WRITE_BINARY)) {
		delete fio;
		return false;
	}
	if(fio->Fseek(record * 128, FILEIO_SEEK_SET)) {
		fio->Fclose();
		delete fio;
		return false;
	}
	// write data
	if(fio->Fwrite(memory + dma_addr, 1, 128) == 0) {
		fio->Fclose();
		delete fio;
		return false; 
	}
	fio->Fclose();
	delete fio;
	
	// no se incrementa el record grabado

	// save current record
	int ex, s2, cr, extend; 
	cr = record & 0x7f;
	extend = record >> 7;
	ex = extend & 0x1f;
	s2 = (extend >> 5) & 0x3f;
	memory[fcb_addr + 32] = cr;
	memory[fcb_addr + 12] = ex;
	memory[fcb_addr + 14] = s2;
	
	if(log) {
	    char sLog[256];
	    sprintf_s(sLog, "   Write %s, dma_addr=$%04x: ", file, dma_addr);
	    log->OutLog(sLog);
		for(int i=0; i<128; i++) {
			sLog[i] = memory[dma_addr+i];
			if (sLog[i] < 32) sLog[i] = '.';
		}
		sLog[128] = 13;
		sLog[129] = 10;
		sLog[130] = 0;
	    log->OutLog(sLog);
	}
	return true;
}

bool CPM::GetFullPath1(int drive, uint8* src, char* dest)
{
	char file[9], ext[4];
	BYTE c;

	for(int i = 0; i < 8; i++) {
		c = src[i];
		if (c > 128) c = c - 128;
		if (c == 32) c = 0;
		file[i] = c;
	}
	file[8] = '\0';
	for(int i = 0; i < 3; i++) {
		c = src[i+8];
		if (c > 128) c = c - 128;
		if (c == 32) c = 0;
		ext[i] = c;
	}
	ext[3] = '\0';
	// Convert / char in CP/M filename in # Windows filename
	// Convert non valid Windows filename char into _
	// Convert filename/ext to uppercase
	for(int i = 0; i < 8; i++) {
		switch(file[i])	{
			case '/': file[i] = '#'; break; 
			case '\\': case ':': case '.':
			case '*': case '?': case '"': case '<':
			case '>': case '|': file[i] = '_';
		}
		if ((file[i] >= 'a') && (file[i] <= 'z')) file[i] = file[i] -'a'+'A';
    }
	for(int i = 0; i < 3; i++) {
		switch(ext[i])	{
			case '/': ext[i] = '#'; break; 
			case '\\': case ':': case '.':
			case '*': case '?': case '"': case '<':
			case '>': case '|': ext[i] = '_';
		}
		if ((ext[i] >= 'a') && (ext[i] <= 'z')) ext[i] = ext[i] -'a'+'A';
	}
	// If no filename use the default NONAME
	if (file[0] == 0) sprintf_s(file, "NONAME");
	if (drive_path[drive][0] == 0) {
		// no drive defined
		sprintf_s(dest, 80, "???\\%s.%s", file, ext);
		if(log) {
			char sLog[255];
			sprintf_s(sLog, "   *** BDOS Err On %c: Select - path not defined\n", drive+'A');
			log->OutLog(sLog);
		}
		return false;
	}
	if (drive > 0) {
		if(log) {
			char sLog[255];
			sprintf_s(sLog, "   BDOS Select Drive %d (%c:)\n", drive, 'A'+drive);
			log->OutLog(sLog);
		}
	}

	sprintf_s(dest, 255, "%s%s.%s", drive_path[drive], file, ext);

	console->disk_io_activity = 1;
	return true;
}


bool CPM::ReadFileFechetched(uint16 fcb_addr, uint16 dma_addr, int record)
{
	int drive = (memory[fcb_addr] == 0) ? default_drive : memory[fcb_addr] - 1;
	if(drive > 15) return false;

	int nBytesRead;

	if ((PrefetchEnabled == 0) ||
	    (record * 128 >= MaxPrefetchFileSize)) {
		// read outside max Prefetch file size
		if(log) {
			if (PrefetchEnabled != 0) {
				log->OutLog("   Read outside max Prefetch file size -> read from disk\n");
			}
		}

		char file[MAX_PATH];
		if (!GetFullPath1(drive, &memory[fcb_addr + 1], file)) return false; 
		FILEIO* fio = new FILEIO();

		if(!fio->Fopen(file, FILEIO_READ_BINARY)) {
			delete fio;
			return false;
		}
		if(fio->Fseek(record * 128, FILEIO_SEEK_SET)) {
			fio->Fclose();
			delete fio;
			return false;
		}
		nBytesRead = fio->Fread(memory + dma_addr, 1, 128);
		if(nBytesRead == 0) {
			fio->Fclose();
			delete fio;
			return false;
		}
		for (int i=nBytesRead; i<128;i++) {
			memory[dma_addr + i] = 26;
		}
		fio->Fclose();
		delete fio;
		return true;	
	}

	if (!IsFilePrefeched(fcb_addr)) {
		// populate Prefetch
		char file[MAX_PATH];
		if (!GetFullPath1(drive, &memory[fcb_addr + 1], file)) return false; 
		FILEIO* fio = new FILEIO();
	
		if(!fio->Fopen(file, FILEIO_READ_BINARY)) {
			delete fio;
			return false;
		}
		ClearFilePrefetch();
		nBytesRead = fio->Fread(PrefetchFileData, 1, MaxPrefetchFileSize);
		if (nBytesRead < 0) {
			fio->Fclose();
			delete fio;
			return false;
		}
		fio->Fclose();
		delete fio;
		for (int i=0; i<12; i++) PrefetchFileFCB[i] = memory[fcb_addr + i];
		PrefetchFileLen = nBytesRead;
		if(log) {
			char mes[256];
			sprintf_s(mes, "   Load %d bytes into Prefetch Cache for file: %s\n", PrefetchFileLen, file);
			log->OutLog(mes);
		}
		// pad prefetched last record with #1A (ascii EOF)
		for (int i=nBytesRead; i<=(nBytesRead | 127);i++) {
			if (i >= MaxPrefetchFileSize) break;
			PrefetchFileData[i] = 26;
		}
	}
	// read from Prefetch
	int iOrg = record * 128;
	int iDest = dma_addr;
	if (iOrg >= PrefetchFileLen) {
		if(log) {
			log->OutLog("   Read unwritten data (EOF)\n");
		}
		return false;
	}
	for (int i=0; i<128; i++) {
		memory[iDest++] = PrefetchFileData[iOrg++];
	}
	console->disk_io_activity = 1;
	return true;
}

bool CPM::IsFilePrefeched(uint16 fcb_addr) {
	if (PrefetchFileLen < 0) return FALSE;
	for (int i=0; i<12;i++) {
		if (memory[fcb_addr+i]!= PrefetchFileFCB[i]) return FALSE;
	}	
	if(log) log->OutLog("   Prefetch File Cache Hit\n");
	return TRUE;
} 

void CPM::ClearFilePrefetch()
{
	if(log) {
		if (PrefetchFileLen != -1) {
			log->OutLog("   Clear Prefetch File Cache\n");
		}
	}

	PrefetchFileLen = -1;
}	

int CPM::has_xsub_pending_chars()
{
	if (xsub_active == 0) return 0; // no xsub active

    // get char from submit file
	int c = submit_file[0];
	if (c == 0) {
		xsub_active = 0; // xsub ended
		return 0;
	}

    // check if expect in progress
    if (console->ExpectString(2, NULL)) {
        // yes! expect in progress, will not continue reading submit file
        // to feed the prog input until PutChar honors the expected string       
        return 0; 
    }

    // check if we should wait before notify a char is ready to be read from submit_file
    if ((xsub_wait_counter==-10000) && (xsub_wait_counter_ms)) {
        // wait until xsub_wait_counter_ms expres
        int n=xsub_wait_counter_ms - GetTickCount(); // when the wait expires
        if ((n<0) || (n>1000*1000)) {
            // the wait time has expired. clean up
            xsub_wait_counter = xsub_delay;
            xsub_wait_counter_ms=0;
            if (console) if (console->log) console->log->OutLog("\n[WAIT expired]\n");
        } else {
            // wait in progress
            return 0; 
        }
    } else if (xsub_wait_counter < xsub_delay) {
        // still waiting 
        xsub_wait_counter++; 
		return 0; 
	}
    // no wait in progress, no expect in progress -> can cntinue the processing of submit file

    // is c a ";expect" command?
    if (c == 255) {
        // yes, a expect command
        // are we already expecting a string?
        // if YES, should wait for the previous expect to be stisfied before processing the current one on submit_file
        // so return without delivering any char from submit file
        if (console->ExpectString(2, NULL)) return 0; 
        // if NO expect in progress -> setup new expect 
        char sExpect[255];
        int len = submit_file[1];
        for (int i=0; i<len; i++) { sExpect[i]=submit_file[2+i]; }
        sExpect[len]=0; 
        console->ExpectString(1, sExpect); 
 	    // remove expect string from submit file
        for (int i=0;i<16*1024-1;i++) {
   		    c = submit_file[i] = submit_file[i+len+2];
    	    if (c == 0) break;
        }
        // now we are expecting a string to be printed. 
        // do not Continue reading submit_file until this expected string is matched
        return 0; 
    } 
    // not an expect expect command
    // is c a ";wait" command?
    if (c==254) {
        // yes! read the wait value
        int n=( (submit_file[1] & 127) + (submit_file[2] & 127)*128); 
        if (n>=10000) {
            // wait in range 10000.. -> wallclock wait value is in seconds
            n=n-10000; // get the wait value, in seconds
            xsub_wait_counter_ms=GetTickCount() + n*1000; // when the wait expires
            xsub_wait_counter = -10000;
            if (console) if (console->log) {
                char sMsg[100];
                sprintf_s(sMsg, "\n[Start WAIT: %d seconds]\n", n); 
                console->log->OutLog(sMsg); 
            }
        } else {
            xsub_wait_counter_ms=0; // no wait based on wallclock
            xsub_wait_counter = -n; // init wait counter
            if (console) if (console->log) {
                char sMsg[100];
                sprintf_s(sMsg, "\n[Start WAIT: %d counter]\n", n); 
                console->log->OutLog(sMsg); 
            }
        }
    	// remove wait from submit file
	    for (int i=0;i<16*1024-1;i++) {
		    c = submit_file[i] = submit_file[i+3];
		    if (c == 0) break;
	    }
        return 0;
    }

    // here c has a valid charater ready to be feed into the program input

    // at last! return the waiting char
    return c;
}


int CPM::return_xsub_pending_char()
{
    xsub_wait_counter = xsub_delay; // cancel any wait pending

    // safety: check a char is ready from submit file
	if (has_xsub_pending_chars()==0) return 0; 

    // get the char from submit file
    int c_xsub = submit_file[0];
    xsub_wait_counter = 0; // reset wait count

	// remove char from submit file
    int c;
	for (int i=0;i<16*1024-1;i++) {
		c = submit_file[i] = submit_file[i+1];
		if (c == 0) break;
	}
    if ((submit_file[0] == 255) || (submit_file[0] == 254)) { // ;expect or ;wait?
        // following this char there is a command in submit file
        xsub_wait_counter = xsub_delay; // cancel any wait pending
        has_xsub_pending_chars(); // this triggers any expect/wait following current returned char
    }

    if (console) if (console->log) {
        // log chars inyected in program input stream from xsub file
        char sLog[10];
        if (c_xsub <= 32) {
            sprintf_s(sLog, "{->#%d}", c_xsub); 
        } else {
            sprintf_s(sLog, "{->%c}", c_xsub); 
        }
        console->log->OutLog(sLog); 
    }
    // note: the chars from xsub file are not translated according to PCKey redefinition
    // they are sent to program exactly as they are stated
	return c_xsub;
}
