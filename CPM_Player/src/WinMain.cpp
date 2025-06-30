#include "stdafx.h"

#include <shellapi.h>
#include <commdlg.h>

#include "CPM_Player.h"
#include "fileio.h"
#include "console.h"
#include "cpm.h"

// externs 
extern HWND hWnd; // to CPM_Player

// forwards 
void LoadStartupSettings();
int LoadSettings(char *inifilename, bool UpdateScree_flag, char *comfilepath);
void SetMainWindow(HWND hWnd);
void RunCPM(char* folder, char* fileOrCCP);
void RunCPMFile(LPCTSTR lpstrFile, bool IsFile);

CONSOLE* console;
CPM* cpm;

char module_path[MAX_PATH];
char openfile_path[MAX_PATH];
char recent_folder[RECENT_MAX][MAX_PATH];
char recent_file[RECENT_MAX][MAX_PATH];
int recent_cnt;

char PCKeyDef[MAX_PCKEYS][MAX_PCKEYS_LEN+2];
char paste_text[MAX_PASTE] = {0};

LOGFONT logfont;
int columns, lines, has_status_line;
int version;
int tpa_limit;
int common_mem_start_addr; 
int cursor_type; 
bool console_echo; 
int iobyte; 
bool upper_case_only;
int terminal_type;
int use_RG512_card; 
int dazzler_joy_mode; // autodetect dazzler joy
int GSX_mouse_read; // use by internal GSX driver when reading the mouse
int GSX_color;      // =1 if interal GSX driver uses 8 colors

char TermCtrlSeq[MAX_CTRL_SEQ][MAX_CRTL_SEQ_LEN];
int TermCtrlSeqAction[MAX_CTRL_SEQ+1];
int TermCtrlSeqActionParam[MAX_CTRL_SEQ+1];
char TermCtrlSeqReply[MAX_TERM_REPLIES][MAX_TERM_REPLIES_LEN];
char CustomTerminalName[128];

int	PrefetchEnabled = 1; 
int	xsub_delay = 5;
int	use_log_file = 0;
bool 	use_screen_log = 0;
bool 	use_printer_log = 0;
bool 	display_cps_ips = 0;
bool 	display_disk_io = 0;
int 	cpu_max_ips;
int 	terminal_max_cps;
char 	editor_exe[MAX_PATH];
LPVOID  ccp_com_addr;
DWORD   ccp_com_len;
LPVOID  mbasic_com_addr;
DWORD   mbasic_com_len;
int     cpu_log = 0;
int     cpu_addr_log = 0; 

void StartupScreen() {
    char mes[200];

	memset(paste_text, 0, sizeof(paste_text));

	console->Reset();
	console->InitGetStringHistory();
	console->SetMode('T', cursor_type);
	console->SetMode('L', use_log_file);
	console->SetMode('E', console_echo);
	console->SetMode('C', 0); // reset max cps on terminal
	console->SetMode('Y', terminal_type);
	console->SetMode('S', use_screen_log);
	console->SetMode('P', use_printer_log);
	console->SetMode('I', display_cps_ips);
	console->SetMode('D', display_disk_io);
	console->SetMode('U', upper_case_only);

    sprintf_s(mes, "Welcome to CP/M Player for Win32 %s \r\n", CPM_Player_version);
	console->PutString(mes);
	console->PutString("\r\n");
    console->PutString("Use File-Open menu to run a CP/M-80 Program File (.COM, .SUB or .BAS) \r\n");
    console->PutString("Press [Enter] to open CCP Command Console on last execution folder\r\n");
	console->PutString("Press [Cursor Up] to retrieve last run\r\n");
	console->PutString("Drag and Drop Directory to open CCP in this folder as A:\r\n");
	console->PutString("Drag and Drop CP/M-80 file to run \r\n");
	console->PutString("\r\n");
	console->PutString("\r\n");

	cpm->SetMode('V', version);
	cpm->SetMode('L', use_log_file);
	cpm->SetMode('B', tpa_limit);
	cpm->SetMode('S', 0);
}

void ViewFile(char* file) {

	char path[MAX_PATH];

	sprintf_s(path, MAX_PATH, "%s%s", module_path, file);
	ShellExecute(hWnd, NULL, editor_exe, 
	             path, module_path, SW_SHOW);
}

void SetTerminal_tpa_limit() 
{
	tpa_limit = 0; // default tpa
	if (terminal_type == CRT_KAYPRO) tpa_limit = 0xE400; 
		// Kaypro: TPA up to E400
		// video at $3000 (128 cols x 32 lines)
		// video available if out 28, $80
	if (terminal_type == CRT_OSBORNE) tpa_limit = 0xC000;
		//Osborne 1: TPA ends at CB00, video at F000 allways available
		//Osborne executive: TPA ends at F000. 
		//Least common denominator: TPA ends at C000
		//Video available if out 0,bit7*128 + bit6*64
		//if bit7=1 -> character generator (only write) at $0000-$1000
		//             Normal charset $0000-$07FF
		//             Alternate charset $0800-$0FFF
		//if bit6=1 -> video ram at $C000-$CFFF (128 cols x 32 lines)
		//             attrib ram at $D000-$DFFF    
		//                attrib bits, bit7=Hi, Bit6=Underline
		//                bit5=blink, bit4=use alternate font
	if (terminal_type == CRT_VIO) tpa_limit = 0xE000;
		//IMSIA VIO Video Card: TPA ends at E000 (suposes 4k for BDOS), 
        //video at F000 allways available. write command at mem F7FF. 
        // Firmware F800..FFFF: 
        //    F800 Init
        //    F803 print char 
		//command written to F7FF:
		//if bit0  -> 0=80 cols, 1=40 cols
		//   bit1  -> 0=24 lines, 1=12 lines
        //   bit32 -> 00=screen blanked
        //            01=display chars $80..$FF, bit7 of each char =0 -> normal video, =1 -> reverse video
        //            10=display chars $00..$7F, bit7 of each char =0 -> normal video, =1 -> reverse video
        //            11=display chars $00..$FF, no reverse video
        //   bit4  -> 0=normal, 1=invert video
	if (terminal_type == CRT_DAZZLER) tpa_limit = 0xE000;
		// Cromemco Dazzler: TPA ends at E000 (suposes 4k for BDOS), 
        // Even if can be changed, video ram starts typically at F000.
    if (terminal_type == CRT_TERM125) tpa_limit = 0xB000;
		//WaveMate Terminal-125 Video Card: TPA ends at B000 (suposes 4k for BDOS), 
        //video at C000 allways available. 
}

void InitCPMPlayer1(void)
// called from InitInstance before CreateWindow
{
	GetModuleFileName(NULL, module_path, MAX_PATH);
	int pt = strlen(module_path);
	while(module_path[pt] != '\\') pt--;
	module_path[pt + 1] = '\0';
	
	strcpy_s(openfile_path, MAX_PATH, module_path);

	LoadStartupSettings();
	
	int window_width, window_height;
	console = new CONSOLE();
	console->GetWindowSize(&logfont, columns, lines, 
                          (terminal_type == CRT_KAYPRO) ? 1:has_status_line, // kaypro allways have a status line
                          &window_width, &window_height);
	
	HMODULE hModule = GetModuleHandle(NULL); // get the handle to the current module (the executable file)
	HRSRC hResource = FindResource(hModule, MAKEINTRESOURCE(IDR_CCPCOMFILE), RT_RCDATA); // substitute RESOURCE_ID and RESOURCE_TYPE.
	HGLOBAL hMemory = LoadResource(hModule, hResource);
	ccp_com_addr = LockResource(hMemory);               // points to z80 code for CCP command processor for CP/M
	ccp_com_len = SizeofResource(hModule, hResource);
	hResource = FindResource(hModule, MAKEINTRESOURCE(IDR_MBASICCOMFILE), RT_RCDATA); // substitute RESOURCE_ID and RESOURCE_TYPE.
	hMemory = LoadResource(hModule, hResource);
	mbasic_com_addr = LockResource(hMemory);            // points to z80 code for Microsoft BASIC 5.2 interpreter
	mbasic_com_len = SizeofResource(hModule, hResource);

  	RECT rct = {0, 0, window_width, window_height};
	AdjustWindowRectEx(&rct, WS_OVERLAPPED | WS_CAPTION | WS_SYSMENU | WS_VISIBLE | WS_MINIMIZEBOX, TRUE, 0);

	HDC hdc = CreateDC("DISPLAY", NULL, NULL, NULL);
	int width = GetDeviceCaps(hdc, HORZRES);
	int height = GetDeviceCaps(hdc, VERTRES);
	int dest_x = (int)((width - (rct.right - rct.left)) / 2);
	int dest_y = (int)((height - (rct.bottom - rct.top)) / 2);

}

void InitCPMPlayer2(void)
// To be called from InitInstance after UpdateWindow
{
	// timer for cursor blink & screen refresh, at 1000/FPS milliseconds rate 
    // FPS=30 frames/sec -> timer set to 1000/30 = 34 msec;
	SetTimer(hWnd, 1, 1000 / FPS, NULL);


	//Accept .COM files frop
	DragAcceptFiles(hWnd, TRUE);

	console->Initialize(hWnd, &logfont);
	cpm = new CPM(console);

	StartupScreen();
	SetMainWindow(hWnd);
    console->RequestRefreshScreen(true);

}

void ExitCleanup(void)
// to be called in _tWinMain just before returning
{
	DragAcceptFiles(hWnd, FALSE);

	console->Terminate();
	cpm->Terminate();
	
	if(cpm) delete cpm;
	if(console) delete console;

	cpm = NULL;
	console = NULL;
}

void EditCopy(VOID)
{
	BYTE scr[CONS_Y_MAX*CONS_X_MAX+256];
	int nlen = 0;

	if (!console) return;
	console->GetScreenChars(scr, sizeof(scr));
	while (scr[nlen] != 0) nlen++;

	HGLOBAL hglbCopy;
	LPTSTR  lptstrCopy; 

    if (!OpenClipboard(hWnd)) return; 
    EmptyClipboard(); 
 
       // Allocate a global memory object for the text. 
 
    hglbCopy = GlobalAlloc(GMEM_MOVEABLE, nlen+1); 
    if (hglbCopy == NULL) 
    { 
        CloseClipboard(); 
        return; 
    } 
 
    // Lock the handle and copy the text to the buffer. 
 
    lptstrCopy = (LPTSTR) GlobalLock(hglbCopy); 
    memcpy(lptstrCopy, &(scr[0]), nlen); 
    lptstrCopy[nlen] = 0;    // null character 
    GlobalUnlock(hglbCopy); 
 
    // Place the handle on the clipboard. 
 
    SetClipboardData(CF_TEXT, hglbCopy); 

    CloseClipboard(); 
}

void EditPaste(VOID)
{
	HGLOBAL   hglb; 
    char*     lpstr; 
    char      s[MAX_PASTE];

	if (!IsClipboardFormatAvailable(CF_TEXT)) return; 
    if (!OpenClipboard(hWnd)) return; 
    if (!cpm) return; 
    if (!console) return; 
    if (cpm->IsRunning()==0) return; 
 
    hglb = GetClipboardData(CF_TEXT); 
    if (hglb != NULL) { 
       lpstr = (char *) GlobalLock(hglb); 
       if (lpstr != NULL)  { 
			// save text to be pasted 
		    int nlen = sizeof(paste_text)-1;
			if ((int)strlen(lpstr) < nlen) nlen = strlen(lpstr);
			memcpy(s, lpstr, nlen);
			s[nlen] = 0;
		    GlobalUnlock(hglb); 
       } 
	}
    CloseClipboard(); 

    // copy to paste_text global var
    cpm->console->PasteToKeyboard(s);

}

int ParseString(char *sIn, char *sOut, int size)
// sIn = ^c #nn ";" ABC "Hola " ;comment
// sOut = \x03\nn\0x41\0x42\0  <- max size chars
// return number of chars stored in sOut
{
	// parse sIn
	int bCtrlFlag = 0;
	int bNumFlag = 0;
    int bLiteral = 0; 
	int nChar = 0;
	int iKey = 0;
	int c;
    for (int i=0; i<size; i++) *(sOut+i)=0; // clear destination string
	for (int i=0; i<(int)strlen(sIn); i++) {
		c = sIn[i];
		if (c == 0) break;
        if (c == 9) c=32; else if (c < 32) break; 
        if ((c == '"') && (bLiteral==0)) {
            // start a literal 
            bLiteral=1;
			bCtrlFlag = 0;
			bNumFlag = 0;
        } else if ((c == '"') && (bLiteral==1)) {
            // literal end
            bLiteral=0;
        } else if (bLiteral) {
            // literal character, use it
            goto AddChar; 
        } else if ((c == '#') && (sIn[i+1] >= '0') && (sIn[i+1] <= '9')) {
			// el siguiente char es un numero -> es una definicion 
			// de char no printable #nnn
			nChar = 0;
			bNumFlag = 1;
		} else if ((bNumFlag) && (c >= '0') && (c <= '9')) {
			nChar = nChar * 10 + c - '0';
			if  ((sIn[i+1] < '0') || (sIn[i+1] > '9')) {
				// el siguiente char no es un numero -> terminar 
				// definición del char 
				bNumFlag = 0;
				if (iKey >= size) break;
				*(sOut+iKey) = (nChar & 255);
                iKey++;
			}
		} else if (c == ';') {
            // comment ends parsing
            break; 
		} else if (c == 32) {
			// ignorar espacios
			continue;
		} else if (c == '^') {
			bCtrlFlag = 1;
		} else if ((bCtrlFlag) && (c >= 'A') && (c <= '_')) { // ^_ is chr(31)
			c = c - 'A' + 1;
			bCtrlFlag = 0;
			if (iKey >= size) break;
			*(sOut+iKey) = c;
            iKey++;
		} else {
          AddChar:
			bCtrlFlag = 0;
			bNumFlag = 0;
			if (iKey >= size) break;
			*(sOut+iKey) = c;
            iKey++;
		}
	}
    return iKey; 
}

void PCKeySet(int PCKey, char *s)
{
	// set the CPM definition for a PC Key
    int n; 
	int iFound = -1;

	for (int i = 0; i<MAX_PCKEYS; i++) {
		if (PCKeyDef[i][0] == 0) {
			// empty slot found
			iFound = i;
			break;
		}
		if (PCKeyDef[i][0] == PCKey) {
			// redefine key
			iFound = i;
			break;
		}
	}
	if (iFound < 0) return; // cannot save key (table full)

	// save PC key code
	

	// parse CPM definition
    n=ParseString(s, &PCKeyDef[iFound][1], MAX_PCKEYS_LEN); 
    if (n) {
        PCKeyDef[iFound][0] = PCKey; // if valid definition, save PC key code
    }
}

void PCKeyGet(int PCKey, char *s)
{
	// get the CPM definition for a PC Key
	int iFound = -1;
	s[0] = 0;

	for (int i = 0; i<MAX_PCKEYS; i++) {
		if (PCKeyDef[i][0] == PCKey) {
			iFound = i;
			break;
		}
	}
	if (iFound < 0) return; // cannot find the key 

	// return CPM definition in s
	int i = 0;
	int c;
	for (int iKey=0; iKey<MAX_PCKEYS_LEN; iKey++) {
		c = PCKeyDef[iFound][1+iKey];
		if (c == 0) {
			s[i++] = 0;
			break;
		}
		if ((c >= 1) && (c < 32)) {
			s[i++] = '^';
			s[i++] = c + 'A' - 1;
		} else {
			s[i++] = c;
		}
	}
}


void SaveSettings()
{
	char path[MAX_PATH];
	char s[1024];
	sprintf_s(path, "%scpm.ini", module_path);
	
	FILEIO* fio = new FILEIO();
	if(fio->Fopen(path, FILEIO_WRITE_ASCII)) {
		fio->Fprintf("\n");
		fio->Fprintf("; CP/M Player settings file\n");
		fio->Fprintf("; https://github.com/rsanchovilla/CPM_Player\n");
        fio->Fprintf("");
		fio->Fprintf("\n");
		fio->Fprintf("\n");

        fio->Fprintf("; Set folder for CP/M units B:, C:, ... P: \n");
        fio->Fprintf("; folder must be terminated with '\\' \n");
        fio->Fprintf("; Unit A: will default to folder of loaded .COM/.SUB/.BAS program \n");
        fio->Fprintf("; if not set, the unit B: will default to '.\\Drive_B\\\n");
        fio->Fprintf("; if folder defined starts with '.', it is relative to loaded program folder \n");
    	for(int i = 1; i < 5; i++) {
            sprintf_s(s, "Drive_%c=%s", 'A'+i, cpm->defined_drive_path[i]);
            if ((i>4) && (cpm->defined_drive_path[i]==0)) continue;
            fio->Fprintf(s);
		    fio->Fprintf("\n");
        }
	    fio->Fprintf("\n");
        
        fio->Fprintf("; Columns can be 40, 80 or 132\n");
		sprintf_s(s, "Screen Columns=%d\n", columns);
		fio->Fprintf(s);
		fio->Fprintf("\n");
		fio->Fprintf("; Lines can be 24 or 48\n");
		sprintf_s(s, "Screen Lines=%d\n", lines);
		fio->Fprintf(s);
		fio->Fprintf("\n");
		fio->Fprintf("; if =1, the console has an additional status line as line 25\n");
		sprintf_s(s, "Status Line=%d\n", has_status_line);
		fio->Fprintf(s);
		fio->Fprintf("\n");
        fio->Fprintf("; Screen Cursor: 0=No cursor, 1=Underscore cursor, 2=Block cursor\n");
		sprintf_s(s, "Screen Cursor=%d\n", cursor_type);
		fio->Fprintf(s);
		fio->Fprintf("\n");
		fio->Fprintf("; Terminal type: \n");
		fio->Fprintf(";     0=ANSI/VT100/VT52/H19/Z19\n");
		fio->Fprintf(";     1=Kaypro/ADM-3A\n");
		fio->Fprintf(";     3=Osborne/Televideo 9XX\n");
		fio->Fprintf(";     4=Custom text terminal\n");
		fio->Fprintf(";     5=IMSAI VIO\n");
		fio->Fprintf(";     6=Cromemco Dazzler\n");
		fio->Fprintf(";          Joy1 keys: stick -> PC Cursor keys; Button 1..4 -> Keypad 0 1 2 3 \n");
		fio->Fprintf(";          Joy2 keys: stick -> A D S W; button 1..4 -> G H J K \n");
        fio->Fprintf(";     7=WaveMate Terminal-125\n");
        fio->Fprintf(";     8=Tektronix 4010/4014\n");
        fio->Fprintf(";          Clear screen -> ESC; Activate GIN -> Home \n");
		sprintf_s(s, "Terminal Type=%d\n", terminal_type);
		fio->Fprintf(s);

        fio->Fprintf("\n");
		fio->Fprintf("; Dazzler JS-1 JoyStick Mode: \n");
		fio->Fprintf(";     0=autodetect when dazzler terminal type is set (default value)\n");
		fio->Fprintf(";     1 to 127 =step increment on joy position when key pressed on PC keyboard\n");
		fio->Fprintf(";     -1=disabled\n");
		sprintf_s(s, "Joy Mode=%d\n", dazzler_joy_mode);
		fio->Fprintf(s);      

        fio->Fprintf("\n");
		fio->Fprintf("; Use Digital Engeneering RG512 Retro-Graphics card: \n");
		fio->Fprintf(";     0=not used\n");
		fio->Fprintf(";     1=enabled for selected terminal type\n");
		sprintf_s(s, "Use RG512 card=%d\n", use_RG512_card);
		fio->Fprintf(s);      

		fio->Fprintf("\n");
		fio->Fprintf("; When using GSX driver DDPMPLY.RPL: \n");
		fio->Fprintf(";     1=Use color drawing on screen (default) \n");
		fio->Fprintf(";     0=Use B/W (green drawing) \n");
		sprintf_s(s, "GSX Color=%d\n", GSX_color);
		fio->Fprintf(s);      

        fio->Fprintf("\n");
		fio->Fprintf("; CustomTerminalName=The Terminal Name\n");
		fio->Fprintf("; CtrlSeq: nn,nn,nn ... = action\n");
		fio->Fprintf(";    nn     character code value (in decimal)\n");
		fio->Fprintf(";           can be 'c for an ascii character code \n");
		fio->Fprintf(";           can be ^c for an control code (^A means code 1)\n");
		fio->Fprintf(";           up to 7 char codes allowed. Can be X to get a param.\n");
		fio->Fprintf(";           max two params\n");
		fio->Fprintf(";    action is what happeds when Control Sequence is issued\n");
		fio->Fprintf(";           by program. Many CtrlSeq can have same action.\n");
		fio->Fprintf(";           Posible actions:\n");
		fio->Fprintf(";              CR                     Carriadge return\n");
		fio->Fprintf(";              CRLF                   Carriadge Return and Line Feed\n");
        fio->Fprintf(";              LF                     Line feed (scrolls up if needed)\n");
        fio->Fprintf(";              REVERSE_LF             Reverse Line feed (scrolls down if needed)\n");
		fio->Fprintf(";              BACKSPACE              BackSpace\n");
		fio->Fprintf(";              LEFT                   Cursor left\n");
		fio->Fprintf(";              RIGHT                  Cursor right\n");
		fio->Fprintf(";              UP                     Cursor up\n");
		fio->Fprintf(";              DOWN                   Cursor down\n");
		fio->Fprintf(";              HOME                   Home\n");
		fio->Fprintf(";              CLS                    Clear Screen\n");
		fio->Fprintf(";              EOS                    Erase to end of screen\n");
		fio->Fprintf(";              EOL                    Erase to end of line\n");
		fio->Fprintf(";              EBL                    Erase from begin of line up to (and including) cursor position\n");
		fio->Fprintf(";              POS_YX_NN              Cursor pos y+nn x+nn (nn is 1..255)\n");
		fio->Fprintf(";              POS_XY_NN              Cursor pos x+nn y+nn (nn is 1..255)\n");
   		fio->Fprintf(";              WRITE_STATUS_LINE_MSG  Start writing to status line \n");
		fio->Fprintf(";              END_STATUS_LINE_MSG    Terminate writing to status line\n");
		fio->Fprintf(";              CLEAR_STATUS_LINE      Clear and hide status line \n");
		fio->Fprintf(";              SET_LIN_LOCK_NN        Lock line n+nn\n");
		fio->Fprintf(";              RESET_LIN_LOCK_NN      Unlock line n+nn\n");
		fio->Fprintf(";              SET_TOP_LIN_LOCK       Lock lines above cursor\n");
		fio->Fprintf(";              RESET_ALL_LIN_LOCKS    Unlock all lines\n");
		fio->Fprintf(";              REVERSE_TOGGLE         Toggle inverse video\n");
		fio->Fprintf(";              REVERSE_ON             Reverse On\n");
		fio->Fprintf(";              REVERSE_OFF            Reverse Off\n");
		fio->Fprintf(";              BRIGHT_ON              Bright On\n");
		fio->Fprintf(";              BRIGHT_OFF             Bright Off\n");
		fio->Fprintf(";              BLINK_ON               Blink On\n");
		fio->Fprintf(";              BLINK_OFF              Blink Off\n");
		fio->Fprintf(";              UNDER_ON               Underline On\n");
		fio->Fprintf(";              UNDER_OFF              Underline Off\n");
		fio->Fprintf(";              RESET_ATTR             Reset attributes\n");
		fio->Fprintf(";              SET_ATTR_abcd          Set attributes\n");
		fio->Fprintf(";                                     a=blink, b=bright, c=underline, d=reverse\n");
		fio->Fprintf(";                                     values: 0=off, 1=on, 2=toggle, 9=do not change\n");
		fio->Fprintf(";              CUR_ON                 Cursor visible On\n");
		fio->Fprintf(";              CUR_OFF                Cursor visible Off\n");
		fio->Fprintf(";              INS_LIN                Insert Line\n");
		fio->Fprintf(";              DEL_LIN                Delete Line\n");
		fio->Fprintf(";              INS_CHR                Insert character in line\n");
		fio->Fprintf(";              DEL_CHR                Delete character from line\n");
		fio->Fprintf(";              EEL                    Erase entire line\n");
		fio->Fprintf(";              CUR_SAVE               Save cursor position\n");
		fio->Fprintf(";              CUR_RESTORE            Restore cursor position\n");
		fio->Fprintf(";              CUR_REPORT             Terminal report cursor por to host\n");
		fio->Fprintf(";              REPLY text             Terminal reply to an enquiry from host\n");
        fio->Fprintf(";                                     text follows same rules as Key definition text\n");
		fio->Fprintf(";              PAGE_0                 Select page 0 to be displayed\n");
		fio->Fprintf(";              PAGE_1                 Select page 1 to be displayed\n");
		fio->Fprintf(";              PAGE_2                 Toggle page to be displayed\n");
		fio->Fprintf(";              SCROLL_NN_abcd         scroll text in screen (nn is 1..255)\n");
		fio->Fprintf(";                                     a=0 -> normal scroll, a=1 -> reverse scroll\n");
		fio->Fprintf(";                                     b=0 -> scroll one line\n");
        fio->Fprintf(";                                      =1 -> scroll lines given in param 1 (+nn)\n");
        fio->Fprintf(";                                      =2 -> scroll lines given in param 2 (+nn)\n");
		fio->Fprintf(";                                     c=0 -> scroll from top of screen\n");
        fio->Fprintf(";                                      =1 -> scroll from line given in param 1 (+nn)\n");
        fio->Fprintf(";                                      =2 -> scroll from line given in param 2 (+nn)\n");
		fio->Fprintf(";                                     d=0 -> scroll for full screen size \n");
        fio->Fprintf(";                                      =1 -> scroll for number of lines given in param 1 (+nn)\n");
        fio->Fprintf(";                                      =2 -> scroll for number of lines given in param 2 (+nn)\n");
		fio->Fprintf(";              NOP                    Does nothing\n");
		fio->Fprintf("; Examples: \n");
		fio->Fprintf(";    CtrlSeq: 27,'=,X,X = POS_YX_32\n");
		fio->Fprintf(";    stands for ESC = y+32 x+32 -> ADM3-like cursor positioning\n");
		fio->Fprintf(";    CtrlSeq: ^K = UP\n");
		fio->Fprintf(";    stands for Televideo-like cursor up\n");
		fio->Fprintf(";\n");
		sprintf_s(s, "CustomTerminalName=%s\n", CustomTerminalName);
		fio->Fprintf(s);
		for (int iCtrl = 0; iCtrl<MAX_CTRL_SEQ; iCtrl++) {
			if (TermCtrlSeqAction[iCtrl] == 0) break;
			fio->Fprintf("CtrlSeq: ");
			// Prt TermCtrlSeq(iCtrl);
			BYTE c, d;
			for (int i = 0;i<MAX_CRTL_SEQ_LEN;i++) {
				c = TermCtrlSeq[iCtrl][i];
				if (c == 0) break;
				if (i > 0) fio->Fprintf(",");
				if (c==255) {
					sprintf_s(s, "X");
				} else {
					sprintf_s(s, "%d", c);
				}
				fio->Fprintf(s);
			}
			fio->Fprintf(" = ");
			c = TermCtrlSeqAction[iCtrl];
			d = TermCtrlSeqActionParam[iCtrl];
			switch(c) {
				case CON_NOP: {fio->Fprintf("NOP"); break;}
				case CON_CR: {fio->Fprintf("CR"); break;}
				case CON_LEFT: {fio->Fprintf("LEFT"); break;}
				case CON_RIGHT: {fio->Fprintf("RIGHT"); break;}
				case CON_DOWN: {fio->Fprintf("DOWN"); break;}
				case CON_UP: {fio->Fprintf("UP"); break;}
				case CON_EOS: {fio->Fprintf("EOS"); break;}
				case CON_EOL: {fio->Fprintf("EOL"); break;}
				case CON_EBL: {fio->Fprintf("EBL"); break;}
				case CON_CLS: {fio->Fprintf("CLS"); break;}
				case CON_HOME: {fio->Fprintf("HOME"); break;}
				case CON_POS_YX: {sprintf_s(s, "POS_YX_%d", d);
						  fio->Fprintf(s); break;}
				case CON_POS_XY: {sprintf_s(s, "POS_XY_%d", d);
						  fio->Fprintf(s); break;}
				case CON_REVERSE_ON: {fio->Fprintf("REVERSE_ON"); break;}
				case CON_REVERSE_OFF: {fio->Fprintf("REVERSE_OFF"); break;}
				case CON_BRIGHT_ON: {fio->Fprintf("BRIGHT_ON"); break;}
				case CON_BRIGHT_OFF: {fio->Fprintf("BRIGHT_OFF"); break;}
				case CON_BLINK_ON: {fio->Fprintf("BLINK_ON"); break;}
				case CON_BLINK_OFF: {fio->Fprintf("BLINK_OFF"); break;}
				case CON_UNDER_ON: {fio->Fprintf("UNDER_ON"); break;}
				case CON_UNDER_OFF: {fio->Fprintf("UNDER_OFF"); break;}
				case CON_CUR_ON: {fio->Fprintf("CUR_ON"); break;}
				case CON_CUR_OFF: {fio->Fprintf("CUR_OFF"); break;}
				case CON_INS_LIN: {fio->Fprintf("INS_LIN"); break;}
				case CON_DEL_LIN: {fio->Fprintf("DEL_LIN"); break;}
				case CON_EEL: {fio->Fprintf("EEL"); break;}
				case CON_RESET_ATTR: {fio->Fprintf("RESET_ATTR"); break;}
				case CON_REVERSE_TOGGLE: {fio->Fprintf("REVERSE_TOGGLE"); break;}
				case CON_CRLF: {fio->Fprintf("CRLF"); break;}
				case CON_REVERSE_LF: {fio->Fprintf("REVERSE_LF"); break;}
				case CON_LF: {fio->Fprintf("LF"); break;}
				case CON_CUR_SAVE: {fio->Fprintf("CUR_SAVE"); break;}
				case CON_CUR_RESTORE: {fio->Fprintf("CUR_RESTORE"); break;}
				case CON_BACKSPACE: {fio->Fprintf("BACKSPACE"); break;}
				case CON_CUR_REPORT: {fio->Fprintf("CUR_REPORT"); break;}
				case CON_REPLY: {sprintf_s(s, "REPLY %s", TermCtrlSeqReply[d]);
						  fio->Fprintf(s); break;}
                case CON_INS_CHR: {fio->Fprintf("INS_CHR"); break;}
				case CON_DEL_CHR: {fio->Fprintf("DEL_CHR"); break;}
				case CON_SET_ATTR: {sprintf_s(s, "SET_ATTR_%04d", d);
						  fio->Fprintf(s); break;}
				case CON_SET_LIN_LOCK: {sprintf_s(s, "SET_LIN_LOCK_%d", d);
						  fio->Fprintf(s); break;}
				case CON_RESET_LIN_LOCK: {sprintf_s(s, "RESET_LIN_LOCK_%d", d);
						  fio->Fprintf(s); break;}
                case CON_RESET_ALL_LIN_LOCKS: {fio->Fprintf("RESET_ALL_LIN_LOCKS"); break;}    
                case CON_SET_TOP_LIN_LOCK: {fio->Fprintf("SET_TOP_LIN_LOCK"); break;}  
                case CON_WRITE_STATUS_LINE_MSG: {fio->Fprintf("CON_WRITE_STATUS_LINE_MSG"); break;}  
                case CON_END_STATUS_LINE_MSG: {fio->Fprintf("CON_END_STATUS_LINE_MSG"); break;}  
                case CON_CLEAR_STATUS_LINE: {fio->Fprintf("CON_CLEAR_STATUS_LINE"); break;}  
				case CON_PAGE: {sprintf_s(s, "PAGE_%d", d);
						  fio->Fprintf(s); break;}
				case CON_SCROLL: {sprintf_s(s, "CON_SCROLL_%02d_%04d", d / 10000, d % 10000);
						  fio->Fprintf(s); break;}
            }
			fio->Fprintf("\n");
		}
		fio->Fprintf("\n");
		fio->Fprintf("; Console Echo: 0=No echo, 1=echo on\n");
		sprintf_s(s, "Console Echo=%d\n", console_echo);
		fio->Fprintf(s);
		fio->Fprintf("\n");
		fio->Fprintf("; Upper Case Only: 0=Allow upper and lower case, 1=only uppercase\n");
		sprintf_s(s, "Upper Case Only=%d\n", console_echo);
		fio->Fprintf(s);

		fio->Fprintf("\n");
		fio->Fprintf("; Font for console\n");
		sprintf_s(s, "Font Name=%s\n", logfont.lfFaceName);
		fio->Fprintf(s);
		sprintf_s(s, "Font Height=%d\n", logfont.lfHeight);
		fio->Fprintf(s);
		sprintf_s(s, "Font Width=%d\n", logfont.lfWidth);
		fio->Fprintf(s);

		fio->Fprintf("\n");
		fio->Fprintf("; Use Log Files: 0=do not create log files. \n");
		fio->Fprintf(";                1=Create cpm.log and console.log files in application directory\n");
		sprintf_s(s, "Use Log Files=%d\n", use_log_file ? 1 : 0);
		fio->Fprintf(s);

        extern int max_log_lines; 
        fio->Fprintf("\n");
		fio->Fprintf("; Max lines in Log file\n");
        fio->Fprintf("; format: Max Log Lines=nnnn\n");
        fio->Fprintf(";     or: Max Log Lines=nnnK\n");
        fio->Fprintf(";     or: Max Log Lines=nnnM\n");
        sprintf_s(s, "; If zero or no value: use the default value %dK \n", max_log_lines/1000 );
		fio->Fprintf(s);
        if ((max_log_lines<1) || (max_log_lines == MAX_LOG_LINES)) {
            sprintf_s(s, "Max Log Lines=0 \n");
        } else if (max_log_lines<1000) {
		    sprintf_s(s, "Max Log Lines=%d \n", max_log_lines );
        } else if (max_log_lines<1000000) {
		    sprintf_s(s, "Max Log Lines=%dK \n", max_log_lines / 1000);
        } else {
		    sprintf_s(s, "Max Log Lines=%dM \n", max_log_lines / 1000000);
        }
		fio->Fprintf(s);

		fio->Fprintf("\n");
		fio->Fprintf("; Use Prefetch Cache on reading Files: 1= enabled (default), 0=disabled\n");
		sprintf_s(s, "Prefetch Enabled=%d\n", PrefetchEnabled ? 1 : 0);
		fio->Fprintf(s);
		
		fio->Fprintf("\n");
		fio->Fprintf("; xsub delay. 0=xsub only redirects input for BDOS 10 call (Bufferd console read - read line until <CR>)\n");
		fio->Fprintf(";             1 to 100=applies to any keyboard input, sending a char each 1 to 100 request\n");
		fio->Fprintf(";                      this allows control overspeed in feeding chars to program and thus loosing keys\n");
		fio->Fprintf(";                      1->max speed, no delay, 100->1 char each 100 queries for status key pressed\n");
		fio->Fprintf(";                      default value: 5\n");
		sprintf_s(s, "xsub delay=%d\n", xsub_delay);
		fio->Fprintf(s);
		
		fio->Fprintf("\n");
		fio->Fprintf("; File Editor to view/edit cpm.ini, cpm.log and console.log files.\n");
		fio->Fprintf("; Default: notepad.exe\n");
		sprintf_s(s, "File Editor=%s\n", editor_exe);
		fio->Fprintf(s);

		fio->Fprintf("\n");
		fio->Fprintf("; Support CP/M version:\n");
		fio->Fprintf(";     34=CP/M 2.2\n");
		fio->Fprintf(";     40=Personal CP/M\n");
		fio->Fprintf(";     49=CP/M 3.1 (CP/M Plus)\n");
		fio->Fprintf(";    201=CDOS 2.01\n");
		sprintf_s(s, "CPM version=%d\n", version);
		fio->Fprintf(s);
		
		fio->Fprintf("\n");
		fio->Fprintf("; First non TPA High address (TPA Limit) as 16 bit hex number.\n");
		fio->Fprintf("; default: 0xfd00\n");
		sprintf_s(s, "TPA Limit=0x%04x\n", tpa_limit);
		fio->Fprintf(s);

		fio->Fprintf("\n");
		fio->Fprintf("; start of common area for Banked CP/M 3.0\n");
		fio->Fprintf("; default: 0xe000\n");
		sprintf_s(s, "Common Mem Start Addr=0x%04x\n", common_mem_start_addr);
		fio->Fprintf(s);

		fio->Fprintf("\n");
		fio->Fprintf("; Max CPU Instrucctions per second (IPS), given speed of emulated CPU\n");
		fio->Fprintf("; default: 0 (max speed)\n");
		fio->Fprintf(";       4.0M (emulated cpu speed 4MHz)\n");
		fio->Fprintf(";      50000 (emulated cpu speed 50KHz)\n");
        if (cpu_max_ips<1) {
            sprintf_s(s, "CPU Max IPS=0 \n");
        } else if (cpu_max_ips<100000) {
		    sprintf_s(s, "CPU Max IPS=%d \n", cpu_max_ips );
        } else {
			sprintf_s(s, "CPU Max IPS=%.1fM \n", ((double) cpu_max_ips) / 1000000.0);
        }
		fio->Fprintf(s);
		fio->Fprintf("\n");
		fio->Fprintf("; MAX Characters Per Second sent to terminal (CPS):\n");
		fio->Fprintf("; default: 0 (max speed)\n");
		sprintf_s(s, "Terminal Max CPS=%d\n", terminal_max_cps);
		fio->Fprintf(s);

        fio->Fprintf("\n");
		fio->Fprintf("; Log CPU instructions\n");
		fio->Fprintf("; default: 0 (no log)\n");
		fio->Fprintf("; 1: include CPU log into cpm.log\n");
		sprintf_s(s, "CPU Log=%d\n", abs(cpu_log));
		fio->Fprintf(s);

        fio->Fprintf("\n");
        fio->Fprintf("; Start Addr for cpu log \n");
		fio->Fprintf("; is an hex value in form 0x0000 \n");
		sprintf_s(s, "CPU Log Addr=0x%04x\n", abs(cpu_addr_log));
		fio->Fprintf(s);

        fio->Fprintf("\n");
		fio->Fprintf("; Display Disk Activity Light:\n");
		sprintf_s(s, "Display Disk Light=%d\n", display_disk_io);
		fio->Fprintf(s);

		char s2[128];
		fio->Fprintf("\n");
		fio->Fprintf("; Key Definitions:\n");
		fio->Fprintf("; e.g = ^K ^Qy  -> traslate key to Control-K, Contol-Q, and y character (case is preserved, spaces are ignored)\n");
		fio->Fprintf("; e.g = #13#10#32  -> traslate key to chr(13), chr(10) and space\n");
		fio->Fprintf("; e.g = \"Hola \" #13 \";\" ^C ;comment -> can use double quotes to keep spaces\n");
		fio->Fprintf("; max 16 characters defined per key\n");
		PCKeyGet(K_Left, s2); sprintf_s(s, "Key Left=%s\n", s2);
		fio->Fprintf(s);
		PCKeyGet(K_Right, s2); sprintf_s(s, "Key Right=%s\n", s2);
		fio->Fprintf(s);
		PCKeyGet(K_Up, s2); sprintf_s(s, "Key Up=%s\n", s2);
		fio->Fprintf(s);
		PCKeyGet(K_Down, s2); sprintf_s(s, "Key Down=%s\n", s2);
		fio->Fprintf(s);
		PCKeyGet( 8, s2); sprintf_s(s, "Key BackSpace=%s\n", s2);
		fio->Fprintf(s);
		PCKeyGet(13, s2); sprintf_s(s, "Key Enter=%s\n", s2);
		fio->Fprintf(s);
		PCKeyGet( 9, s2); sprintf_s(s, "Key Tab=%s\n", s2);
		fio->Fprintf(s);
		PCKeyGet(K_Ins, s2); sprintf_s(s, "Key Insert=%s\n", s2);
		fio->Fprintf(s);
		PCKeyGet(K_Del, s2); sprintf_s(s, "Key Delete=%s\n", s2);
		fio->Fprintf(s);
		PCKeyGet(K_Home, s2); sprintf_s(s, "Key Home=%s\n", s2);
		fio->Fprintf(s);
		PCKeyGet(K_End, s2); sprintf_s(s, "Key End=%s\n", s2);
		fio->Fprintf(s);
		PCKeyGet(K_PgUp, s2); sprintf_s(s, "Key PageUp=%s\n", s2);
		fio->Fprintf(s);
		PCKeyGet(K_PgDn, s2); sprintf_s(s, "Key PageDown=%s\n", s2);
		fio->Fprintf(s);
		PCKeyGet(27, s2); sprintf_s(s, "Key Esc=%s\n", s2);
		fio->Fprintf(s);
		PCKeyGet(K_F1, s2); sprintf_s(s, "Key F1=%s\n", s2);
		fio->Fprintf(s);
		PCKeyGet(K_F2, s2); sprintf_s(s, "Key F2=%s\n", s2);
		fio->Fprintf(s);
		PCKeyGet(K_F3, s2); sprintf_s(s, "Key F3=%s\n", s2);
		fio->Fprintf(s);
		PCKeyGet(K_F4, s2); sprintf_s(s, "Key F4=%s\n", s2);
		fio->Fprintf(s);
		PCKeyGet(K_F5, s2); sprintf_s(s, "Key F5=%s\n", s2);
		fio->Fprintf(s);
		PCKeyGet(K_F6, s2); sprintf_s(s, "Key F6=%s\n", s2);
		fio->Fprintf(s);
		PCKeyGet(K_F7, s2); sprintf_s(s, "Key F7=%s\n", s2);
		fio->Fprintf(s);
		PCKeyGet(K_F8, s2); sprintf_s(s, "Key F8=%s\n", s2);
		fio->Fprintf(s);
		PCKeyGet(K_F9, s2); sprintf_s(s, "Key F9=%s\n", s2);
		fio->Fprintf(s);

		//	fio->Fwrite((void *)&logfont., sizeof(logfont), 1);
		fio->Fclose();
	}
	delete fio;
}

void SaveRecentFiles()
{
	char path[MAX_PATH];
	char s[1024];
	sprintf_s(path, "%srecent.ini", module_path);
	
	FILEIO* fio = new FILEIO();
	if(fio->Fopen(path, FILEIO_WRITE_ASCII)) {
		fio->Fprintf("\n");
		fio->Fprintf(";CP/M Player recent opened files\n");
		fio->Fprintf("\n");
		for (int i=0; i<recent_cnt; i++) {
			sprintf_s(s, "Recent Folder %d=%s\n", i, recent_folder[i]);
			fio->Fprintf(s);
			sprintf_s(s, "Recent File %d=%s\n", i, recent_file[i]);
			fio->Fprintf(s);
		}

  	    //	fio->Fwrite((void *)&logfont., sizeof(logfont), 1);
		fio->Fclose();
	}
	delete fio;
}

void LoadRecentFiles(char *inifilename)
{
	FILEIO* fio = new FILEIO();
	if (fio->FreadIni(inifilename)) {
		char tag[255];
		char s[255];
		recent_cnt = 0;
		for (int i=0; i<RECENT_MAX; i++) {
			sprintf_s(tag, "Recent Folder %d", i);
			if (fio->FGetIniString(tag, s, sizeof(s))) {
                strcpy_s(recent_folder[recent_cnt], s);
            }
			sprintf_s(tag, "Recent File %d", i);
			if (fio->FGetIniString(tag, s, sizeof(s))) strcpy_s(recent_file[recent_cnt], s);
			if (recent_folder[recent_cnt][0]) recent_cnt++;
		}
	}
	delete fio;
}

void LoadStartupSettings()
{
	memset(&PCKeyDef, 0, sizeof(PCKeyDef));
	memset(&logfont, 0, sizeof(logfont));
	logfont.lfHeight = 16;
	logfont.lfWidth = 8;
	logfont.lfWeight = FW_NORMAL; 
	logfont.lfItalic = FALSE; 
	logfont.lfUnderline = FALSE; 
	logfont.lfStrikeOut = FALSE;
//	logfont.lfOutPrecision = OUT_TT_PRECIS; 
	logfont.lfEscapement = 0; 
	logfont.lfOrientation = 0; 
	logfont.lfClipPrecision = CLIP_DEFAULT_PRECIS; 
	logfont.lfQuality = DEFAULT_QUALITY; 
	logfont.lfPitchAndFamily = FIXED_PITCH | FF_DONTCARE; 
	strcpy_s(logfont.lfFaceName, "Courier New");
	columns = 80;
	lines = 24;
    has_status_line = 0; 
	recent_cnt = 0;
	memset(recent_folder, 0, sizeof(recent_folder));
	memset(recent_file, 0, sizeof(recent_file));
	version = 0x22;
	tpa_limit = 0xfd00;
    iobyte = 0x95; // default setting: CONSOLE=CRT, READER=PTR, PUNCH=PTP, LIST=LPT
	cursor_type = 2; // defualt cursor: block
	use_log_file = FALSE; // do not use log files by default
    extern int max_log_lines; 
    max_log_lines = MAX_LOG_LINES; 
	console_echo = FALSE; // do not echo by default
	upper_case_only = FALSE; // mixed case by default
    terminal_type = CRT_VT100; // ANSI terminal by default
    use_RG512_card = 0; // terminal has no Digital Engeneering Retro Graphics card
    dazzler_joy_mode = 0; // autodetect dazzler joy

	memset(TermCtrlSeq, 0, sizeof(TermCtrlSeq));
	memset(TermCtrlSeqAction, 0, sizeof(TermCtrlSeqAction));
	memset(TermCtrlSeqActionParam, 0, sizeof(TermCtrlSeqActionParam));
	memset(CustomTerminalName, 0, sizeof(CustomTerminalName));
    memset(TermCtrlSeqReply, 0, sizeof(TermCtrlSeqReply)); 

	use_screen_log = 0;
	use_printer_log = 0;
	display_cps_ips = 0;
	display_disk_io = 0;
	cpu_max_ips = 0; // default max Speed 
    terminal_max_cps = 0; // default max Speed 
    cpu_log=0;  // no log
    cpu_addr_log=0; // no log start addr

	PrefetchEnabled = 1; 
	xsub_delay = 5;
	
	sprintf_s(editor_exe, "notepad.exe"); // default editor: notepad

	char inifilename[MAX_PATH];

	sprintf_s(inifilename, "%scpm.ini", module_path);
	LoadSettings(inifilename, FALSE, "");
	sprintf_s(inifilename, "%srecent.ini", module_path);
	LoadRecentFiles(inifilename);
}

int LoCharGenHexToBin(int nHiNibble, int nLoNibble) {
    if ((nHiNibble == EOF) || (nLoNibble == EOF)) return -1;
	if (((nHiNibble < '0') || (nHiNibble > '9')) &&
		((nHiNibble < 'A') || (nHiNibble > 'F'))) return -1;	
	if (((nLoNibble < '0') || (nLoNibble > '9')) &&
		((nLoNibble < 'A') || (nLoNibble > 'F'))) return -1;
	int nH = nHiNibble - '0';
	if (nH > 9) nH = nHiNibble - 'A' + 10;
	int nL = nLoNibble - '0';
	if (nL > 9) nL = nLoNibble - 'A' + 10;
	return nH * 16 + nL;
}

void LoadCharGeneratorFile(char *chargen_file_path, int chargen_file_format, int alt_charset_flag)
{
	if (chargen_file_format == 0) return;
	if (chargen_file_path[0] == 0) return;

	FILEIO* fio = new FILEIO();

	if(fio->Fopen(chargen_file_path, FILEIO_READ_BINARY)) {
		if (chargen_file_format == 1) {
			// Osborne Executive Intel HEX format
			// : NN AAAA TT data CC
			//   NN=Numero de bytes, AAAA=load address
			//   TT=Type: 00=data, 01=eof, 02=base addr (can be ignored)
			//   CC=CheckSum (ignored, not checked when loading data)
			// Example: 
			// :1000000000000000F83FF8000000FFFFFFFFFFFFC7
			// Osborne uses a 8x10 pixel cell, but uses 16 bytes to store the 
			//         character. Last 6 bytes for each char are unused
			int status = 0; // 0=idle, 1=wait for NNAAAATT, 2=wait for data
			int n=0; // bytes to be read
			int addr=0; // addr to store 
			int d; // readed data from file
			for(;;) {
				d = fio->Fgetc();
				if(d == EOF) break;
				if (d == ':') {
					status = 1;
				} else if (((d < '0') || (d > '9')) && ((d < 'A') || (d > 'F'))) {
					status = 0;
					continue;
				} else if (status == 1) {
					// read NN
					n = LoCharGenHexToBin(d, fio->Fgetc());
					if ((n < 0) || (n > 255)) break;
					// read AAAA
					d = fio->Fgetc();
					addr = LoCharGenHexToBin(d, fio->Fgetc());
					if (addr < 0) break;
					d = fio->Fgetc();
					d = LoCharGenHexToBin(d, fio->Fgetc());
					if (d < 0) break;
					addr = addr * 256 + d;
					if ((addr < 0) || (addr > 0x0ffff)) break;
					if (alt_charset_flag) addr += 128*16; // alternate charset written in mem after regular charset
					// read TT
					d = fio->Fgetc();
					d = LoCharGenHexToBin(d, fio->Fgetc());
					if (d < 0) break;
					if (d == 1) {
						break; // All Ok -> found EOF
					}
					if (d != 0) {
						status = 0;
						continue;
					}
					status = 2;
				} else if (status == 2) {
					if (n < 1)  {
						status = 0;
						continue;
					}
					d = LoCharGenHexToBin(d, fio->Fgetc());
					if ((d < 0) || (d > 255)) break;
					if ((addr < 0) || (addr >= sizeof(console->Osborne_CharGenerator))) break;
					if (console->Osborne_use_CharGenerator != 1) { // osborne 8 x 10 standar char font
						console->Osborne_use_CharGenerator = 1;
						memset(console->Osborne_CharGenerator, 0, sizeof(console->Osborne_CharGenerator));
					}
					console->Osborne_CharGenerator[addr] = d;
					
					n--;
					addr++;
				}
			}
		}
		fio->Fclose();
	}
	delete fio;

}

int LoadSettings(char *inifilename, bool UpdateScree_flag, char *comfilepath)
{
	int IniProcesed = 0;

	char chargen_file_path[MAX_PATH];
	char chargen_alt_file_path[MAX_PATH];
	char s[MAX_PATH];

	int chargen_file_format = 0;
	chargen_file_path[0] = 0;
	chargen_alt_file_path[0] = 0;

	FILEIO* fio = new FILEIO();
	if (fio->FreadIni(inifilename)) {
		IniProcesed = 1;
		int n,l;
    	for(int i = 1; i < 16; i++) {
            char Drive_IniDef[20];
            sprintf_s(Drive_IniDef, "Drive_%c", 'A'+i);
    		if (fio->FGetIniString(Drive_IniDef, s, sizeof(s))) {
                // path must end with \ char
                // remove trailing blanks
                while ((l=strlen(s)) && (s[l-1]==32)) s[l-1]=0; 
                if (strlen(s)==0) continue; // empty setting
                if (s[strlen(s)-1]!='\\') strcat_s(s,"\\"); // add missing backslash as folder terminator
                strcpy_s(cpm->defined_drive_path[i], s);
            }
        }
		if (fio->FGetIniInt("Screen Columns", n)) columns = n;
		if (fio->FGetIniInt("Screen Lines", n)) lines = n;
		if (fio->FGetIniInt("Status Line", n)) has_status_line = n;
		if (fio->FGetIniInt("Screen Cursor", n)) cursor_type = n;
		if (fio->FGetIniInt("Terminal Type", n)) {
			terminal_type = n;
			SetTerminal_tpa_limit();
		}
		if (fio->FGetIniInt("Joy Mode", n)) dazzler_joy_mode = n; 
		if (fio->FGetIniInt("Use RG512 card", n)) use_RG512_card = n; 
		if (fio->FGetIniInt("GSX Color", n)) GSX_color = n; 

        // special case: kaypro has a status line 
		memset(TermCtrlSeq, 0, sizeof(TermCtrlSeq));
		memset(TermCtrlSeqAction, 0, sizeof(TermCtrlSeqAction));
		memset(TermCtrlSeqActionParam, 0, sizeof(TermCtrlSeqActionParam));
		memset(&CustomTerminalName, 0, sizeof(CustomTerminalName));		
        memset(TermCtrlSeqReply, 0, sizeof(TermCtrlSeqReply)); 
		if (fio->FGetIniString("CustomTerminalName", s, sizeof(s))) strcpy_s(CustomTerminalName, s);
		for (int iCtrl = 0; iCtrl<MAX_CTRL_SEQ-1; iCtrl++) {
  			if (!(fio->FGetIniStringN(iCtrl+1, "CtrlSeq", ':', s, sizeof(s)))) break;

			BYTE c; 
            int d; 
            int iSeq = 0;
            char * stext = NULL; 
			for (int iCtrlSeq = 0;iCtrlSeq<MAX_CRTL_SEQ_LEN-1;iCtrlSeq++) {
				n = -1; 
				for (;;) {
					c = s[iSeq++];
					if (c == ',') break;
					if (c == 'X') {
						n = 255;
						continue;
					} 
                    if (c == 39) {  // 'c  -> indicates a single ascii char
                        n = s[iSeq];
                        if (n==0) break;
                        iSeq++;
                        continue; 
                    }
                    if (c == '^') {  // ^c  -> indicates a control code
                        n = s[iSeq];
                        if (n==0) break;
                        iSeq++; 
                        n=n-'A'+1; 
                        continue; 
                    }
					if ((c < '0') || (c > '9')) break;
					if (n < 0 ) n = 0;
					n = n * 10 + int(c) - int('0');
					if (n > 255) n = n - 256;
				}
				if (n < 0) break; // invalid number -> bad syntax -> skip
				TermCtrlSeq[iCtrl][iCtrlSeq] = n;
                TermCtrlSeq[iCtrl][iCtrlSeq+1] = 0;
				if (c != ',') break;
			}
            while (c==32) { c = s[iSeq++]; }
			if (c != '=') continue; // no "=" -> bad syntax -> skip 
            while (s[iSeq]==32) {iSeq++;}
			n = 0; d = 0;
			for (;;) { // read uppercase ctrl action
				c = s[iSeq++];
                if ((c == '_') && (d>0)) continue; // skip _ into numbers
				if ((c == '_') || ((c >= 'A') && (c <= 'Z'))) {
					s[n++] = c;
				} else if ((c >= '0') && (c <= '9')) {
					d = d * 10 + c - '0';
				} else {
					s[n++] = 0; stext=s+iSeq; // input line continuatuion
					break;
				}
			}

			n = CON_NOP; // defaults to nop
			if (0==strcmp(s, "CR")) n = CON_CR; else 
			if (0==strcmp(s, "LEFT")) n = CON_LEFT; else
			if (0==strcmp(s, "RIGHT")) n = CON_RIGHT; else
			if (0==strcmp(s, "DOWN")) n = CON_DOWN; else
			if (0==strcmp(s, "UP")) n = CON_UP; else
			if (0==strcmp(s, "EOS")) n = CON_EOS; else
			if (0==strcmp(s, "EOL")) n = CON_EOL; else
			if (0==strcmp(s, "EBL")) n = CON_EBL; else
			if (0==strcmp(s, "CLS")) n = CON_CLS; else
			if (0==strcmp(s, "HOME")) n = CON_HOME; else
			if (0==strcmp(s, "POS_YX_")) n = CON_POS_YX; else
			if (0==strcmp(s, "POS_XY_")) n = CON_POS_XY; else
			if (0==strcmp(s, "REVERSE_ON")) n = CON_REVERSE_ON; else
			if (0==strcmp(s, "REVERSE_OFF")) n = CON_REVERSE_OFF; else
			if (0==strcmp(s, "BRIGHT_ON")) n = CON_BRIGHT_ON; else
			if (0==strcmp(s, "BRIGHT_OFF")) n = CON_BRIGHT_OFF; else
			if (0==strcmp(s, "BLINK_ON")) n = CON_BLINK_ON; else
			if (0==strcmp(s, "BLINK_OFF")) n = CON_BLINK_OFF; else
			if (0==strcmp(s, "UNDER_ON")) n = CON_UNDER_ON; else
			if (0==strcmp(s, "UNDER_OFF")) n = CON_UNDER_OFF; else
			if (0==strcmp(s, "CUR_ON")) n = CON_CUR_ON; else
			if (0==strcmp(s, "CUR_OFF")) n = CON_CUR_OFF; else
			if (0==strcmp(s, "INS_LIN")) n = CON_INS_LIN; else
			if (0==strcmp(s, "DEL_LIN")) n = CON_DEL_LIN; else
			if (0==strcmp(s, "EEL")) n = CON_EEL; else
			if (0==strcmp(s, "RESET_ATTR")) n = CON_RESET_ATTR; else
			if (0==strcmp(s, "REVERSE_TOGGLE")) n = CON_REVERSE_TOGGLE; else
			if (0==strcmp(s, "CRLF")) n = CON_CRLF; else
            if (0==strcmp(s, "REVERSE_LF")) n = CON_REVERSE_LF; else
            if (0==strcmp(s, "LF")) n = CON_LF; else
			if (0==strcmp(s, "CUR_SAVE")) n = CON_CUR_SAVE; else
			if (0==strcmp(s, "CUR_RESTORE")) n = CON_CUR_RESTORE; else
			if (0==strcmp(s, "BACKSPACE")) n = CON_BACKSPACE; else
			if (0==strcmp(s, "REPLY")) { n = CON_REPLY; }else
			if (0==strcmp(s, "CUR_REPORT")) { n = CON_CUR_REPORT; }else
			if (0==strcmp(s, "INS_CHR")) n = CON_INS_CHR; else
			if (0==strcmp(s, "DEL_CHR")) n = CON_DEL_CHR; else
			if (0==strcmp(s, "SET_ATTR_")) n = CON_SET_ATTR; else
			if (0==strcmp(s, "SET_LIN_LOCK_")) n = CON_SET_LIN_LOCK; else
			if (0==strcmp(s, "RESET_LIN_LOCK_")) n = CON_RESET_LIN_LOCK; else 
			if (0==strcmp(s, "RESET_ALL_LIN_LOCKS")) n = CON_RESET_ALL_LIN_LOCKS; else 
			if (0==strcmp(s, "SET_TOP_LIN_LOCK")) n = CON_SET_TOP_LIN_LOCK; else 
			if (0==strcmp(s, "WRITE_STATUS_LINE_MSG")) n = CON_WRITE_STATUS_LINE_MSG; else 
			if (0==strcmp(s, "END_STATUS_LINE_MSG")) n = CON_END_STATUS_LINE_MSG; else 
			if (0==strcmp(s, "CLEAR_STATUS_LINE")) n = CON_CLEAR_STATUS_LINE; else 
			if (0==strcmp(s, "SCROLL__")) n = CON_SCROLL; else // double "_" because is SCROLL_NN_abcd
			if (0==strcmp(s, "PAGE_")) n = CON_PAGE; else 
			if (0==strcmp(s, "NOP")) n = CON_NOP; 
			TermCtrlSeqAction[iCtrl] = n;
			TermCtrlSeqActionParam[iCtrl] = d;
            if ((n==CON_REPLY) && (stext)) {
                // reply text
                int i=0;
                char sReply[MAX_TERM_REPLIES_LEN+1];
                n=ParseString(stext,sReply,MAX_TERM_REPLIES_LEN-1); 
                if (n) for (int i=1;i<MAX_TERM_REPLIES;i++) {
                    if (TermCtrlSeqReply[i][0]) continue;  
                    strcpy_s(TermCtrlSeqReply[i], MAX_TERM_REPLIES_LEN-1, sReply); 
                    TermCtrlSeqActionParam[iCtrl]=i; 
                    break;
                }
                
            }
		}
		if (fio->FGetIniString("CharGenerator File", s, sizeof(s))) strcpy_s(chargen_file_path, s);
		if (fio->FGetIniString("CharGenerator File Alt", s, sizeof(s))) strcpy_s(chargen_alt_file_path, s);
		if (fio->FGetIniInt("CharGenerator Format", n)) chargen_file_format = n;

		if (fio->FGetIniInt("Console Echo", n)) console_echo = (n == 0 ? FALSE : TRUE);
		if (fio->FGetIniInt("Upper Case Only", n)) upper_case_only = (n == 0 ? FALSE : TRUE);
		if (fio->FGetIniInt("CPM version", n)) version = n;
		if (fio->FGetIniHex("TPA Limit", n)) tpa_limit = n; //must be read after terminal_type
		if (fio->FGetIniHex("Common Mem Start Addr", n)) common_mem_start_addr = n;

		if (fio->FGetIniInt("Terminal Max CPS", n)) terminal_max_cps = n;
        if (fio->FGetIniString("CPU Max IPS", s, sizeof(s))) {
            // format: CPU Max IPS=nnnn
            //     or: CPU Max IPS=nnn.nM
            //     or: CPU Max IPS=nnnM
            char c; 
            int i,decimal; 
            n=i=0; decimal=0;  
            while(1) {
                c=s[i++];
                if ((c<'0')||(c>'9')) break; 
                n=n*10+c-'0'; 
            }
            if (c=='.') {
                c=s[i++];
                if ((c>='0')&&(c<='9')) {
                    decimal=c-'0'; 
                    c=s[i++];
                }
            }
            if (toupper(c)=='M') {
                n=n*1000000+decimal*100000; 
            }
            if (n<1) n=-1; // max host allowed speed
            else if (n<1000) n=1000; // minimum cpu speed
            else if (n>MAX_IPS) n=-1; // max host allowed speed
            cpu_max_ips = n;
        }
		if (fio->FGetIniInt("CPU Log", n)) cpu_log = n;
		if (fio->FGetIniHex("CPU Log Addr", n)) cpu_addr_log = n;

		if (fio->FGetIniInt("Display Disk Light", n)) display_disk_io = (n == 0 ? FALSE : TRUE);

		if (fio->FGetIniInt("Use Log Files", n)) {
            use_log_file = (n == 0 ? 0 : 1);
			if (console) console->SetMode('L', use_log_file);
			if (cpm) cpm->SetMode('L', use_log_file);
        }        
        if (fio->FGetIniString("Max Log Lines", s, sizeof(s))) {
            // format: Max Log Lines=nnnn
            //     or: Max Log Lines=nnnK
            //     or: Max Log Lines=nnnM
            char c; 
            int i; 
            n=i=0; 
            while(1) {
                c=s[i++];
                if ((c<'0')||(c>'9')) break; 
                n=n*10+c-'0'; 
            }
            c=toupper(c);
            if (c=='M') n=n*1000000; else 
            if (c=='K') n=n*1000; 
            if (n> MAX_LOG_LINES * 200) n=MAX_LOG_LINES * 200; // absolute limit
            extern int max_log_lines; 
            max_log_lines = n;
        }


		if (fio->FGetIniInt("Prefetch Enabled", n)) PrefetchEnabled = (n == 0 ? 0 : 1);
		if (fio->FGetIniInt("xsub delay", n)) xsub_delay = n;

		if (fio->FGetIniFilePath("File Editor", s, sizeof(s), module_path)) strcpy_s(editor_exe, s);

		if (fio->FGetIniString("Font Name", s, sizeof(s))) strcpy_s(logfont.lfFaceName, s);
		if (fio->FGetIniInt("Font Height", n)) logfont.lfHeight = n;
		if (fio->FGetIniInt("Font Width", n)) logfont.lfWidth = n;
		
		if (fio->FGetIniString("Key Left", s, sizeof(s))) PCKeySet(K_Left, s);
		if (fio->FGetIniString("Key Right", s, sizeof(s))) PCKeySet(K_Right, s);
		if (fio->FGetIniString("Key Up", s, sizeof(s))) PCKeySet(K_Up, s);
		if (fio->FGetIniString("Key Down", s, sizeof(s))) PCKeySet(K_Down, s);
		if (fio->FGetIniString("Key BackSpace", s, sizeof(s))) PCKeySet(8, s);
		if (fio->FGetIniString("Key Enter", s, sizeof(s))) PCKeySet(13, s);
		if (fio->FGetIniString("Key Tab", s, sizeof(s))) PCKeySet(9, s);        
        if (fio->FGetIniString("Key Insert", s, sizeof(s))) PCKeySet(K_Ins, s);
		if (fio->FGetIniString("Key Delete", s, sizeof(s))) PCKeySet(K_Del, s);
		if (fio->FGetIniString("Key Home", s, sizeof(s))) PCKeySet(K_Home, s);
		if (fio->FGetIniString("Key End", s, sizeof(s))) PCKeySet(K_End, s);
		if (fio->FGetIniString("Key PageUp", s, sizeof(s))) PCKeySet(K_PgUp, s);
		if (fio->FGetIniString("Key PageDown", s, sizeof(s))) PCKeySet(K_PgDn, s);
		if (fio->FGetIniString("Key Esc", s, sizeof(s))) PCKeySet(27, s);
		if (fio->FGetIniString("Key F1", s, sizeof(s))) PCKeySet(K_F1, s);
		if (fio->FGetIniString("Key F2", s, sizeof(s))) PCKeySet(K_F2, s);
		if (fio->FGetIniString("Key F3", s, sizeof(s))) PCKeySet(K_F3, s);
		if (fio->FGetIniString("Key F4", s, sizeof(s))) PCKeySet(K_F4, s);
		if (fio->FGetIniString("Key F5", s, sizeof(s))) PCKeySet(K_F5, s);
		if (fio->FGetIniString("Key F6", s, sizeof(s))) PCKeySet(K_F6, s);
		if (fio->FGetIniString("Key F7", s, sizeof(s))) PCKeySet(K_F7, s);
		if (fio->FGetIniString("Key F8", s, sizeof(s))) PCKeySet(K_F8, s);
		if (fio->FGetIniString("Key F9", s, sizeof(s))) PCKeySet(K_F9, s);
	}
	delete fio;
	if ((chargen_file_format != 0) && 
		((chargen_file_path[0] != 0) || (chargen_alt_file_path[0] != 0))) {
		// note: char generator settings are not saved on Save Settings on cpm.ini file
		if (UpdateScree_flag) {
			// use the .COM file path
			char s[MAX_PATH];
			if (chargen_file_path[0] != 0) {
				sprintf_s(s, "%s%s", comfilepath, chargen_file_path);
				sprintf_s(chargen_file_path, "%s", s);
			}
			if (chargen_alt_file_path[0] != 0) {
				sprintf_s(s, "%s%s", comfilepath, chargen_alt_file_path);
				sprintf_s(chargen_alt_file_path, "%s", s);
			}
		} else {
			// processing cpm.ini file -> use path as given
		}
		LoadCharGeneratorFile(chargen_file_path, chargen_file_format, 0);
		LoadCharGeneratorFile(chargen_alt_file_path, chargen_file_format, 1);
	}

	if (UpdateScree_flag) {
		// from .COM ini file, can only update: columns, rows, color, 
		// cursor, echo, uppercase usage, terminal type, tpa limit
		console->SetMode('T', cursor_type);
		console->SetMode('E', console_echo);
		console->SetMode('U', upper_case_only);
		console->SetMode('Y', terminal_type + (use_RG512_card << 8));
		console->SetMode('C', terminal_max_cps);
		console->SetCtrlSeq(CustomTerminalName, 
			                (char *) TermCtrlSeq, TermCtrlSeqAction, TermCtrlSeqActionParam,
                            (char *) TermCtrlSeqReply);
		SetMainWindow(hWnd);
		console->RequestRefreshScreen(true);
		cpm->SetMode('V', version);
		cpm->SetMode('B', tpa_limit);
		cpm->SetMode('P', PrefetchEnabled);
		cpm->SetMode('X', xsub_delay);
        console->DazzlerCard(6,1,dazzler_joy_mode);
	}
	return IniProcesed;
}

void OpenFilePopUpWindow(HWND hWnd)
{
	char szFile[MAX_PATH] = "";
	OPENFILENAME OpenFileName;

	memset(&OpenFileName, 0, sizeof(OpenFileName));
	OpenFileName.lStructSize = sizeof(OPENFILENAME);
	OpenFileName.hwndOwner = hWnd;

    OpenFileName.lpstrFilter = "CP/M-80 Program File (*.com)\0"     "*.com\0"
                               "SUBMIT File (*.sub)\0"              "*.sub\0"
                               "MBASIC File (*.bas)\0"              "*.bas\0"
                               "All Files (*.*)\0"                  "*.*\0"
                               "\0";

	OpenFileName.lpstrFile = szFile;
	OpenFileName.nMaxFile = MAX_PATH;
	OpenFileName.lpstrInitialDir = openfile_path;
	OpenFileName.lpstrTitle = "Open CP/M-80 Program File";
	
	if(GetOpenFileName(&OpenFileName)) {
		RunCPMFile(OpenFileName.lpstrFile, true);
	}
}
int AddToRecentFileList(char* pfolder, char* pfile)
{
	    char folder[MAX_PATH], file[MAX_PATH]; 
		strcpy_s(folder, pfolder);
		strcpy_s(file, pfile);

		int iFound = -1;

		for(int i = 0; i < recent_cnt; i++) {
            if (file[0]) {
                // if filename exists recent must match filename & folder
			    if((strcmp(recent_folder[i], folder) == 0) && 
			       (strcmp(recent_file[i], file) == 0)) {
				    iFound = i;
				    break;
                }
            } else {
                // if filename is empty (running CCP on a folder as CPM unit A:) only folder must match
			    if(strcmp(recent_folder[i], folder) == 0) {
				    iFound = i;
				    break;
                }
            }
		}
		if(iFound < 0) {
			// new file to recent list
			if(recent_cnt < RECENT_MAX) {
				// room left -> add on top
				strcpy_s(recent_folder[recent_cnt], folder);
				strcpy_s(recent_file[recent_cnt], file);
				recent_cnt++;
				iFound = recent_cnt - 1;
			} else {
				for(int i = 0; i < RECENT_MAX - 1; i++) {
					strcpy_s(recent_folder[i], recent_folder[i + 1]);
					strcpy_s(recent_file[i], recent_file[i + 1]);
				}
				strcpy_s(recent_folder[RECENT_MAX - 1], folder);
				strcpy_s(recent_file[RECENT_MAX - 1], file);
				iFound = RECENT_MAX - 1;
			}
		} else {
			// reuse recent list entry -> put last (the las recently used)
            char found_folder[MAX_PATH]; 
            char found_file[MAX_PATH]; 
            strcpy_s(found_folder, recent_folder[iFound]);
            strcpy_s(found_file, recent_file[iFound]);
			for(int i = iFound; i < recent_cnt - 1; i++) {
				strcpy_s(recent_folder[i], recent_folder[i + 1]);
				strcpy_s(recent_file[i], recent_file[i + 1]);
			}
			strcpy_s(recent_folder[recent_cnt - 1], found_folder);
			strcpy_s(recent_file[recent_cnt - 1], found_file);
			iFound = recent_cnt - 1;
		}
		return iFound; 
		
}
void RunCPMFile(LPCTSTR lpstrFile, bool IsFile)
{
		char folder[MAX_PATH], file[MAX_PATH], *file_ptr;

		if (IsFile) {
			GetFullPathName(lpstrFile, MAX_PATH, folder, &file_ptr);
			strcpy_s(file, file_ptr);
			folder[strlen(folder) - strlen(file_ptr)] = '\0';	
		} else {
			// is a directory -> run CCP            
            strcpy_s(folder, lpstrFile);
            if (folder[strlen(folder)-1]!='\\') {
                // if folder does not ends with backslash, add it
			    sprintf_s(folder, "%s\\", lpstrFile);
            }
			strcpy_s(file, "<CCP>");
		}

		RunCPM(folder, file);
}

void RunRecentCCPforCPMFile(int nRecentFile)
{
    if (nRecentFile < 0) {
        char module_path[MAX_PATH];
        int pt; 
    	GetModuleFileName(NULL, module_path, MAX_PATH);
   	    pt = strlen(module_path);
	    if ((pt > 0) && (module_path[pt-1] != '\\')) {
            // add a \ at end of path if not present
            module_path[pt++] = '\\'; module_path[pt++] = 0;
        }
        RunCPM(module_path, "<CCP>");
    } else {
	    int i = AddToRecentFileList(recent_folder[nRecentFile], recent_file[nRecentFile]);
	    RunCPM(recent_folder[i], "<CCP>");
    }
}
void RunRecentCPMFile(int nRecentFile)
{
	int i = AddToRecentFileList(recent_folder[nRecentFile], recent_file[nRecentFile]);
    if (recent_file[i][0]) { 
        // run a recent file
        char filename[MAX_PATH+1];
        sprintf_s(filename, "%s%s", recent_folder[i], recent_file[i]);
	    RunCPMFile(filename, true);
    } else {
        // run a recent dir
        RunCPMFile(recent_folder[i], false); 
    }
}
void RunCPM(char* folder, char* fileOrCCP)
{
	char sLog[1024];
	int ccp_flag = 0; //0->run .COM/.BAS/.SUB file, 1->run CCP command processor

    console->SetMode('L', 2); // clear log if active
    cpm->SetMode('L', 2); // clear log if active
	console->Terminate();
	cpm->Terminate();
	console->Reset();
    memset(paste_text, 0, sizeof(paste_text));

	strcpy_s(openfile_path, folder);

    char file[MAX_PATH] = {0};
	if (strcmp(fileOrCCP, "<CCP>")==0) { 
		ccp_flag = IS_CCP;
		// calling CCP, so no file to execute
		strcpy_s(file, ""); 
	} else {
		// is a file to run
		strcpy_s(file, fileOrCCP); 
        // determine its type
        int n=strlen(file);
        if ((n>4) && (_stricmp(file-4+n, ".COM")==0)) {
            ccp_flag=IS_COM; // file is a .COM regular CP/M executable z80 binary program
        } else if ((n>4) && (_stricmp(file-4+n, ".SUB")==0)) {
            ccp_flag=IS_SUB; // file is a .SUB submit program 
        } else if ((n>4) && (_stricmp(file-4+n, ".BAS")==0)) {
            ccp_flag=IS_BAS; // file is a .BAS basic program form Microsoft MBASIC 5.2
        } else {
            // unknow filetype, leave ccp_flag=0
        }
	}

	//Load specific settings for this program
    // search sequence for .ini files

    //   - load "cpm.ini" and "recent.ini" on same folder as cpm_player.exe, when it starts or reset
    //   - when dropping program (A.COM) from folder (C:\MyProgs)
    //      - load folder/program.ini      (C:\MyProgs\A.COM.ini)  if not found, then ...
    //      - load folder/cpm_player.ini   (C:\MyProgs\cpm_player.ini) if not found, then ...
    //      - from cpm_player.exe folder, .\ini\program.ini  (C:\CPM_Player\ini\A.COM.ini

	char inifilename[MAX_PATH];
    if (ccp_flag<=IS_CCP) goto Load_cpm_player_settings; // calling CCP (so no program to run) -> skip program name based .ini detection
	sprintf_s(inifilename, "%s%s.ini", folder, file); // folder ya tiene el backslash al final
	if (LoadSettings(inifilename, TRUE, folder)) {
		sprintf_s(sLog, "Using %s\n", inifilename);
		cpm->PrtLog(sLog);
	} else {
        sprintf_s(sLog, "Not found %s\n", inifilename);
      	cpm->PrtLog(sLog);
       Load_cpm_player_settings:
    	sprintf_s(inifilename, "%scpm_player.ini", folder); 
    	if (LoadSettings(inifilename, TRUE, folder)) {
	   		sprintf_s(sLog, "Using %s\n", inifilename);
	    	cpm->PrtLog(sLog);
    	} else {
            sprintf_s(sLog, "Not found %s\n", inifilename);
	    	cpm->PrtLog(sLog);
		    sprintf_s(inifilename, "%sini\\%s.ini", module_path, file);
    		if (LoadSettings(inifilename, TRUE, folder)) {
	    		sprintf_s(sLog, "Using %s\n", inifilename);
		    	cpm->PrtLog(sLog);
    		} else {
	    		sprintf_s(sLog, "Not found %s\n", inifilename);
		    	cpm->PrtLog(sLog);
		    }
        }
	}
	cpm->Run(folder, file, cpu_max_ips, ccp_flag);
}

void SetMainWindow(HWND hWnd)
{
	console->Release();
	int window_width, window_height;
	console->GetWindowSize(&logfont, columns, lines, 
                           (terminal_type == CRT_KAYPRO) ? 1:has_status_line, // kaypro allways have a status line
                           &window_width, &window_height);
	
	RECT rct = {0, 0, window_width, window_height};
	AdjustWindowRectEx(&rct, WS_OVERLAPPED | WS_CAPTION | WS_SYSMENU | WS_MAXIMIZEBOX | WS_VISIBLE, TRUE, 0);
	HDC hdc = CreateDC("DISPLAY", NULL, NULL, NULL);
	int width = GetDeviceCaps(hdc, HORZRES);
	int height = GetDeviceCaps(hdc, VERTRES);
	int dest_x = (int)((width - (rct.right - rct.left)) / 2);
	int dest_y = (int)((height - (rct.bottom - rct.top)) / 2);
	
	// Keep screen in his original position
	RECT rect;
	GetWindowRect(hWnd, &rect);
	
	SetWindowPos(hWnd, NULL, rect.left,  //(dest_x < 0 ? 0 : dest_x), 
							 rect.top, // (dest_y < 0 ? 0 : dest_y), 
							 rct.right - rct.left, rct.bottom - rct.top, SWP_NOZORDER);
	
	console->Initialize(hWnd, &logfont);
}

void SelectFont(HWND hWnd)
{
	CHOOSEFONT cf;
	memset(&cf, 0, sizeof(CHOOSEFONT));
	cf.lStructSize = sizeof(CHOOSEFONT);
	cf.hwndOwner = NULL;
	cf.lpLogFont = &logfont;
	cf.Flags = CF_INITTOLOGFONTSTRUCT | CF_SCREENFONTS;
	cf.rgbColors = RGB(0, 0, 0);
	cf.nFontType = SCREEN_FONTTYPE;
	
	if(ChooseFont(&cf))
		SetMainWindow(hWnd);
}

