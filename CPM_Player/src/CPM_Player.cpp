// CPM_Player.cpp : Defines the entry point for the application.
//

/*
	'CP/M Player for Win32'
	
	Author : Takeda.Toshiya
	Date   : 2004.03.08 - 1.00
	Original code

	Author : Roberto Sancho
	Date   : 2006.11.30 - 2.00
    Bug fixes, Drag & drop .COM files
    Multiple terminals, .ini files

  	Author : Roberto Sancho
	Date   : 2016.Feb - 3.00
    Embebbed CCP support
    Native execution of .SUB files support

   	Author : Roberto Sancho
	Date   : 2024.Jan - 4.00
    Graphic support for IMSAI VIO, Dazzler

What's New:
	BUGS Solved
		ANSI/VT52: Corrected buggy esc sequences
		Corrected deadlock on exit
		Corrected different meaning of BDOC calls 7/8 on CPM 2.2 and CPM 3
		BDOS 15/16 (opne/close file): now does not overwrite $80 with used FCB
		Removed double \\ in .ini path
		BDOS 105 CP/M 3: Get Date and Time -> nimutes overwrites hour in return data
		GetFullPath coniders #160 same as #32
		Error when trying to load a 0 bytes length .COM
		pad last read file record with $1A 
		fill with $20 FCBs al $5D and $6D when loading program
		BDOS 17 (search1st) now skips files with invalid CP/M specs
		BDOS 23 (rename) removed spurios call to closefile, fixed log for renaming files
		BDOS 15 (open) now handles creating new files when opening non-exiting files
		BDOS 1 (conin) now echos typed char -> no more need to local echo setting
		console echo now echoes also #8 and #13
		cumputation of current extent now uses s2 and not s1 (high) & s2 (low) 
		read, write -> computers current cr with 22bits instead of 16bits
		BDOS 15 (open) does not change ex cr, sets rc 
		BDOS 6 (conin_raw) returns char in regA and in RegL
	    BDOS 12 (version) returns version in HL and also in A (A vas missing)
		BDOS 17/18 (SearchFirst/Next) returns correct file size in s2 ex rc
	New Features
		- Automatically mounts folders .\Drive_B, .\Drive_C, ... as drive B:, C: 
		  relative to current .COM dir mounted as A:
	    - log files limited to 300K lines
		- Drag & drop folders to open a CCP sesion with the folder mounted as A:
		- Cursor Up on main window recovers last executed program
		- CCP support 
				CCP.COM embebbed in .exe
				Type [Enter] on main window to start CCP. A: is last executed program folder 
				   use CCP.ini to define settings
				Exit form CCP with new internal EXIT command
				BDOS new functions to support CCP inside CP/M player
				CCP support command line history
		- Buffered line input has command history and editing keys
		- BDOS 31 now generates a fake DPB
	    - Supported CDOS calls 128,134,137,138,141,152,159
		- CPM version can be used to activate CDOS (partial) support
	    - BDOS passed and logs BC reg
		- Prefetch files on read. PrefetchEnabled=1 or 0 (to disable it)
		- Can drop/open .SUB files for execution (submit files). 
		      support for ^ control char substitution
			  supports ";" comment 
		      Suports ERA REN SAVE internal commands 
		      Supports XSUB. Enhanced version 
				- redirets infrom for BIOS and BDOS, or only for BDOS 10 call (as true CP/M 2.2)
				- adjustable delay on redictected charactes sent to program
				- ^A to ^Z redirected as ctrl-A to Ctrl-Z
				- XSUB must not be first command in submit
		      Supports SUBMIT chaining
			  filenames in internal commands or submit chained file cannot have A:, B: 
		- Alt-PgUp/PgDown to adjust emulation speed
		- menu options for Slow down emulation, speed up, max speed
		- Atl-I display current Max IPC setting
		- Search .ini in same folder than .COM program. If not found, 
          Search cpm_player.ini in same folder than .COM program. If not found, 
          search .ini in .exe\ini
		- Support to enable log for control flow opcodes between addr1 and addr2
		- Support for defining terminal control sequences (CtrlSeq: in .ini)
	    	- Put Caller PC in BDOS and BIOS log
		- remove BIOS fake opcodes, replace by JMP table
		- New display engine supports cursor, blink, highlight, underline
		- Cursor as blick, underline or no cursor configurable
		- configuration .ini text file instead of binary non-editable .cfg
		- configuration .ini for each executable file
		- Define Cursor/PgUp/Dn/Home/End/Ins/Del/Esc/Enter/Tab and their equivalent for CP/M
		  Space allowed (and ignored). Up to 4 chars. case is preserved
		  #nn to generate non-printable chars. ## generates the char #
		- Log screen characters on file/bdoc calls, activated by menu/.ini 
		- Error message if trying to execute a not executable file
		- Support for 132 columns
		- Support for ANSII/VT100/VT52
		- Support for Kaypro/ADM3A
		- Support for Kaypro status line (line 25)
		- Support for Kaypro graphics
		- Support for Local echo
		- Support for drag and drop files
		- menu option to save settings (no more autosave ob quitting)
		- copy screen to clipboard
		- paste text to keyboard (max 8K of text)
		- support for screen log
		- support to display CPS/IPS on screen (CPS: chars sent to terminal per second, 
		     IPS: z80 instrunction per second. During a bios/bdos call for keyboard input
			 no z80 instrctions are executed, thus IPS=0. This is noticeable for example 
			 in MBASIC, where IPS remains zero until a program is executed
		- Pause menu function (also can be activated with Alt-P)
		- Support to Define max IPS 
		- Support for upper case only keyboard.
		- Support for character definition (osborne executive .CHR Intel Hex format mode)
		- Replaces / on cpm filename by # on windows file
		- Creates only uppercase files on windows filesystem
		- Menu accelerators
		- Reset menu function
		- log bdos calls for CP/M 2.2 and CP/M 3
		- Support for TPA Limit. Terminal mode ANSI sets TPS for
		  default FD00 limit. Kaypro terminal sets TPA at E400, Osborne
		  set TPA at C000. Dazzler and VIO set TPA at E000. 
          Terminal setting can be override with TPA option
		- Menu options to view cpm.ini, cpm.log, console.log files
          these files can be viewed even while generated by simulator (file is flushed prior to viewing 
          it to get the most recent contents)
		- Configurable default editor to view cpm.ini, cpm.log, console.log files
		- Autoexecute .bas programs (opened or droped) with built-in msbasic 5.2 
		- memory mapped video for Osborne: default is osborne 1 mode (video at F000, bit 7=Underline attrib).
		  bit 8 (hi video) not mapped to memory. 
		- Support for Osborne executive memory model (activated with reading/writing to io port 0)
		  TPA limit is not setted automatically to F000. Must be set in the .ini file
		  allowed to redefine character set and alternate charset.
		  Can define charset file (.FNT, .CHR) on .ini file to be loades on program startup
		- Log BIOS mem access for Osborne (E100-EFFF)
		- Display disk light
        - Support for IMSAI VIO-1 S100 Video Card. 
        - Support for H19 terminal escape sequences + semigraphic characters. 
        - Mouse wheel (and PgUp/PgDn) displays the screen text history
        - Support for Cromemco Dazzler S100 Video Card. 
        - when a file (.COM, .SUB or .BAS) si dropped, cpm_player gets the focus so user can 
          type command line parameters or just press enter to execute the program
        - LogCPU option to log in cpm.log file all z80 instructions executed
	Removed features
		- No support for UNICODE
		- No support fow Windows CE
		- threads have normal priority, not above normal

*/


#include "stdafx.h"
#include <tchar.h> // needed to allow locate winmain 
#include <shellapi.h>
#include <commctrl.h>

#include "CPM_Player.h"

#define MAX_LOADSTRING 100

// Global Variables:
HINSTANCE hInst;							// current instance
char szTitle[MAX_LOADSTRING];				// The title bar text
char szWindowClass[MAX_LOADSTRING];			// the main window class name
HWND hWnd;                                  // main window handle

// Forward declarations of functions included in this code module:
ATOM				MyRegisterClass(HINSTANCE hInstance);
BOOL				InitInstance(HINSTANCE, int);
LRESULT CALLBACK	WndProc(HWND, UINT, WPARAM, LPARAM);
INT_PTR CALLBACK	About(HWND, UINT, WPARAM, LPARAM);

void    InitCPMPlayer1(void);
void    InitCPMPlayer2(void);
void    ExitCleanup(void);

int APIENTRY _tWinMain(_In_ HINSTANCE hInstance,
                     _In_opt_ HINSTANCE hPrevInstance,
                     _In_ LPTSTR    lpCmdLine,
                     _In_ int       nCmdShow)
{
	UNREFERENCED_PARAMETER(hPrevInstance);
	UNREFERENCED_PARAMETER(lpCmdLine);

 	// TODO: Place code here.
	MSG msg;
	HACCEL hAccelTable;

	// Initialize global strings
	LoadString(hInstance, IDS_APP_TITLE, szTitle, MAX_LOADSTRING);
	LoadString(hInstance, IDC_CPM_PLAYER, szWindowClass, MAX_LOADSTRING);
	MyRegisterClass(hInstance);

	// Perform application initialization:
	if (!InitInstance (hInstance, nCmdShow))
	{
		return FALSE;
	}

	hAccelTable = LoadAccelerators(hInstance, MAKEINTRESOURCE(IDA_CPM_PLAYER_Accel));

	// Main message loop:
	while (GetMessage(&msg, NULL, 0, 0))
	{
		if (!TranslateAccelerator(msg.hwnd, hAccelTable, &msg))
		{
			TranslateMessage(&msg);
			DispatchMessage(&msg);
		}
	}
    ExitCleanup();

	return (int) msg.wParam;
}



//
//  FUNCTION: MyRegisterClass()
//
//  PURPOSE: Registers the window class.
//
ATOM MyRegisterClass(HINSTANCE hInstance)
{
	WNDCLASSEX wcex;

	wcex.cbSize = sizeof(WNDCLASSEX);

	wcex.style			= CS_HREDRAW | CS_VREDRAW;
	wcex.lpfnWndProc	= WndProc;
	wcex.cbClsExtra		= 0;
	wcex.cbWndExtra		= 0;
	wcex.hInstance		= hInstance;
	wcex.hIcon			= LoadIcon(hInstance, MAKEINTRESOURCE(IDI_CPM_PLAYER_48x48));
    wcex.hCursor		= LoadCursor(NULL, IDC_ARROW); 
	wcex.hbrBackground	= (HBRUSH)(COLOR_WINDOW+1);
	wcex.lpszMenuName	= MAKEINTRESOURCE(IDC_CPM_PLAYER);
	wcex.lpszClassName	= szWindowClass;
	wcex.hIconSm		= LoadIcon(wcex.hInstance, MAKEINTRESOURCE(IDI_CPM_PLAYER_64x64));

	return RegisterClassEx(&wcex);
}

//
//   FUNCTION: InitInstance(HINSTANCE, int)
//
//   PURPOSE: Saves instance handle and creates main window
//
//   COMMENTS:
//
//        In this function, we save the instance handle in a global variable and
//        create and display the main program window.
//
BOOL InitInstance(HINSTANCE hInstance, int nCmdShow)
{
   InitCPMPlayer1();

   hInst = hInstance; // Store instance handle in our global variable

   // create the window as non-visible
   hWnd = CreateWindow(szWindowClass, szTitle, 
      WS_OVERLAPPED | WS_CAPTION | WS_SYSMENU | WS_MINIMIZEBOX ,
      CW_USEDEFAULT, 0, CW_USEDEFAULT, 0, 
      NULL, NULL, hInstance, NULL);

   if (!hWnd) return FALSE;

   ShowWindow(hWnd, nCmdShow);
   UpdateWindow(hWnd);

   InitCPMPlayer2();
   return TRUE;
}

// externals used in WndProc
#include "console.h"
extern CONSOLE* console;
#include "cpm.h"
extern CPM* cpm;

//
//  FUNCTION: WndProc(HWND, UINT, WPARAM, LPARAM)
//
//  PURPOSE:  Processes messages for the main window.
//
//  WM_COMMAND	- process the application menu
//  WM_PAINT	- Paint the main window
//  WM_DESTROY	- post a quit message and return
//
//
LRESULT CALLBACK WndProc(HWND hWnd, UINT message, WPARAM wParam, LPARAM lParam)
{
	int wmId, wmEvent;
	PAINTSTRUCT ps;
	HDC hdc;

	switch (message)
	{
	case WM_COMMAND:
		wmId    = LOWORD(wParam);
		wmEvent = HIWORD(wParam);
		// Parse the menu selections:
		switch (wmId)
		{
//		case IDM_ABOUT:
//			DialogBox(hInst, MAKEINTRESOURCE(IDD_ABOUTBOX), hWnd, About);
//			break;
//		case IDM_EXIT:
//			DestroyWindow(hWnd);
//			break;
		case ID_OPEN:
            extern void OpenFilePopUpWindow(HWND hWnd);
			OpenFilePopUpWindow(hWnd);
			break;
		case ID_PAUSE:
			console->paused = (console->paused ? FALSE : TRUE); 
			console->RequestRefreshScreen(false);
			break;
		case ID_RESET:
            extern void LoadStartupSettings();
            extern void StartupScreen();
            extern void SetMainWindow(HWND hWnd);
			console->Terminate();
			cpm->Terminate();
            cpm->ClearMemory(); 
			LoadStartupSettings();
			console->Reset();
			SetMainWindow(hWnd);
			console->ClearScreen(true);
			StartupScreen();
			console->RequestRefreshScreen(true);
			break;
		case ID_EXIT:
			SendMessage(hWnd, WM_CLOSE, 0, 0L);
			break;
        case ID_SAVE_RAM:
            if (cpm) cpm->SaveRAM(); 
            break; 
		case ID_RECENT1:
            extern void RunRecentCPMFile(int nRecentFile);
			RunRecentCPMFile(0);
			break;
		case ID_RECENT2:
			RunRecentCPMFile(1);
			break;
		case ID_RECENT3:
			RunRecentCPMFile(2);
			break;
		case ID_RECENT4:
			RunRecentCPMFile(3);
			break;
		case ID_RECENT5:
			RunRecentCPMFile(4);
			break;
		case ID_COPY:
            extern void EditCopy(VOID);
			EditCopy();
			break;
		case ID_PASTE:
            extern void EditPaste(VOID);
			EditPaste();
			break;
		case ID_FONT:
            extern void SelectFont(HWND hWnd);
			SelectFont(hWnd);
			console->RequestRefreshScreen(true);
			break;
		case ID_SCREEN1:
            extern int columns, lines;
			columns = 80; lines = 48; 
            goto set_screen_col_lines; 
		case ID_SCREEN2:
			columns = 80; lines = 24; 
            goto set_screen_col_lines; 
		case ID_SCREEN3:
			columns = 40; lines = 24;
            goto set_screen_col_lines; 
		case ID_SCREEN4:
			columns = 132; lines = 24;
         set_screen_col_lines:
			SetMainWindow(hWnd);
			console->RequestRefreshScreen(true);
			break;
		case ID_NOCURSOR:
            extern int cursor_type; 
			cursor_type = 0;
            goto set_screen_cursor; 
		case ID_UNDERLINECURSOR:
			cursor_type = 1;
            goto set_screen_cursor; 
		case ID_BLOCKCURSOR:
			cursor_type = 2;
         set_screen_cursor:
			console->SetMode('T', cursor_type);
			console->RequestRefreshScreen(false);
			break;
		case ID_SLOW:
			cpm->SetMode('S', -1);
			break;
		case ID_FAST:
			cpm->SetMode('S', +1);
			break;
		case ID_MAX_SPEED:
			cpm->SetMode('S', 0);
			break;
        case ID_REALHW_SPEED:
			cpm->SetMode('S', 4); // real z80 hw speed is 4 MHZ
			break;
		case ID_USE_LOGFILES:
            extern int use_log_file;
			use_log_file = (use_log_file ? 0 : 1);
			console->SetMode('L', use_log_file);
			cpm->SetMode('L', use_log_file);
			break;
		case ID_USE_SCREENLOG:
            extern bool use_screen_log;
			use_screen_log = (use_screen_log ? FALSE : TRUE);
			console->SetMode('S', use_screen_log);
			break;
		case ID_USE_PRINTERLOG:
            extern bool use_printer_log;
			use_printer_log = (use_printer_log ? FALSE : TRUE);
			console->SetMode('P', use_printer_log);
			break;
        case ID_CPU_LOG:
            extern int cpu_log; 
			cpu_log = ((cpu_log==0) ? 1: 0);
            break;
		case ID_DISPLAY_CPS_IPS:
            extern bool display_cps_ips;
			display_cps_ips = (display_cps_ips ? FALSE : TRUE);
			console->SetMode('I', display_cps_ips);
			break;
		case ID_DISPLAY_DISK_IO:
            extern bool display_disk_io;
			display_disk_io = (display_disk_io ? FALSE : TRUE);
			console->SetMode('D', display_disk_io);
			break;
		case ID_CONSOLE_ECHO:
            extern bool console_echo; 
			console_echo = (console_echo ? FALSE : TRUE);
			console->SetMode('E', console_echo);
			break;
		case ID_UPCASE_ONLY:
            extern bool upper_case_only;
			upper_case_only = (upper_case_only ? FALSE : TRUE);
			console->SetMode('U', upper_case_only);
			break;
		case ID_ANSI:
            extern int terminal_type;
			terminal_type = CRT_VT100;
            goto set_screen_term_type; 
		case ID_KAYPRO:
			terminal_type = CRT_KAYPRO;
            goto set_screen_term_type; 
		case ID_OTHER:
            terminal_type = CRT_OTHER;
            goto set_screen_term_type; 
        case ID_TERM125:
            terminal_type = CRT_TERM125;
            goto set_screen_term_type; 
		case ID_OSBORNE:
            terminal_type = CRT_OSBORNE;
            goto set_screen_term_type; 
		case ID_VIO:
            terminal_type = CRT_VIO;
            columns = 80; lines = 24;
            goto set_screen_term_type; 
		case ID_DAZZLER:
            terminal_type = CRT_DAZZLER;
            columns = 80; lines = 24;
            goto set_screen_term_type; 
		case ID_TEK4010:
            terminal_type = CRT_TEK4010;
            columns = 74; lines = 35;
            goto set_screen_term_type; 
         set_screen_term_type:
            extern void SetTerminal_tpa_limit();
            extern int tpa_limit;
            cpm->Terminate();
            console->Terminate();
            console->ClearScreen(true);
            console->SetMode('Y', terminal_type);
            if (terminal_type != CRT_OTHER) {
              	// clear Ctrl Seq
                console->SetCtrlSeq(NULL, NULL, NULL, NULL, NULL); 
            }
       	    SetMainWindow(hWnd);
            StartupScreen();
		    console->RequestRefreshScreen(true);
        	SetTerminal_tpa_limit();
       		cpm->SetMode('B', tpa_limit);
		    break;
		case ID_SAVESETTINGS:
            extern void SaveSettings();
			SaveSettings();
			break;
		case ID_VERSION22:
            extern int version;
			version = 0x22;
            goto set_cpm_version; 
		case ID_VERSION28:
			version = 0x28;
            goto set_cpm_version; 
		case ID_VERSION31:
			version = 0x31;
            goto set_cpm_version; 
		case ID_VERSIONCDOS:
			version = 201;
         set_cpm_version:
			cpm->SetMode('V', version);
			break;
		case ID_VIEW_INI:
            extern void ViewFile(char* file); 
			ViewFile("cpm.ini");
			break;
		case ID_VIEW_CPM_LOG:
            if (cpm) cpm->log->flush(); 
			ViewFile("cpm.log");
			break;
		case ID_VIEW_CONSOLE_LOG:
            if (console) console->log->flush();
			ViewFile("console.log");
			break;
		case ID_VIEW_SCREEN:
            if (console) console->screen_log->flush();
			ViewFile("screen.txt");
			break;				
		case ID_VIEW_PRINTER:
            if (console) console->printer_log->flush();
			ViewFile("printer.txt");
			break;				
		default:
			return DefWindowProc(hWnd, message, wParam, lParam);
		}
		break;
	case WM_INITMENUPOPUP:
        extern int recent_cnt;
        extern char recent_file[RECENT_MAX][MAX_PATH];
        extern char recent_folder[RECENT_MAX][MAX_PATH];
        extern int	use_log_file;
        extern bool use_screen_log;
        extern bool use_printer_log;
        extern bool display_cps_ips;
        extern bool display_disk_io;
        extern char paste_text[MAX_PASTE];
        extern int columns, lines;
        extern int cursor_type; 
        extern bool console_echo; 
        extern bool upper_case_only;
        extern int terminal_type;
        extern int version;
        HMENU hMainMenu; 
        hMainMenu=GetMenu(hWnd); // get main window menu 
        if ((HMENU)wParam == GetSubMenu(hMainMenu, 0)) {
			if (console->paused) {
				CheckMenuItem((HMENU)wParam, ID_PAUSE, MF_CHECKED);					
			} else {
				CheckMenuItem((HMENU)wParam, ID_PAUSE, MF_UNCHECKED);					
			} 

            DeleteMenu((HMENU)wParam, ID_RECENT1, MF_BYCOMMAND);
			DeleteMenu((HMENU)wParam, ID_RECENT2, MF_BYCOMMAND);
			DeleteMenu((HMENU)wParam, ID_RECENT3, MF_BYCOMMAND);
			DeleteMenu((HMENU)wParam, ID_RECENT4, MF_BYCOMMAND);
			DeleteMenu((HMENU)wParam, ID_RECENT5, MF_BYCOMMAND);
		
            char sMenu[80], sUnit[10]; 
            char sPath[MAX_PATH];
            int n, i, iFound; 
            // populate recent programs menu items
            for (n=4; n>=0;n--) {
			    if(recent_cnt > n) {
                    if (strlen(recent_folder[n])<MAX_RECENT_FOLDER_LEN) {
                        // short folder 
                        sprintf_s(sMenu, "%s%s", recent_folder[n], recent_file[n]); 
                    } else {
                        // get drive unit
                        strcpy_s(sPath, recent_folder[n]);
                        sUnit[0]=0; 
                        if (recent_folder[n][1]==':') {
                            for (i=0; i<3; i++) sUnit[i]=sPath[i]; 
                            strcpy_s(sPath, &sPath[3]);
                            sUnit[3]=0;
                        }
                        // last folder too long
                        iFound = strlen(sPath)-MAX_RECENT_FOLDER_LEN+4;
                        sprintf_s(sMenu, "%s...%s%s", sUnit, &sPath[iFound], recent_file[n]); 
                    } 
				    AppendMenu((HMENU)wParam, MF_STRING, ID_RECENT1+n, sMenu);
                }
            }
		}
		else if ((HMENU)wParam == GetSubMenu(hMainMenu, 1)) {
			if (cpm->GetMode('S') < 1) {
				CheckMenuItem((HMENU)wParam, ID_MAX_SPEED, MF_CHECKED);					
			} else {
				CheckMenuItem((HMENU)wParam, ID_MAX_SPEED, MF_UNCHECKED);					
			}
			if (cpm->GetMode('S') == 4*1000*1000) {
				CheckMenuItem((HMENU)wParam, ID_REALHW_SPEED, MF_CHECKED);					
			} else {
				CheckMenuItem((HMENU)wParam, ID_REALHW_SPEED, MF_UNCHECKED);					
			}
			if (use_log_file) {
				CheckMenuItem((HMENU)wParam, ID_USE_LOGFILES, MF_CHECKED);					
			} else {
				CheckMenuItem((HMENU)wParam, ID_USE_LOGFILES, MF_UNCHECKED);					
			}
			if (use_screen_log) {
				CheckMenuItem((HMENU)wParam, ID_USE_SCREENLOG, MF_CHECKED);					
			} else {
				CheckMenuItem((HMENU)wParam, ID_USE_SCREENLOG, MF_UNCHECKED);					
			}
			if (use_printer_log) {
				CheckMenuItem((HMENU)wParam, ID_USE_PRINTERLOG, MF_CHECKED);					
			} else {
				CheckMenuItem((HMENU)wParam, ID_USE_PRINTERLOG, MF_UNCHECKED);					
			}
			if (display_cps_ips) {
				CheckMenuItem((HMENU)wParam, ID_DISPLAY_CPS_IPS, MF_CHECKED);					
			} else {
				CheckMenuItem((HMENU)wParam, ID_DISPLAY_CPS_IPS, MF_UNCHECKED);					
			}			
			if (display_disk_io) {
				CheckMenuItem((HMENU)wParam, ID_DISPLAY_DISK_IO, MF_CHECKED);					
			} else {
				CheckMenuItem((HMENU)wParam, ID_DISPLAY_DISK_IO, MF_UNCHECKED);					
			}			
			if (IsClipboardFormatAvailable(CF_TEXT)) {
				EnableMenuItem((HMENU)wParam, ID_PASTE, MF_BYCOMMAND | MF_ENABLED);
			} else {
				EnableMenuItem((HMENU)wParam, ID_PASTE, MF_BYCOMMAND | MF_GRAYED);
			}
		}
		else if ((HMENU)wParam == GetSubMenu(hMainMenu, 2)) {
			if(columns == 80 && lines == 48)
				CheckMenuRadioItem((HMENU)wParam, ID_SCREEN1, ID_SCREEN4, ID_SCREEN1, MF_BYCOMMAND);
			else if(columns == 80 && lines == 24)
				CheckMenuRadioItem((HMENU)wParam, ID_SCREEN1, ID_SCREEN4, ID_SCREEN2, MF_BYCOMMAND);
			else if(columns == 40 && lines == 24)
				CheckMenuRadioItem((HMENU)wParam, ID_SCREEN1, ID_SCREEN4, ID_SCREEN3, MF_BYCOMMAND);
			else if(columns == 132 && lines == 24)
				CheckMenuRadioItem((HMENU)wParam, ID_SCREEN1, ID_SCREEN4, ID_SCREEN4, MF_BYCOMMAND);
			if(cursor_type == 0) {
				CheckMenuRadioItem((HMENU)wParam, ID_NOCURSOR, ID_BLOCKCURSOR, ID_NOCURSOR, MF_BYCOMMAND);
			} else if (cursor_type == 2) {
				CheckMenuRadioItem((HMENU)wParam, ID_NOCURSOR, ID_BLOCKCURSOR, ID_BLOCKCURSOR, MF_BYCOMMAND);
			} else {
				cursor_type = 1;
				CheckMenuRadioItem((HMENU)wParam, ID_NOCURSOR, ID_BLOCKCURSOR, ID_UNDERLINECURSOR, MF_BYCOMMAND);
			}
            char* term_name = (console->CustomTerminalName);
            if ((term_name) && (term_name[0])) {
                ModifyMenu((HMENU)wParam, ID_OTHER, MF_BYCOMMAND | MF_STRING, ID_OTHER, term_name); 
            } else {
                ModifyMenu((HMENU)wParam, ID_OTHER, MF_BYCOMMAND | MF_STRING, ID_OTHER, "Other"); 
            }
			if (terminal_type == CRT_OTHER) {
				CheckMenuRadioItem((HMENU)wParam, ID_ANSI, ID_TEK4010, ID_OTHER, MF_BYCOMMAND);
			} else if (terminal_type == CRT_KAYPRO) {
				CheckMenuRadioItem((HMENU)wParam, ID_ANSI, ID_TEK4010, ID_KAYPRO, MF_BYCOMMAND);
			} else if (terminal_type == CRT_OSBORNE) {
				CheckMenuRadioItem((HMENU)wParam, ID_ANSI, ID_TEK4010, ID_OSBORNE, MF_BYCOMMAND);
			} else if (terminal_type == CRT_VIO) {
				CheckMenuRadioItem((HMENU)wParam, ID_ANSI, ID_TEK4010, ID_VIO, MF_BYCOMMAND);
			} else if (terminal_type == CRT_DAZZLER) {
				CheckMenuRadioItem((HMENU)wParam, ID_ANSI, ID_TEK4010, ID_DAZZLER, MF_BYCOMMAND);
			} else if (terminal_type == CRT_VT100) {
				CheckMenuRadioItem((HMENU)wParam, ID_ANSI, ID_TEK4010, ID_ANSI, MF_BYCOMMAND);
			} else if (terminal_type == CRT_TEK4010) {
				CheckMenuRadioItem((HMENU)wParam, ID_ANSI, ID_TEK4010, ID_TEK4010, MF_BYCOMMAND);
            }
			if(console_echo) {
				CheckMenuItem((HMENU)wParam, ID_CONSOLE_ECHO, MF_CHECKED);					
			} else {
				CheckMenuItem((HMENU)wParam, ID_CONSOLE_ECHO, MF_UNCHECKED);					
			}
			if(upper_case_only) {
				CheckMenuItem((HMENU)wParam, ID_UPCASE_ONLY, MF_CHECKED);					
			} else {
				CheckMenuItem((HMENU)wParam, ID_UPCASE_ONLY, MF_UNCHECKED);					
			}
		} else if ((HMENU)wParam == GetSubMenu(hMainMenu, 3)) {
			if(version == 0x22)
				CheckMenuRadioItem((HMENU)wParam, ID_VERSION22, ID_VERSIONCDOS, ID_VERSION22, MF_BYCOMMAND);
			else if(version == 0x28)
				CheckMenuRadioItem((HMENU)wParam, ID_VERSION22, ID_VERSIONCDOS, ID_VERSION28, MF_BYCOMMAND);
			else if(version == 201)
				CheckMenuRadioItem((HMENU)wParam, ID_VERSION22, ID_VERSIONCDOS, ID_VERSIONCDOS, MF_BYCOMMAND);
			else
				CheckMenuRadioItem((HMENU)wParam, ID_VERSION22, ID_VERSIONCDOS, ID_VERSION31, MF_BYCOMMAND);
		}
		break;
    case WM_CONTEXTMENU:
        {
            extern int cpu_log; 
            POINT pt;   // location of mouse click        }
            // Get the screen coordinates for the mouse click.  
            pt.x = LOWORD(lParam); 
            pt.y = HIWORD(lParam); 
            // convert pt to be relative to application window

            HMENU hmenu;            // menu template          
            HMENU hmenuTrackPopup;  // shortcut menu   
            //  Load the menu template containing the shortcut menu from the 
            //  application's resources. 
            hmenu = LoadMenu(hInst,  MAKEINTRESOURCE(IDC_CPM_PLAYER)); 
            if (hmenu == NULL) break; 
 
            // Get the first shortcut menu in the menu template. This is the 
            // menu that TrackPopupMenu displays. 
            hmenuTrackPopup = GetSubMenu(hmenu, 4); 

			if (display_cps_ips) {
				CheckMenuItem(hmenuTrackPopup, ID_DISPLAY_CPS_IPS, MF_CHECKED);					
			} else {
				CheckMenuItem(hmenuTrackPopup, ID_DISPLAY_CPS_IPS, MF_UNCHECKED);					
			}			
			if (display_disk_io) {
				CheckMenuItem(hmenuTrackPopup, ID_DISPLAY_DISK_IO, MF_CHECKED);					
			} else {
				CheckMenuItem(hmenuTrackPopup, ID_DISPLAY_DISK_IO, MF_UNCHECKED);					
			}			
			if (IsClipboardFormatAvailable(CF_TEXT)) {
				EnableMenuItem(hmenuTrackPopup, ID_PASTE, MF_BYCOMMAND | MF_ENABLED);
			} else {
				EnableMenuItem(hmenuTrackPopup, ID_PASTE, MF_BYCOMMAND | MF_GRAYED);
			}
			if (use_log_file) {
				CheckMenuItem(hmenuTrackPopup, ID_USE_LOGFILES, MF_CHECKED);					
			} else {
				CheckMenuItem(hmenuTrackPopup, ID_USE_LOGFILES, MF_UNCHECKED);					
			}
			if (use_screen_log) {
				CheckMenuItem(hmenuTrackPopup, ID_USE_SCREENLOG, MF_CHECKED);					
			} else {
				CheckMenuItem(hmenuTrackPopup, ID_USE_SCREENLOG, MF_UNCHECKED);					
			}
			if (use_printer_log) {
				CheckMenuItem(hmenuTrackPopup, ID_USE_PRINTERLOG, MF_CHECKED);					
			} else {
				CheckMenuItem(hmenuTrackPopup, ID_USE_PRINTERLOG, MF_UNCHECKED);					
			}

            if (cpu_log) {
				CheckMenuItem(hmenuTrackPopup, ID_CPU_LOG, MF_CHECKED);					
			} else {
				CheckMenuItem(hmenuTrackPopup, ID_CPU_LOG, MF_UNCHECKED);					
            }

            // TrackPopup uses screen coordinates
            // Draw and track the shortcut menu.  
            TrackPopupMenu(hmenuTrackPopup, TPM_LEFTALIGN | TPM_LEFTBUTTON, 
                pt.x, pt.y, 0, hWnd, NULL); 
 
            // Destroy the menu. 
            DestroyMenu(hmenu); 
        }
		break;
    case WM_MOUSEWHEEL:
        int zDelta;
        zDelta = GET_WHEEL_DELTA_WPARAM(wParam);
        zDelta = zDelta / 120; 
        if (abs(zDelta > 1)) {
            zDelta=zDelta * 10; 
        }
        if (console) {
            console->ShowScreenHistoryBuffer(zDelta); 
            console->RequestRefreshScreen(false);
        }
        break;
	case WM_PAINT:
        RECT rect; 
		if(GetUpdateRect(hWnd, &rect, TRUE)) {
			hdc = BeginPaint(hWnd, &ps);
			if(console) console->Blt(hdc, rect.left, rect.top, 
                                          rect.right - rect.left, 
                                          rect.bottom - rect.top);
			EndPaint(hWnd, &ps);
		}
		break;
    case WM_KEYUP:
        // sense joystick
		int KeyScanCode;
        if ((terminal_type == CRT_DAZZLER) && (console->DazzlerCard(6,0,0))) { // DazzlerCard(6) returns 1 if Joy should be sensed
       		KeyScanCode = LOBYTE(wParam); // scan code
         	if ((KeyScanCode == 37) || (KeyScanCode == 39)) { // joy1 left/right key release
                console->DazzlerCard(5, 0 /* joy1 */, ('X'<<8) + 0 /* x axis stop motion */); 
            } else if ((KeyScanCode == 38) || (KeyScanCode == 40)) { // up/down key release
                console->DazzlerCard(5, 0 /* joy1 */, ('Y'<<8) + 0 /* y axis stop motion */); 
            } else if ((KeyScanCode >= 96) && (KeyScanCode <= 99)) { // keypad 0,1,2,3 -> Joy1 button1..4
                console->DazzlerCard(5, 0 /* joy1 */, ('B'<<8) + KeyScanCode-95 /* button num */ + 0 /* not pressed */); 
            } else if ((KeyScanCode == 65) || (KeyScanCode == 68)) { // joy2 left/right key release
                console->DazzlerCard(5, 1 /* joy2 */, ('X'<<8) + 0 /* x axis stop motion */); 
            } else if ((KeyScanCode == 87) || (KeyScanCode == 83)) { // up/down key release
                console->DazzlerCard(5, 1 /* joy2 */, ('Y'<<8) + 0 /* y axis stop motion  */); 
            } else if ((KeyScanCode == 71) || (KeyScanCode == 72)) { // keys G H -> Joy2 button1..2
                console->DazzlerCard(5, 1 /* joy2 */, ('B'<<8) + KeyScanCode-70 /* button num */ + 0 /* not pressed */); 
            } else if ((KeyScanCode == 74) || (KeyScanCode == 75)) { // keys J K -> Joy2 button3..4
                console->DazzlerCard(5, 1 /* joy2 */, ('B'<<8) + KeyScanCode-74+3 /* button num */ + 0 /* not pressed */); 
            }
        }
        break;
	case WM_KEYDOWN:
        int PCKey; 
		// capture PC keys an converts in Ctrl-XX sequences
        extern void RunRecentCPMFile(int nRecentFile);
        extern void RunRecentCCPforCPMFile(int nRecentFile);
        extern char PCKeyDef[MAX_PCKEYS][MAX_PCKEYS_LEN+2];
		KeyScanCode = LOBYTE(wParam); // scan code
        if ((cpm) && (!cpm->IsRunning())) { 
            // emulation not running. CPM program termianted/not yet init
			if (KeyScanCode == 38) { // KeyUp is same as run last recent program
				if (recent_cnt > 0) RunRecentCPMFile(recent_cnt-1);
			} else if (KeyScanCode == 13) { // Enter -> start CCP console at last recent program dir
				RunRecentCCPforCPMFile(recent_cnt-1);
			} else if (KeyScanCode == 33) { // PgUp
                console->ShowScreenHistoryBuffer(5); 
                console->RequestRefreshScreen(false);
            } else if (KeyScanCode == 34) { // PgDn
                console->ShowScreenHistoryBuffer(-5); 
                console->RequestRefreshScreen(false);
            } else if (KeyScanCode == 36) { // Home
                if (terminal_type == CRT_TEK4010) {
                    // even if emulation terminated, if terminal is tek, allow the activation of GIN mode
                    // with the Home key
                    PCKey=K_Home; 
                    goto process_key; 
                }
            }
			break;
		} 
        if ((terminal_type == CRT_DAZZLER) && (console->DazzlerCard(6,0,0))) { // DazzlerCard(6) returns 1 if Joy should be sensed
            // sense cromenco JS-1 joystick
        	if (KeyScanCode == 37) { // left key down
                console->DazzlerCard(5, 0 /* joy1 */, ('X'<<8) + 128 /* left */); 
            } else if (KeyScanCode == 39) { // right
                console->DazzlerCard(5, 0 /* joy1 */, ('X'<<8) +  64 /* right */); 
            } else if (KeyScanCode == 38) { // up 
                console->DazzlerCard(5, 0 /* joy1 */, ('Y'<<8) +  64 /* up */); 
            } else if (KeyScanCode == 40) { // down
                console->DazzlerCard(5, 0 /* joy1 */, ('Y'<<8) + 128 /* down */); 
            } else if ((KeyScanCode >= 96) && (KeyScanCode <= 99)) { // keypad 0,1,2,3 -> Joy1 button1..4
                console->DazzlerCard(5, 0 /* joy1 */, ('B'<<8) + KeyScanCode-95 /* button num */ + 8 /* pressed */); 
            } else if (KeyScanCode == 65) { // A (left) key down
                console->DazzlerCard(5, 1 /* joy2 */, ('X'<<8) + 128 /* left */); 
            } else if (KeyScanCode == 68) { // D (right)
                console->DazzlerCard(5, 1 /* joy2 */, ('X'<<8) +  64 /* right */); 
            } else if (KeyScanCode == 87) { // W (up)
                console->DazzlerCard(5, 1 /* joy2 */, ('Y'<<8) +  64 /* up */); 
            } else if (KeyScanCode == 83) { // S (down)
                console->DazzlerCard(5, 1 /* joy2 */, ('Y'<<8) + 128 /* down */); 
            } else if ((KeyScanCode == 71) || (KeyScanCode == 72)) { // keys G H -> Joy2 button1..2
                console->DazzlerCard(5, 1 /* joy2 */, ('B'<<8) + KeyScanCode-70 /* button num */ + 8 /* pressed */); 
            } else if ((KeyScanCode == 74) || (KeyScanCode == 75)) { // keys J K -> Joy2 button3..4
                console->DazzlerCard(5, 1 /* joy2 */, ('B'<<8) + KeyScanCode-74+3 /* button num */ + 8 /* pressed */); 
            }
        }
        // create ascii code for non-ascii keys
        PCKey = 0; 
    	if (KeyScanCode == 37) { PCKey = K_Left;  } else // left
		if (KeyScanCode == 39) { PCKey = K_Right; } else // right
		if (KeyScanCode == 38) { PCKey = K_Up;    } else // up 
		if (KeyScanCode == 40) { PCKey = K_Down;  } else // down
		if (KeyScanCode == 45) { PCKey = K_Ins;   } else // Ins
		if (KeyScanCode == 46) { PCKey = K_Del;   } else // Del
		if (KeyScanCode == 36) { PCKey = K_Home;  } else // Home
		if (KeyScanCode == 35) { PCKey = K_End;   } else // End
		if (KeyScanCode == 33) { PCKey = K_PgUp;  } else // PgUp
		if (KeyScanCode == 34) { PCKey = K_PgDn;  } else // PgDn
        if (KeyScanCode == 112) { PCKey = K_F1;    } else // F1
        if (KeyScanCode == 113) { PCKey = K_F2;    } else // F2
        if (KeyScanCode == 114) { PCKey = K_F3;    } else // F3
        if (KeyScanCode == 115) { PCKey = K_F4;    } else // F4
        if (KeyScanCode == 116) { PCKey = K_F5;    } else // F5
        if (KeyScanCode == 117) { PCKey = K_F6;    } else // F6
        if (KeyScanCode == 118) { PCKey = K_F7;    } else // F7
        if (KeyScanCode == 119) { PCKey = K_F8;    } else // F8
        if (KeyScanCode == 120) { PCKey = K_F9;    }      // F9
        if (PCKey > 0) {   
            // the previous keys have scancode but do not generate WM_CHAR evet
            // we have a generated ascii value for these keys, so goto process them
            // as if they were regular ascii keys
            goto process_key; 
		}
		break;
	case WM_CHAR:
        PCKey=LOBYTE(wParam); // ascii value
      process_key:
		if(console) {
            extern int use_RG512_card; 
            if ((PCKey== K_Home) && (terminal_type==CRT_TEK4010)) {
                // Home pressed with terminal set to Tektronix 4010 -> Activate GIN mode
                console->Tek4010(1,0); // toggle GIN mode
                console->RequestRefreshScreen(false);
            } else if ((PCKey== 27) && (terminal_type==CRT_TEK4010)) {
                // esc pressed with terminal set to Tektronix 4010 -> Erase CRT
                console->Tek4010(0,0); // clear screen
            } else if ((PCKey== 27) && (strlen(paste_text) > 0)) {
				// esc pressed while pasting text -> cancel pasting
                console->PasteToKeyboard("");
            } else if (console->KeyboardRawMode) {
                // raw mode set when reading an input line (BDOS 10 buffered console input) 
                // and when reading command line paramters prior to starting a cpm prog opened/dropped
                // Do not translate keys
                console->PressKey(PCKey);
			} else {
                // check if key is translated
                int ifound=-1; 
				for (int i = 0; i<MAX_PCKEYS; i++) {
					if (PCKeyDef[i][0] == 0) break; // no more definitions
					if ((uint8)(PCKeyDef[i][0]) != PCKey) continue;
					// Key translation found
					if (PCKeyDef[i][1] == 0) continue; // continue if no tralation is defined
                    ifound=i;
                    break;
                } 
                if (ifound >= 0) {
    				// key traslated, return key translation
					BYTE c;
					for (int j=0; j<MAX_PCKEYS_LEN;j++) {
						c = PCKeyDef[ifound][1+j];
						if (c == 0) break;
						console->PressKey(c);
					}
                } else if (PCKey >= K_Left) {
                    // non ascii key but not translated -> ignore
                } else {
    				// regular key not traslated, process as regular key
                    // if Tek4010 and mode GIN active ...
                    extern int use_RG512_card; 
                    extern int GSX_mouse_read; 
                    if (((terminal_type == CRT_TEK4010) || (use_RG512_card)) && 
                        (console->Tek4010(2,0))) {
                        // ... send GIN data just after the pressed key
                        if (PCKey == 13) {
                            // ENTER pressed with terminal in RG-512 GIN mode Simulates the 
                            // GSX button 2 of mouse (the DONE button stated in DrDraw doc)
                            // GSX button 1 is left button click os space key pressed (the PICK
                            // bitton in DrDraw doc)
        	    			console->PressKey(32 + 1);
                        } else {
                            // regular keys that simulates the button using keyboard:
                            // space -> button 1 (PCKey=32)
                            // '!'   -> button 2 (PCKey=33)
                            // '"'   -> button 3 (PCKey=34)
        	    			console->PressKey(PCKey);
                        }
                        console->Tek4010(3,0); // send GIN crosshair coords
                    } else if (GSX_mouse_read) {
                        // reading mouse loop into GSX internal driver
                        if (PCKey == 13) {
                            // ENTER pressed with GSX_mouse_read=1 Simulates the 
                            // GSX button 2 of mouse (the DONE button stated in DrDraw doc)
                            // GSX button 1 is left button click os space key pressed (the PICK
                            // bitton in DrDraw doc)
        	    			console->PressKey(32 + 1);
                        } else {
                            // regular keys that simulates the button using keyboard:
                            // space -> button 1 (PCKey=32)
                            // '!'   -> button 2 (PCKey=33)
                            // '"'   -> button 3 (PCKey=34)
        	    			console->PressKey(PCKey);
                        }
                        // mouse position is read into GSX driver mouse read loop
                    } else {
                        // regular key, just sent it to program
    	    			console->PressKey(PCKey);
                    }
                }
			} 
		}
		break;
	case WM_DROPFILES:
        extern void RunCPMFile(LPCTSTR lpstrFile, bool IsFile);
		char filename[MAX_PATH+1];
		int n;
		n = DragQueryFile(HDROP(wParam), -1, filename, MAX_PATH);
		if (n == 0) {
			MessageBox(hWnd, "No files/folders dropped.", "CP/M Player Error", 0);
		} else if (n > 1) {
			MessageBox(hWnd, "You cannot drop serveral files/folders. Drop only one", "CP/M Player Error", 0);
		} else {
			DragQueryFile(HDROP(wParam), 0, filename, MAX_PATH);
				// check if dir or file
			DWORD dwAttrib = GetFileAttributes(filename);
			
			if (dwAttrib == -1) {
				MessageBox(hWnd, "Dragged file has Invalid file attributes", "CP/M Player Error", 0);
			} else if (dwAttrib & FILE_ATTRIBUTE_DIRECTORY) {
				RunCPMFile(filename, false); // run CCP in a dir
			} else {
				RunCPMFile(filename, true);	 // run file
			}
		}
		DragFinish(HDROP(wParam));
        // set the focus on cpm_player window. 
        // this should be done (quite easely) with SetFocus/hWnd) function.
        // Nevertheless, in win32 api nothing is easy
        // windows focus steath prevention catches this and prevent the focus to change
        // so we use a dirty workarround
        // file has been droped on cpm_player, so we can supose the mouse is on top of cpm_player window
        // so we inyect a Mouse Click into the input stream to simulate a mouse click just to regain focus
        {
            INPUT inputs[2];
            ZeroMemory(inputs, sizeof(inputs));
            inputs[0].type=INPUT_MOUSE;
            inputs[0].mi.dx=0; inputs[0].mi.dy=0;
            inputs[0].mi.dwFlags=(MOUSEEVENTF_LEFTDOWN);
            inputs[0].mi.mouseData=0; inputs[0].mi.dwExtraInfo=NULL; inputs[0].mi.time=0;
            inputs[1].type=INPUT_MOUSE;
            inputs[1].mi.dx=0; inputs[1].mi.dy=0;
            inputs[1].mi.dwFlags=(MOUSEEVENTF_LEFTUP);
            inputs[1].mi.mouseData=0; inputs[1].mi.dwExtraInfo=NULL; inputs[1].mi.time=0;
            SendInput(2,inputs,sizeof(INPUT));
        }
		break;
	case WM_DESTROY:
		PostQuitMessage(0);
		break;
	case WM_TIMER:
        // each 1000/FPS milliseconds
        if (console) {
            static int ticks = 10; // ticks for blinking
            ticks--;
            if (ticks < 0) {
                ticks = CURSOR_BLINK_RATE_MS / (1000 / FPS); // blink each 300 msec
    		    console->Blink();
	    	    
            }
            console->RefreshScreen(); 
        }
		break;
    case WM_MOUSEMOVE:
        extern int GSX_mouse_read; 
        extern int use_RG512_card; 
        if (((terminal_type==CRT_TEK4010) || (use_RG512_card) || (GSX_mouse_read)) && (console) && (console->Tek4010(2,0))) {
            // if in GIN mode, refresh screen on mouse moves to update crosshair
            console->RequestRefreshScreen(false);
        }
        break;
    case WM_LBUTTONDOWN:
        if (((terminal_type==CRT_TEK4010) || (use_RG512_card)) && (console) && (console->Tek4010(2,0))) {
            // if in GIN mode, click sends an space, then GIN data
            console->PressKey(32+0); // 32+0 is Left mouse Button  (PICK function on DR DRAW doc)
            console->Tek4010(3,0);
        } else if (GSX_mouse_read) {
            // the mouse read loop is in execution into GSX internal driver
            console->PressKey(32+0); // 32+0 is Left mouse Button  (PICK function on DR DRAW doc)
        }
        break;
	default:
		return DefWindowProc(hWnd, message, wParam, lParam);
	}
	return 0;
}

// Message handler for about box.
// INT_PTR CALLBACK About(HWND hDlg, UINT message, WPARAM wParam, LPARAM lParam)
// {
// 	UNREFERENCED_PARAMETER(lParam);
// 	switch (message)
// 	{
// 	case WM_INITDIALOG:
// 		return (INT_PTR)TRUE;
// 
// 	case WM_COMMAND:
// 		if (LOWORD(wParam) == IDOK || LOWORD(wParam) == IDCANCEL)
// 		{
// 			EndDialog(hDlg, LOWORD(wParam));
// 			return (INT_PTR)TRUE;
// 		}
// 		break;
// 	}
// 	return (INT_PTR)FALSE;
// }
