#include "stdafx.h"

#include <windows.h>
#include <stdio.h>
#include <math.h>
#include "cpm.h"
#include "z80.h"
#include "console.h"
#include "..\res\resource.h"

int hist_ptr; // indica primera entrada de la historia de comandos libre
char history[HIST_MAX][512]; 

extern CPM* cpm;


CONSOLE::CONSOLE()
{
	memset(params.char_plane, 0, sizeof(params.char_plane));
	memset(params.attrib_plane, 0, sizeof(params.attrib_plane));
	memset(params.color_plane, 0, sizeof(params.color_plane));
	memset(params.alt_page.char_plane, 0, sizeof(params.alt_page.char_plane));
	memset(params.alt_page.attrib_plane, 0, sizeof(params.alt_page.attrib_plane));
	memset(params.alt_page.color_plane, 0, sizeof(params.alt_page.color_plane));
	memset(params.locked_lines, 0, sizeof(params.locked_lines));
    params.visible_page=0; 

	params.current_x_pos = params.current_y_pos = 0;
	params.save_current_x_pos = params.save_current_y_pos = params.save_current_attrib = 0;
	blink_status = FALSE;

    nhist = history_buffer_wrap = history_buffer_visible = 0; // clear terminal history buffer
	memset(params.VDC, 0, sizeof(params.VDC));
	params.VDCpage = 0;

    terminal_max_cps = 0; 
	console_echo = 0;
	upper_case_only = 0;
	display_cps_ips = 0;
	current_attrib = 0;
	current_color = 7;
	params.cursor_visible = 1;
	params.graphic_mode = 0;
    params.inverted_screen = 0;
    params.vio_mode = 0; 
    params.vt100_charset[0]=0; 
    params.vt100_charset[1]=0; 
    params.vt100_current_charset=0; 
    params.discard_at_eol=0; 
    params.request_full_redraw = 0;
	buffer_ptr = 0;
	key_r_ptr = key_w_ptr = 0;
    params.GrOverlay.enabled=0; 
    memset(&params.GrOverlay, 0, sizeof(params.GrOverlay));
    memset(&params.tek4010, 0, sizeof(params.tek4010));
    memset(&params.RG512, 0, sizeof(params.RG512));
    extern int GSX_mouse_read; 
    GSX_mouse_read=0; 
    extern int GSX_color; 
    GSX_color=1; 
    params.GSX_driver_wellcome=0; 
	
	lpBuf = NULL;
	hdcDIB = hdcDIBgr = hdcDIBgr2 = NULL;
	hBMP = hBMPgr = hBMPgr2 = NULL;
	hFont = NULL;
	hFont_underline = NULL;
	hFont_small = NULL;
	hFont_big = NULL;
	
	RefreshScreen_event_pending = 0;
	InitializeCriticalSection(&KbdCriticalSection);

	CPS_count = 0;
	CPS = 0;
	CPS_last_count = 0;
	CPS_last_ms = 0;

	IPS_count = 0;
	IPS_last_count = 0;
	IPS = 0;
	MaxIPS = 0;

	log = NULL;
	screen_log = NULL;
	printer_log = NULL;
	paused = 0;

	disk_io_activity = 0;
	display_disk_io = 0;

	Osborne_use_CharGenerator = 0;
	KeyboardRawMode = 0;

	// clear Ctrl Seq
	memset(TermCtrlSeq, 0, sizeof(TermCtrlSeq));
	memset(TermCtrlSeqAction, 0, sizeof(TermCtrlSeqAction));
	memset(TermCtrlSeqActionParam, 0, sizeof(TermCtrlSeqActionParam));
	memset(CustomTerminalName, 0, sizeof(CustomTerminalName));
    memset(TermCtrlSeqReply, 0, sizeof(TermCtrlSeqReply)); 

    // init Expect String
    ExpectString(0,NULL); 
}

CONSOLE::~CONSOLE()
{
	Release();
	DeleteCriticalSection(&KbdCriticalSection);
	if(log) delete log;
	if(screen_log) delete screen_log;
	if(printer_log) delete printer_log;
	log = NULL;
	screen_log = NULL;
    printer_log = NULL;
}

void CONSOLE::Terminate()
{
	params.terminated = TRUE;
}

void CONSOLE::Reset()
{
	current_attrib = 0;
	current_color = 7;
	params.cursor_visible = 1;
	params.graphic_mode = 0;
    params.inverted_screen = 0;
	console_echo = 0;
    extern int iobyte; 
    iobyte = 0x95; // default setting: CONSOLE=CRT, READER=PTR, PUNCH=PTP, LIST=LPT
    params.terminated = FALSE;
	paused = FALSE;
	Osborne_use_CharGenerator = 0;
    nhist = history_buffer_wrap = history_buffer_visible = 0; // clear terminal history buffer
    params.vt100_charset[0]=0; 
    params.vt100_charset[1]=0; 
    params.vt100_current_charset=0; 
    params.discard_at_eol=0;
    extern int use_RG512_card; 
    use_RG512_card=0;
    params.RG512.enabled=0; 
    params.RG512.TekMode=0; 
    params.RG512.MouseCursor=0; 
    params.GrOverlay.enabled=0; 
    params.GrOverlay.antialiased=0; 
    params.GrOverlay.nVectors=0; 
    params.dazzler.on = 0; // turn off the dazzler card
    params.dazzler.framebuffer_addr = params.dazzler.resolution_x4 = params.dazzler.framebuffer_2k = 0;  // reset defaults for dazzler
    params.dazzler.color_mode = params.dazzler.color = 0; 
    params.dazzler.JoyMode=0; 
    params.dazzler.JoyMode=0; 
    memset(&params.dazzler.joy, 0, sizeof(params.dazzler.joy)); 
    // params.dazzler.changed_mem is init when dazzler is turned on
    params.dazzler.tnow_frame_start=0; 
	memset(params.locked_lines, 0, sizeof(params.locked_lines)); // all lines are unlocked
    // clear defined keys
    extern char PCKeyDef[MAX_PCKEYS][MAX_PCKEYS_LEN+2];
	memset(&PCKeyDef, 0, sizeof(PCKeyDef));

    memset(&params.tek4010, 0, sizeof(params.tek4010));
    extern int GSX_mouse_read; 
    GSX_mouse_read=0; 
    extern int GSX_color; 
    GSX_color=1; 
    params.GSX_driver_wellcome=0; 

    // init Expect String
    ExpectString(0,NULL); 

    // init cursor
    SetCursor(LoadCursor(NULL, IDC_ARROW)); 
    SetClassLongPtr(hMain, GCLP_HCURSOR, (LONG_PTR) LoadCursor(NULL, IDC_ARROW));

    if (log) log->OutLog("\n\n[Reset]\n\n");
}


/* --------------------------------------------------------------------------
	Win32
-------------------------------------------------------------------------- */

void CONSOLE::GetWindowSize(LOGFONT *lplf, 
                            int columns, int lines, 
                            int additional_status_line, 
                            int* window_width, int* window_height)
{
	HDC hdc = GetDC(NULL);
	lpBuf = (LPBYTE)GlobalAlloc(GPTR, sizeof(BITMAPINFO));
	lpDIB = (LPBITMAPINFO)lpBuf;
	lpDIB->bmiHeader.biSize = sizeof(BITMAPINFOHEADER);
	lpDIB->bmiHeader.biWidth = 128;
	lpDIB->bmiHeader.biHeight = 128;
	lpDIB->bmiHeader.biPlanes = 1;
	lpDIB->bmiHeader.biBitCount = 16;
	lpDIB->bmiHeader.biSizeImage = 0;
	lpDIB->bmiHeader.biXPelsPerMeter = 0;
	lpDIB->bmiHeader.biYPelsPerMeter = 0;
	lpDIB->bmiHeader.biClrUsed = 0;
	lpDIB->bmiHeader.biClrImportant = 0;
	lpDIB->bmiHeader.biCompression = BI_RGB;
	hdcDIB = CreateCompatibleDC(hdc);

	lplf->lfEscapement = 0;
	lplf->lfOrientation = 0;
	lplf->lfWeight = FW_NORMAL;
	lplf->lfItalic = FALSE;
	lplf->lfUnderline = FALSE;
	lplf->lfStrikeOut = FALSE;
	hFont = CreateFontIndirect(lplf);
	SelectObject(hdcDIB, hFont);

	font_x_dots = font_y_dots = 0;
	for(int i = 0x21; i <= 0x7e; i++) {
		SIZE size;
		char string[2];
		string[0] = i;
		string[1] = '\0';
		SetTextCharacterExtra(hdcDIB, 0);
		GetTextExtentPoint32(hdcDIB, string, 1, &size);
		font_x_dots = ((int)size.cx > font_x_dots) ? (int)size.cx : font_x_dots;
		font_y_dots = ((int)size.cy > font_y_dots) ? (int)size.cy : font_y_dots;
	}

    // adjust character margins to get a reasonable aspect ratio
    double r; 
    int mx, my, action; 

    mx=my=1; 
    action=0; 
    while(1) {
        r = ((double) ((font_x_dots + mx) * columns)) / ((font_y_dots + my) * lines);
        if ((r >= 1.6) && (r <= 1.8)) break; 
        if (action > 6) break;
        if (r < 1.6) {if (mx < 1+font_x_dots/4) mx++; if (my >= -(font_y_dots/8)-1) my--; }
        if (r > 1.8) {if (mx >= -(font_x_dots/8)-1) mx--; if (my < 1+font_y_dots/4) my++; }
        action++;
    }

	font_x_dots += mx;
	font_y_dots += my;

	LOGFONT logfont;
	memset(&logfont, 0, sizeof(logfont));
	GetObject(hFont, sizeof(logfont), &logfont);
	
	screen_x_size = columns;
	screen_y_size = lines;
	*window_width = screen_x_dots = (font_x_dots) * screen_x_size;
	if ((additional_status_line) && (screen_y_size < CONS_Y_MAX-1)) {
		//Kaypro: show the status line (line 25)
		*window_height = screen_y_dots = (font_y_dots) * (screen_y_size + 1);
        has_status_line=1;
	} else {
		*window_height = screen_y_dots = (font_y_dots) * screen_y_size;
        has_status_line=0;
	}
	
	if(lpBuf) GlobalFree(lpBuf);
	if(hdcDIB) DeleteDC(hdcDIB);
	if(hFont) DeleteObject(hFont);
	lpBuf = NULL;
	hdcDIB = NULL;
	hFont = NULL;

	current_attrib = 0;
	current_color = 7;
	params.cursor_visible = 1;
	buffer_ptr = 0;
	key_r_ptr = key_w_ptr = 0;

}

void CONSOLE::Initialize(HWND hwnd, LOGFONT *lplf)
{
	hMain = hwnd;
	HDC hdc = GetDC(hwnd);
	lpBuf = (LPBYTE)GlobalAlloc(GPTR, sizeof(BITMAPINFO));
	lpDIB = (LPBITMAPINFO)lpBuf;
	lpDIB->bmiHeader.biSize = sizeof(BITMAPINFOHEADER);
	lpDIB->bmiHeader.biWidth = screen_x_dots;
	lpDIB->bmiHeader.biHeight = screen_y_dots;
	lpDIB->bmiHeader.biPlanes = 1;
	lpDIB->bmiHeader.biBitCount = 32;
	lpDIB->bmiHeader.biCompression = BI_RGB;
	lpDIB->bmiHeader.biSizeImage = 0;
	lpDIB->bmiHeader.biXPelsPerMeter = 0;
	lpDIB->bmiHeader.biYPelsPerMeter = 0;
	lpDIB->bmiHeader.biClrUsed = 0;
	lpDIB->bmiHeader.biClrImportant = 0;
	hBMP = CreateDIBSection(hdc, lpDIB, DIB_RGB_COLORS, (PVOID*)&lpBMP, NULL, 0);
    hBMPgr = CreateDIBSection(hdc, lpDIB, DIB_RGB_COLORS, (PVOID*)&lpBMPgr, NULL, 0);
    hBMPgr2 = CreateDIBSection(hdc, lpDIB, DIB_RGB_COLORS, (PVOID*)&lpBMPgr2, NULL, 0);
	hdcDIB = CreateCompatibleDC(hdc);
    hdcDIBgr = CreateCompatibleDC(hdc);
    hdcDIBgr2 = CreateCompatibleDC(hdc); // hdcDIBgr2 is used to blend graphic overlay with text image before painting and thus avoid flikering
	SelectObject(hdcDIB, hBMP);
	SelectObject(hdcDIBgr, hBMPgr);
	SelectObject(hdcDIBgr2, hBMPgr2);
	
	lplf->lfEscapement = 0; 
	lplf->lfOrientation = 0; 
	lplf->lfWeight = FW_NORMAL; 
	lplf->lfUnderline = FALSE; 
	lplf->lfStrikeOut = FALSE; 
	hFont = CreateFontIndirect(lplf);
	SelectObject(hdcDIB, hFont);

	lplf->lfUnderline = TRUE;
	hFont_underline = CreateFontIndirect(lplf);

    lplf->lfUnderline = FALSE;
    int h=lplf->lfHeight; 
    int w=lplf->lfWidth; 
    lplf->lfHeight = (int) (h * TEK_SMALL_FONT);
    lplf->lfWidth  = (int) (w * TEK_SMALL_FONT);
	hFont_small = CreateFontIndirect(lplf);
    lplf->lfHeight = (int) (h * TEK_BIG_FONT);
    lplf->lfWidth  = (int) (w * TEK_BIG_FONT);
	hFont_big = CreateFontIndirect(lplf);
    lplf->lfHeight = h;
    lplf->lfWidth  = w;

    ClearScreen_GrOverlay(); 
}

void CONSOLE::Release()
{
	if(lpBuf) GlobalFree(lpBuf);
	if(hdcDIB) DeleteDC(hdcDIB);
	if(hdcDIBgr) DeleteDC(hdcDIBgr);
	if(hdcDIBgr2) DeleteDC(hdcDIBgr2);
	if(hBMP) DeleteObject(hBMP);
	if(hBMPgr) DeleteObject(hBMPgr);
	if(hFont) DeleteObject(hFont);
	if(hFont_underline) DeleteObject(hFont_underline);
	if(hFont_small) DeleteObject(hFont_small);
	if(hFont_big) DeleteObject(hFont_big);

	lpBuf = NULL;
	hdcDIB = hdcDIBgr = hdcDIBgr2 = NULL;
	hBMP = hBMPgr = hBMPgr2 = NULL;
	hFont = NULL;
	hFont_underline = NULL;
	hFont_small = NULL;
	hFont_big = NULL;
}

void CONSOLE::Blt(HDC hdc, int x, int y, int width, int height)
{
    if ((terminal_type == CRT_TEK4010) && (params.GrOverlay.enabled) && (hdcDIBgr)) {
        // tek4010 only has graphical screen
	    BitBlt(hdc, x, y, width, height, hdcDIBgr, x, y, SRCCOPY); 
        // draw block cursor on GUI window if needed
        if (params.tek4010.refresh.draw_cursor_flag) {
            // should fillrect in ascii text screen and then SCRPAINT 
            // FillRect does not work with OR mode 
            RECT r0; 
            r0.left=0; r0.top=0; 
            r0.right = params.tek4010.last.cursor_rect.right-params.tek4010.last.cursor_rect.left; 
            r0.bottom = params.tek4010.last.cursor_rect.bottom-params.tek4010.last.cursor_rect.top; 
    	    HBRUSH bru = CreateSolidBrush(RGB(0,92,0)); // half intensity green
		    FillRect(hdcDIB, &r0, bru); 
			DeleteObject(bru);
            RECT r1; 
            memcpy(&r1, &params.tek4010.last.cursor_rect, sizeof(r1)); 
            BitBlt(hdc, r1.left, r1.top, r1.right-r1.left, r1.bottom-r1.top, 
                   hdcDIB, 0, 0, SRCPAINT); 
        }
        // draw crosshair on GUI window if needed
        if (params.tek4010.last.crosshair_draw) {
            // draw vertical and horizontal lines that cross mouse pointer position
            POINT p; 
            memcpy(&p, &params.tek4010.last.xhair_pt, sizeof(p)); 
            HPEN hPen = CreatePen(PS_SOLID, 1, RGB(0,128,0));
            HPEN svPenGr = (HPEN) SelectObject(hdc, hPen);
            MoveToEx(hdc, p.x, 0, NULL);
            LineTo(hdc, p.x, screen_y_dots);
            MoveToEx(hdc, 0, p.y, NULL);
            LineTo(hdc, screen_x_dots, p.y);
            SelectObject(hdc, svPenGr);
            DeleteObject(hPen);
        }
        // copy Alt-I info from ascii screen if needed
        int x_pos; 
        if (x_pos=params.tek4010.refresh.draw_AltI_info_col) {
            int x,y,w,h;
	        x = (font_x_dots) * x_pos;
	        y = 0;
	        w = screen_x_dots-x;
            h = font_y_dots;
            // copy the ascii screen on top
            BitBlt(hdc, x, y, w, h, hdcDIB, x, y, SRCCOPY); 
        }
    } else if ((params.GrOverlay.enabled) && (hdcDIBgr)) {
        // copy graphic overlay and text to hdcDIBgr2
        // then Blit hdcDIBgr2 to hdc to avoid flikering
        BitBlt(hdcDIBgr2, x, y, width, height, hdcDIB, x, y, SRCCOPY); 
        BitBlt(hdcDIBgr2, x, y, width, height, hdcDIBgr, x, y, SRCPAINT); 
        BitBlt(hdc, x, y, width, height, hdcDIBgr2, x, y, SRCCOPY); 
    } else {
        // copy ascii image to GDI Window
        BitBlt(hdc, x, y, width, height, hdcDIB, x, y, SRCCOPY); 
    }
}


int CONSOLE::SetMode(char cMode, int vMode)
{
    extern int columns, lines;
	if (cMode == 'I') {
        if (vMode==-1) return params.current_x_pos; //YYY
        if (vMode==-2) return params.current_y_pos; //YYY
		// 1=Show on screen CPS/IPS
		display_cps_ips = (vMode == 0 ? FALSE : TRUE);
	} else if (cMode == 'E') {
		// Eco de lo que se teclea: 0=no, 1=si
		console_echo = (vMode == 0 ? FALSE : TRUE);
	} else if (cMode == 'C') {
        // set terminal max cps 
        terminal_max_cps=vMode; 
	} else if (cMode == 'Y') {
        int new_term  = (vMode & 255);
        if ((terminal_type == CRT_TEK4010) && (new_term != CRT_TEK4010)) {
            // changing terminal from Tek to any other -> set screen 80x24
             columns = 80; lines = 24;
        }        
		terminal_type = new_term; 
        extern int use_RG512_card; 
        use_RG512_card = (vMode & (1<<8)) ? 1:0;
        // setting the terminal type clears the subtype
        // terminal_max_cps
        terminal_subtype = 0; 
        if (use_RG512_card) {
            params.GrOverlay.enabled=1; 
            params.RG512.enabled=1; 
            params.RG512.TekMode=0; 
        } else {
            params.GrOverlay.enabled=0; 
            params.RG512.enabled=0; 
        }
        params.GrOverlay.antialiased=0; 
		mem_mapped_terminal_type = 0;
        mem_mapped_terminal_subtype = 0;
        if (terminal_type == CRT_KAYPRO) {
            mem_mapped_terminal_type = CRT_KAYPRO; // Kaypro II video mem
            columns=80; lines=24; 
            if (log) log->OutLog("\n[Terminal set to KAYPRO]\n");
        } else if (terminal_type == CRT_OSBORNE) {   
            mem_mapped_terminal_type = CRT_OSBORNE; // Osborne 1 video mem
            columns=80; lines=24; 
            if (log) log->OutLog("\n[Terminal set to OSBORNE]\n");
        } else if (terminal_type == CRT_VIO) {
            mem_mapped_terminal_type = CRT_VIO; // IMSAI VIO video mem
            if (((columns != 80) && (columns != 40)) || (lines != 24)) { columns = 80; lines = 24; }
            if (log) log->OutLog("\n[Terminal set to IMSAI VIO]\n");
        } else if (terminal_type == CRT_DAZZLER) {
            mem_mapped_terminal_type = CRT_DAZZLER; // Dazzler video mem
            if (((columns != 80) && (columns != 40)) || (lines != 24)) { columns = 80; lines = 24; }
            if (log) log->OutLog("\n[Terminal set to Cromenco DAZZLER]\n");
        } else if (terminal_type == CRT_TERM125) {
            mem_mapped_terminal_type = CRT_TERM125; // WaveMate Terminal-125 video mem
            if ((columns != 64) || (lines != 32)) { columns = 64; lines = 32; }
            if (log) log->OutLog("\n[Terminal set to WaveMate Terminal-125]\n");
        } else if (terminal_type == CRT_TEK4010) {
            mem_mapped_terminal_type = 0; 
            if ((columns != 74) || (lines != 35)) { columns = 74; lines = 35; }
            params.GrOverlay.enabled=1;                      
            params.GrOverlay.antialiased=1; 
            if (log) log->OutLog("\n[Terminal set to Tektronix 4014]\n");
        } else if (terminal_type == CRT_OTHER) {
            if (log) {
                log->OutLog("\n[Terminal set to OTHER: ");
                log->OutLog(CustomTerminalName); 
                log->OutLog("]\n");
            }
        } else {
            mem_mapped_terminal_type = 0; 
            if (log) log->OutLog("\n[Terminal set to ANSI/VT100/VT52]\n");
        }
        if (params.RG512.enabled) {
            if (log) log->OutLog("[RG512 RetroGraphics card enabled]\n");
        }
	} else if (cMode == 'T') {
		// Tipo de cursor: 0=ninguno, 1=underline, 2=block
		cursor_type = vMode;
	} else if (cMode == 'L') {
		// Log: 1= activado, 0=desactivado, 2=reopen
		if (vMode==1) {
			if (log) {
				// log already active
			} else {
				log = new LOG("console.log");
			}
		} else if (vMode==0) {
			if (log) delete log;
			log = NULL;
		} else if (vMode==2) {
            // reopen log if active
            if (log) {
			    SetMode('L', 0); 
			    SetMode('L', 1); 
            }
        }
	} else if (cMode == 'S') {
		// Screen Log: 1= activado, 0=desactivado
		if (vMode) {
			if (screen_log) {
				// ya hay un log activo
			} else {
				screen_log = new LOG("screen.txt");
			}
		} else {
			if (screen_log) delete screen_log;
			screen_log = NULL;
		}
	} else if (cMode == 'P') {
		// Printer Log: 1= activado, 0=desactivado
		if (vMode) {
			if (printer_log) {
				// ya hay un log activo
			} else {
				printer_log = new LOG("printer.txt");
			}
		} else {
			if (printer_log) delete printer_log;
			printer_log = NULL;
		}
	} else if (cMode == 'U') {
		// Usar solo mayusculas: 0=no, 1=si
		upper_case_only = (vMode == 0 ? FALSE : TRUE);
	} else if (cMode == 'D') {
		// 1=Show on screen disk activity
		display_disk_io = (vMode == 0 ? FALSE : TRUE);
	}
	RequestRefreshScreen(false);
    return 0; 
}


void CONSOLE::SetCtrlSeq(char * aCustomTerm, 
                         char * aTermCtrlSeq, int aTermCtrlSeqAction[], int aTermCtrlSeqActionParam[], 
                         char * aTermCtrlSeqReply)
{
    memset(CustomTerminalName, 0, sizeof(CustomTerminalName));
    memset(TermCtrlSeq, 0, sizeof(TermCtrlSeq));
    memset(TermCtrlSeqAction, 0, sizeof(TermCtrlSeqAction));
    memset(TermCtrlSeqActionParam, 0, sizeof(TermCtrlSeqActionParam));
    memset(TermCtrlSeqReply, 0, sizeof(TermCtrlSeqReply)); 
    if (aCustomTerm) strcpy_s(CustomTerminalName, sizeof(CustomTerminalName), aCustomTerm);
    if (aTermCtrlSeq) memcpy(TermCtrlSeq, aTermCtrlSeq, sizeof(TermCtrlSeq)); 
    if (aTermCtrlSeqAction) memcpy(TermCtrlSeqAction, aTermCtrlSeqAction, sizeof(TermCtrlSeqAction)); 
    if (aTermCtrlSeqActionParam) memcpy(TermCtrlSeqActionParam, aTermCtrlSeqActionParam, sizeof(TermCtrlSeqActionParam)); 
    if (aTermCtrlSeqReply) memcpy(TermCtrlSeqReply, aTermCtrlSeqReply, sizeof(TermCtrlSeqReply)); 
}


void CONSOLE::DrawCharScreen(BYTE char_plane, BYTE color_plane, BYTE attrib_plane, RECT& rect, int x_pos, int y_pos)
// draw text char on text context
{
	COLORREF back_col;
	COLORREF fore_col;

	int use_native_charset = 0; 

	int font_color = color_plane & 0x07; // get current color
	int back_color = (color_plane & 0x70) >> 4;
    if (attrib_plane & 0x80) {
        // if bit 7 of atrib set, then his char is rendered in color even if terminal is B&W
    } else if ((terminal_type==CRT_VIO) || (terminal_type==CRT_TERM125)) {
        // IMSAI VIO and WaveMate Terminal-125 uses a TV set as terminal
        font_color = 9; // TV white as light blue
	    back_color = 8; // TV black dark grey
    } else {
        font_color = 2; // not color -> use green 
	    back_color = 0;
	}
	if(attrib_plane & 0x80) {
		// if bit 7 of atrib set, windows font is used even if charset is redefined
		use_native_charset = 1;
	}
	
	//attributes
	//	bit0: Reverse
	//	bit1: underline
	//	bit2: bright
	//	bit3: blink	
	//	bit4: osborne executive alternate char set
    //  bit7: color character

    int reverse = (attrib_plane & 1); 

	// underline attribute
	BOOL under_line = (attrib_plane & 2) ? TRUE : FALSE;

	// osborne alternate char set attribute f
	BOOL alternate_charset = (attrib_plane & 16) ? TRUE : FALSE;
    char ** font5x5; // points to char definition font 5x5
    int char5x5;     // char to print

	// bright attribute
	BOOL  bright = (attrib_plane & 4) ? TRUE : FALSE;

	RECT rct;
	rct.left = (font_x_dots) * x_pos;
	rct.top = (font_y_dots) * y_pos;
	rct.right = rct.left + (font_x_dots);
	rct.bottom = rct.top + (font_y_dots);
	
	rct.left = (rct.left < 0) ? 0 : rct.left;
	rct.top = (rct.top < 0) ? 0 : rct.top;
	rct.right = (rct.right < screen_x_dots) ? rct.right : screen_x_dots;
	rct.bottom = (rct.bottom < screen_y_dots) ? rct.bottom : screen_y_dots;

	char string[3]; // becuse is to be used by DrawText() win32 API function
	if(char_plane == 0) {
		string[0] = ' ';
	} else if ((terminal_type == CRT_OSBORNE) && (Osborne_use_CharGenerator == 0) && 
		       ((char_plane == 13+128) || 
			    (char_plane == 19+128) || 
				(char_plane == 29+128))) {
        // osborne chars with an equivalent in windows charset
		if (char_plane == 13+128) string[0] = 'O'; // circle
		if (char_plane == 19+128) string[0] = (char)0xa9; // (c) copyright char
		if (char_plane == 29+128) string[0] = (char)0xbd; // 1/2 char
		char_plane = 0;
    } else if (terminal_type == CRT_VIO) {
        int mode = (params.vio_mode >> 2) & 7; 
        if (mode == 0) mode =3; // blank mode is set when mode is reverse blank. reverse blank is not implemented
        // mode n01=display chars $80..$FF, bit7 of each char =0 -> normal video, =1 -> reverse video
        //      n10=display chars $00..$7F, bit7 of each char =0 -> normal video, =1 -> reverse video
        //      n11=display chars $00..$FF, no reverse video
        //      if n=1 -> reverse video. 
        int reverse_vio = (mode >> 2) & 1; 
        mode = mode & 3;
        if (mode == 0) { // blank
           char_plane=32; // draw a space allways to blank screen
        } else if (mode == 1) { // 
           if (char_plane & 128) reverse=1-reverse; 
           char_plane=char_plane & 127 + 128; 
        } else if (mode == 2) { // 
           if (char_plane & 128) {
               reverse_vio=1-reverse_vio; 
           }
           char_plane=char_plane & 127; 
        } // else keep char 0..255, no reverse bit            
        string[0]=char_plane;     
        if (reverse_vio) reverse=1-reverse; 
	} else {
		string[0] = char_plane;
	}
	string[1] = '\0';

	if (reverse) {
		// Reverse: swap colors
		int c = font_color;
		font_color = back_color;
		back_color = c;
	}
    if (params.inverted_screen) {
		// inverted: swap colors again
		int c = font_color;
		font_color = back_color;
		back_color = c;
	}

    // bright in fact is rendered as half tone
    if (back_color==9 ) { // TV white as light blue
	    back_col = RGB(235, 235, 240); // light-blue TV white
    } else if (back_color == 8) { // TV black dark grey
        back_col = RGB(30, 30, 30); // dark gray TV blak
    } else if (back_color==0) {
		back_col = 0;
	} else if (bright) {
		back_col = RGB((back_color & 4) ? 160 : 0, (back_color & 2) ? 160 : 0, (back_color & 1) ? 160 : 0);
	} else {
		back_col = RGB((back_color & 4) ? 255 : 0, (back_color & 2) ? 255 : 0, (back_color & 1) ? 255 : 0);
	}
    if (font_color==9 ) { // TV white as light blue
	    fore_col = RGB(235, 245, 245); // light-blue TV white
    } else if (font_color == 8) { // TV black dark grey
        fore_col = RGB(40, 40, 40); // dark gray TV blak
    } else if (font_color==0) {
		fore_col = 0;
	} else if (bright) {
		fore_col = RGB((font_color & 4) ? 160 : 0, (font_color & 2) ? 160 : 0, (font_color & 1) ? 160 : 0);
	} else {
		fore_col = RGB((font_color & 4) ? 255 : 0, (font_color & 2) ? 255 : 0, (font_color & 1) ? 255 : 0);
	}

		SetTextColor(hdcDIB, fore_col); 
		SetBkColor(hdcDIB, back_col);
		
		if (under_line == FALSE) {
			SelectObject(hdcDIB, hFont);
		} else {
			SelectObject(hdcDIB, hFont_underline);
		}

		int sv_use_CharGenerator = Osborne_use_CharGenerator;
		if (use_native_charset) goto use_default_font;
		
start:
		if (sv_use_CharGenerator == 1) {
			// use a 8x10 char generator matrix in 16 bytes char def
			// only 128 chars defs
			// used for osborne executive
			int x[9], y[11];

			x[0] = rct.left; x[8] = rct.right;	
			x[4] = (x[0] + x[8]) >> 1; 
			x[2] = (x[0] + x[4]) >> 1; x[1] = (x[0] + x[2]) >> 1; x[3] = (x[2] + x[4]) >> 1;
			x[6] = (x[4] + x[8]) >> 1; x[5] = (x[4] + x[6]) >> 1; x[7] = (x[6] + x[8]) >> 1;
			y[0] = rct.top; y[10] = rct.bottom;
			for (int i=1; i<10; i++) y[i] = y[0] + (y[10] - y[0]) * i / 10; 

			if (char_plane == 0) char_plane = 32;
			if (char_plane > 127) char_plane = (char_plane - 128);
			int ifont = char_plane  * 16; // 16 bytes per char
			if (alternate_charset) {
				ifont = ifont + 16*128; // use second defined character set generator
			}
			if (Osborne_CharGenerator[ifont+14] == 0) {
				// char not defined. Print it as standart windows font char
				sv_use_CharGenerator = 0;
				goto start;
			}

			int bits;				

			// clear char 
			HBRUSH bru;
			bru = CreateSolidBrush(back_col);
			FillRect(hdcDIB, &rct, bru);
			DeleteObject(bru);
			// draw ON pixels
			bru = CreateSolidBrush(fore_col);
			RECT r;
			for (int j=0; j<10; j++) {
				bits = Osborne_CharGenerator[ifont+j];
				if (under_line && (j=9)) bits = ~bits; // if underline, reverse bits 
				for (int i=0; i<8; i++) {
					if (bits & 0x80) {
						r.left = x[i];   r.top = y[j];
						r.right =x[i+1]; r.bottom = y[j+1];
						FillRect(hdcDIB, &r, bru);
					}
					bits = (bits &0x7F) << 1;
				}
			}
			DeleteObject(bru);
		} else if ((terminal_type == CRT_OSBORNE) && (char_plane > 127)) {
			// osborne graphic characters 
		    if ((char_plane == 0x08+128) ||     // triangle |.
			    (char_plane == 0x0a+128) ||     // triangle .|
			    (char_plane == 0x15+128) ||     // triangle '|
				(char_plane == 0x19+128)) {     // triangle |'
                // osborne triangle corner chars
                // clear backgound
			    HBRUSH bru;
			    bru = CreateSolidBrush(back_col);
			    FillRect(hdcDIB, &rct, bru);
			    DeleteObject(bru);
			    // draw triangle
                HPEN hPen = CreatePen(PS_SOLID, 1, fore_col);
			    bru = CreateSolidBrush(fore_col);
                HBRUSH svbru = (HBRUSH) SelectObject(hdcDIB, bru);
                HPEN svPen = (HPEN) SelectObject(hdcDIB, hPen);
                
			    POINT points[3];
                if (char_plane == 0x08+128) {     // triangle |.
                    points[0].x = rct.left; points[0].y = rct.top;
                    points[1].x = rct.left; points[1].y = rct.bottom-1;
                    points[2].x = rct.right-1; points[2].y = rct.bottom-1;
                } else if (char_plane == 0x0a+128) {     // triangle .|
                    points[0].x = rct.right-1; points[0].y = rct.top;
                    points[1].x = rct.left; points[1].y = rct.bottom-1;
                    points[2].x = rct.right-1; points[2].y = rct.bottom-1;
                } else if (char_plane == 0x15+128) {     // triangle '|
                    points[0].x = rct.left; points[0].y = rct.top;
                    points[1].x = rct.right-1; points[1].y = rct.top;
                    points[2].x = rct.right-1; points[2].y = rct.bottom-1;
                } else if (char_plane == 0x19+128) {     // triangle |' 
                    points[0].x = rct.left; points[0].y = rct.top;
                    points[1].x = rct.right-1; points[1].y = rct.top;
                    points[2].x = rct.left; points[2].y = rct.bottom-1;
                } else {
                    memset(points, 0, sizeof(points));
                }
                Polygon(hdcDIB, points, 3);
                SelectObject(hdcDIB, svbru);
                SelectObject(hdcDIB, svPen);
			    DeleteObject(bru);
			    DeleteObject(hPen);
            } else {
                int x[5], y[5];

    			x[0] = rct.left; x[4] = rct.right;	
	    		x[2] = (x[0] + x[4]) >> 1; x[1] = (x[0] + x[2]) >> 1; x[3] = (x[2] + x[4]) >> 1;
		    	y[0] = rct.top; y[4] = rct.bottom;
			    y[2] = (y[0] + y[4]) >> 1; y[1] = (y[0] + y[2]) >> 1; y[3] = (y[2] + y[4]) >> 1;

    			char_plane = (char_plane - 128) & 31; //graphics chars are stored as 128..
	    		int ifont = (char_plane >> 3) * 4;
		    	int iStart = (char_plane & 7) * 5;

    			int bits;				
	    		bits = 0; // get bitmap for built-in graphics chars (4x4 pixels)
		    	for (int j=0; j<4; j++) {
			    	for (int i=0; i<4; i++) {
				    	bits = bits << 1;
					    if (font_osborne[ifont+j][iStart + i] == 'x') bits += 1;
    				}
	    		}

    			// clear char 
	    		HBRUSH bru;
		    	bru = CreateSolidBrush(back_col);
			    FillRect(hdcDIB, &rct, bru);
    			DeleteObject(bru);
	    		// draw ON pixels
		    	bru = CreateSolidBrush(fore_col);
			    RECT r;
    			for (int j=0; j<4; j++) {
	    			for (int i=0; i<4; i++) {
		    			if (bits & 0x8000) {
			    			r.left = x[i];   r.top = y[j];
				    		r.right =x[i+1]; r.bottom = y[j+1];
					    	FillRect(hdcDIB, &r, bru);
    					}
	    				bits = (bits &0x7FFF) << 1;
		    		}
			    }
    			DeleteObject(bru);
            }
        } else if ((terminal_type == CRT_VT100) && (terminal_subtype == VT100_H19)) {
            if ((char_plane >= 119+128) && (char_plane <= 121+128)) {
                // H-19 diagonals
                // clear backgound
			    HBRUSH bru;
			    bru = CreateSolidBrush(back_col);
			    FillRect(hdcDIB, &rct, bru);
			    DeleteObject(bru);
			    // draw diagonals
                HPEN hPen = CreatePen(PS_SOLID, 2, fore_col);
                HPEN svPen = (HPEN) SelectObject(hdcDIB, hPen);
                
                if (char_plane == 119+128) {     // cross X
                    MoveToEx(hdcDIB, rct.left+1, rct.top+1, NULL);
                    LineTo(hdcDIB, rct.right-1, rct.bottom-1);
                    MoveToEx(hdcDIB, rct.right-1, rct.top+1, NULL);
                    LineTo(hdcDIB, rct.left+1, rct.bottom-1);
                } else if (char_plane == 120+128) {     // diagonal /
                    MoveToEx(hdcDIB, rct.right-1, rct.top+1, NULL);
                    LineTo(hdcDIB, rct.left+1, rct.bottom-1);
                } else if (char_plane == 121+128) {     // diagonal inverted
                    MoveToEx(hdcDIB, rct.left+1, rct.top+1, NULL);
                    LineTo(hdcDIB, rct.right-1, rct.bottom-1);
                }
                SelectObject(hdcDIB, svPen);
	    	    DeleteObject(hPen);
            } else if ((char_plane == 114+128) || (char_plane == 95+128)) {
                // H-19 triangle corner chars
                // clear backgound
			    HBRUSH bru;
			    bru = CreateSolidBrush(back_col);
			    FillRect(hdcDIB, &rct, bru);
			    DeleteObject(bru);
			    // draw triangle
                HPEN hPen = CreatePen(PS_SOLID, 1, fore_col);
			    bru = CreateSolidBrush(fore_col);
                HBRUSH svbru = (HBRUSH) SelectObject(hdcDIB, bru);
                HPEN svPen = (HPEN) SelectObject(hdcDIB, hPen);
                
    			POINT points[3];
                if (char_plane == 95+128) {     // triangle '|
                    points[0].x = rct.left; points[0].y = rct.top;
                    points[1].x = rct.right-1; points[1].y = rct.top;
                    points[2].x = rct.right-1; points[2].y = rct.bottom-1;
                } else if (char_plane == 114+128) {     // triangle |'
                    points[0].x = rct.left; points[0].y = rct.top;
                    points[1].x = rct.right-1; points[1].y = rct.top;
                    points[2].x = rct.left; points[2].y = rct.bottom-1;
                } else {
                    memset(points, 0, sizeof(points));
                }
                Polygon(hdcDIB, points, 3);
                SelectObject(hdcDIB, svbru);
                SelectObject(hdcDIB, svPen);
                DeleteObject(bru);
		        DeleteObject(hPen);
            } else if (char_plane == 94+128) {
                // small ball -> is ascii char 7
                string[0]=7;
                goto use_default_font; 
            } else if ((char_plane >= 94+128) && (char_plane < 256)) {
                // H-19 semigraphic chars
                font5x5=(char **)font_H19; // select font for H19
                char5x5=char_plane-94-128; // char num in font to print
                goto draw5x5font;
            } else {
                goto use_default_font; // is a regular ascii char
            }
   		} else if ((terminal_type == CRT_KAYPRO) && (char_plane > 127)) {
	    	// draw block graphics 2x4
            // bits position:  01
            //                 23
            //                 45
            //                 67
		    int x1, x2, x3;
			int y[5];

    		x1 = rct.left;	x3 = rct.right;	
	    	x2 = (x3 + x1) >> 1;
		    y[0] = rct.top; y[4] = rct.bottom;
			y[2] = (y[0] + y[4]) >> 1; y[1] = (y[0] + y[2]) >> 1; y[3] = (y[2] + y[4]) >> 1;
			
            RECT r;
	    	char_plane &= 127;
		    int bits = ~char_plane;
                    
    		// clear char
	    	HBRUSH bru;
		    bru = CreateSolidBrush(fore_col); // (note: fore and back are reversed)
			FillRect(hdcDIB, &rct, bru);
    		DeleteObject(bru);
	    	// draw ON pixels
		    bru = CreateSolidBrush(back_col);
			
    		// draw ON pixels
	    	for (int i=0; i<4; i++) {
		    	if (bits & 2) {
			   		r.left = x1; r.top = y[i];
			    	r.right = x2; r.bottom = y[i+1];
				    FillRect(hdcDIB, &r, bru);
    			}
	    		if (bits & 1) {
		    		r.left = x2; r.top = y[i];
			   		r.right = x3; r.bottom = y[i+1];
			    	FillRect(hdcDIB, &r, bru);
    			}   
	    		bits = bits >> 2;
		    }
			DeleteObject(bru);
    	} else if (terminal_type == CRT_VIO) {
            // standart ascii chars 32..126
            // graphics 3x2: 128..191 (64 chars = 6 pixels per char)
            // semigraphics chars 0..31, 127, 192..255
            int c = (char_plane & 255);
            if (c==0) c=32; 
            if ((c >=  32) && (c < 127)) goto use_default_font; // is an ascii char
            if ((c >= 128) && (c < 192)) { 
                // draw block graphics 2x3
                // bits position:  52
                //                 41
                //                 30
    			int x[3];
	    		int y[4], d;

		    	x[0] = rct.left; x[2] = rct.right;	
			    x[1] = (x[2] + x[0]) >> 1;
			    y[0] = rct.top; y[3] = rct.bottom; d = (rct.bottom - rct.top);
			    y[1] = y[0] + d/3; y[2] = y[3] - d/3;
			
			    RECT r;
			    int bits = c;

			    // clear char
			    HBRUSH bru;
			    bru = CreateSolidBrush(back_col); 
			    FillRect(hdcDIB, &rct, bru);
			    DeleteObject(bru);
			    // draw ON pixels
			    bru = CreateSolidBrush(fore_col);
			
			    // draw ON pixels
                for (int j=1; j>=0; j--) {
			        for (int i=2; i>=0; i--) {
				        if (bits & 1) {
    					    r.left = x[j]; r.top = y[i];
        					r.right = x[j+1]; r.bottom = y[i+1];
	        				FillRect(hdcDIB, &r, bru);
		        		}
   		    		    bits = bits >> 1;
                    }
			    }
    			DeleteObject(bru);
            } else { // semigrahics chars 0..31, 127, 192..255

    			if (c >= 192) { c -= (192-33); } else
	    		if (c == 127) { c = 32; } else 
                if (c <=  31) { /* keep char */} else {c=32; char_plane=0;}

                font5x5=(char **)font_vio; // select font for vio
                char5x5=c;                 // char num in font to print

             draw5x5font:                
                
                int x[6], y[6], dx, dy;

	    		x[0] = rct.left; x[5] = rct.right; dx = (rct.right-rct.left);
		    	y[0] = rct.top; y[5] = rct.bottom; dy = (rct.bottom - rct.top);
			    x[1] = x[0] + dx/5; x[2] = x[0] + (2*dx)/5; 
    			x[4] = x[5] - dx/5; x[3] = x[5] - (2*dx)/5; 
	    		y[1] = y[0] + dy/5; y[2] = y[0] + (2*dy)/5; 
		    	y[4] = y[5] - dy/5; y[3] = y[5] - (2*dy)/5; 

                int ifont = (char5x5 >> 3) * 5;
		    	int iStart = (char5x5 & 7) * 6;

    			int bits;				
	    		bits = 0; // get bitmap for built-in graphics chars (4x4 pixels)
		    	for (int j=0; j<5; j++) {
			    	for (int i=0; i<5; i++) {
				    	bits = bits << 1;
					    if (font5x5[ifont+j][iStart + i] == 'x') bits += 1;
    				}
	    		}

    			// clear char 
		        HBRUSH bru;
	    		bru = CreateSolidBrush(back_col);
    			FillRect(hdcDIB, &rct, bru);
			    DeleteObject(bru);
		    	// draw ON pixels
	    		bru = CreateSolidBrush(fore_col);
    			RECT r;
			    for (int j=0; j<5; j++) {
		    		for (int i=0; i<5; i++) {
	    				if (bits & 0x1000000) {
    						r.left = x[i];   r.top = y[j];
						    r.right =x[i+1]; r.bottom = y[j+1];
					    	FillRect(hdcDIB, &r, bru);
				    	}
			    		bits = (bits &0x0FFFFFF) << 1;
		    		}
	    		}
    			DeleteObject(bru);
            }
    	} else if (terminal_type == CRT_TERM125) {
            // standart ascii chars 32..127
            // graphics 3x2: 128..255 (64 chars = 6 pixels per char)
            int c = (char_plane & 255);
            if (c==0) c=32; 
            if ((c >=  32) && (c <= 127)) goto use_default_font; // is an ascii char
            // draw block graphics 2x3
            // bits position:  01 (same as TRS-80 Model 1)
            //                 23
            //                 45
  			int x[3];
    		int y[4], d;

	    	x[0] = rct.left; x[2] = rct.right;	
		    x[1] = (x[2] + x[0]) >> 1;
		    y[0] = rct.top; y[3] = rct.bottom; d = (rct.bottom - rct.top);
		    y[1] = y[0] + d/3; y[2] = y[3] - d/3;
			
		    RECT r;
		    int bits = c;

		    // clear char
		    HBRUSH bru;
		    bru = CreateSolidBrush(back_col); 
		    FillRect(hdcDIB, &rct, bru);
		    DeleteObject(bru);
		    // draw ON pixels
		    bru = CreateSolidBrush(fore_col);
			
		    // draw ON pixels
            for (int i=0; i<3; i++) {
    	        for (int j=0; j<2; j++) {
			        if (bits & 1) {
    				    r.left = x[j]; r.top = y[i];
       					r.right = x[j+1]; r.bottom = y[i+1];
	       				FillRect(hdcDIB, &r, bru);
	        		}
   	    		    bits = bits >> 1;
                }
            }
    		DeleteObject(bru);
		} else {
use_default_font:
			HBRUSH bru = CreateSolidBrush(back_col);
			FillRect(hdcDIB, &rct, bru);
			DeleteObject(bru);
			// now draw text
            if (string[0]==0) string[0]=32; 
            if (string[0]!=32) {
			    DrawText(hdcDIB, string, 1, &rct, DT_CENTER | DT_SINGLELINE | DT_NOPREFIX);
            }
		}
	
    // return the updated rectangle on GDI window
	rect.left = (rct.left < rect.left) ? rct.left : rect.left;
	rect.top = (rct.top < rect.top) ? rct.top : rect.top;
	rect.right = (rct.right > rect.right) ? rct.right : rect.right;
	rect.bottom = (rct.bottom > rect.bottom) ? rct.bottom : rect.bottom;

}

BYTE CONSOLE::MappedVideoMem(int x_pos, int y_pos, 
							 int mode, BYTE data)
{
	if (mode == 1) {
		//SET char
		params.char_plane[y_pos][x_pos] = data;
	} else if (mode == 2) {
		//SET attrib
		params.attrib_plane[y_pos][x_pos] = data;
	} else if (mode == 3) {
		//GET char
		data = params.char_plane[y_pos][x_pos];
	} else if (mode == 4) {
		//GET attrib
		data = params.attrib_plane[y_pos][x_pos];
	} else if (mode == 5) {
        // set vio mode
        params.vio_mode = data;
        // mode has changed -> the whole screen may be diferent -> set for a full redraw
        params.request_full_redraw=1;
	} else if (mode == 6) {
        // get vio mode
        data = params.vio_mode;
	} else if (mode == 7) {
        // set cursor pos (used by VIO)
        if (x_pos>0) params.current_x_pos=x_pos; 
        if (y_pos>0) params.current_y_pos=y_pos; 
	} else if (mode == 8) {
        // get cursor pos (used by VIO)
        if (x_pos>0) data = params.current_x_pos; 
        if (y_pos>0) data = params.current_y_pos=y_pos; 
	}
	return data;
}

void CONSOLE::RequestRefreshScreen(int Request_fullredraw)
{
	EnterCriticalSection(&KbdCriticalSection);
    RefreshScreen_event_pending = 1; 
    if (Request_fullredraw) {
        params.request_full_redraw=1;
    }
	LeaveCriticalSection(&KbdCriticalSection);

}


void CONSOLE::RefreshScreen(void)
{
	//      RefreshScreen (called from main windows thread) reads the VDC memory 
	//      and paints the GDI window
    //      if request_full_redraw=1 -> draw the entire GDI window, =0 -> only changes from previous draw
	//      return 0 if nothing changed screen, 1 if GDI screen has been updated

    int InvalidateRectCount = 0; // number of Invalidate rects issued
    BOOL force_flag=0; 

    if (RefreshScreen_event_pending==0) return; // nothing has changed in screen

	EnterCriticalSection(&KbdCriticalSection);
    RefreshScreen_event_pending = 0; 
    if (params.request_full_redraw) {
        force_flag=1; 
        params.request_full_redraw=0; // request satisfied
    }
    DrawImage_GrOverlay(0, NULL); // copy graphics overlay vector list to local var
    // if vectors pending to be draw on next frame (because they are decaying), set the 
    // RefreshScreen_event_pending flag
    if (params.GrOverlay.nVectors) RefreshScreen_event_pending = 1; 
	LeaveCriticalSection(&KbdCriticalSection);
    if ((params.GrOverlay.enabled) && (hdcDIBgr)) {
        RECT GrOv_rect; 
        DrawImage_GrOverlay(1, &GrOv_rect); // clear gr overlay & draw vecrtors
        DrawImage_GrOverlay(2, &GrOv_rect); // calc params.tek4010.refresh.xxx to draw the TEK4010 alpha cursor and crsshair on WM_PAINT event
        if (GrOv_rect.right >0) {
            InvalidateRectCount++;
            InvalidateRect(hMain, &GrOv_rect, FALSE); // add invalidate rect if any
        }
    }

    // If terminal is Kaypro, refresh also the status line (line 25)
	int screen_y_size2;
	screen_y_size2 = screen_y_size;
	if (has_status_line) screen_y_size2++;

	int page2 = 1 - params.VDCpage;
	int draw_flag = 0;

	BYTE char_plane[CONS_Y_MAX][CONS_X_MAX];
	BYTE attrib_plane[CONS_Y_MAX][CONS_X_MAX];
	BYTE color_plane[CONS_Y_MAX][CONS_X_MAX];

	// 1- Copy the full video data to VDC
	RefreshScreen_VDC();
	if (force_flag) {
		//force the full redraw of screen:
		//     2- Copy the VDC to the second page and to the chars to redraw
		memcpy(&params.VDC[page2], &params.VDC[params.VDCpage], sizeof(params.VDC[page2]));
		//     3- Copy the VDC to the chars to redraw
		memcpy(char_plane, params.VDC[params.VDCpage].char_plane, sizeof(char_plane));
		memcpy(color_plane, params.VDC[params.VDCpage].color_plane, sizeof(color_plane));
		memcpy(attrib_plane, params.VDC[params.VDCpage].attrib_plane, sizeof(attrib_plane));
		//     4- set the redraw flag
		draw_flag = 1;
        //     5- If dazzler visible, mark full image to redraw
        if ((terminal_type == CRT_DAZZLER) && (params.dazzler.on)) {
            // mark all the image as changed so it will be fully redraw
            params.dazzler.last.mode=-1; // setting last mode = -1 forces a redraw of full dazzler screen
        }
        history_buffer_visible=0; // full redraw -> view actual terminal screen instead of viewing the history buffer
	} else {
		//do not force the redraw: draw only changes: check wich chars has changed from previous redraw
		for(int j = 0; j < screen_y_size2; j++) {
			for(int i = 0; i < screen_x_size; i++) {
				if ((params.VDC[params.VDCpage].attrib_plane[j][i] == params.VDC[page2].attrib_plane[j][i]) &&
					(params.VDC[params.VDCpage].color_plane[j][i] == params.VDC[page2].color_plane[j][i]) &&	 
					(params.VDC[params.VDCpage].char_plane[j][i] == params.VDC[page2].char_plane[j][i])) {
					// No changes made in this char
				} else {
					// This char has changed, must redraw it
					if (draw_flag == 0) {
						// initialize local planes with changes to draw. 255=no redraw
						memset(attrib_plane, 255, sizeof(params.attrib_plane));
						draw_flag = 1;
					}
					// copy data of char to redraw, and copy it to page2
					attrib_plane[j][i] = params.VDC[page2].attrib_plane[j][i] =
						params.VDC[params.VDCpage].attrib_plane[j][i];
					color_plane[j][i] = params.VDC[page2].color_plane[j][i] =
						params.VDC[params.VDCpage].color_plane[j][i];
					char_plane[j][i] = params.VDC[page2].char_plane[j][i] =
						params.VDC[params.VDCpage].char_plane[j][i];
				}
			}
		}
	}

	// if changes, swap VDC pages
	if (draw_flag == 1) params.VDCpage = page2;

	// calc the Frames Per Second value each 500 msec
	if (display_cps_ips) {
		DWORD ms = GetTickCount();
		DWORD ms_elapsed = ms - CPS_last_ms; 
		if (ms_elapsed > 300) {
            int cn=CPS_count;  
            long long in=IPS_count; 
			CPS = ((cn - CPS_last_count) * 1000) / ms_elapsed;
		    IPS = (int) (((in - IPS_last_count) * 1000) / ms_elapsed); if (IPS<0) IPS=-1; 
			CPS_last_ms = ms;
			CPS_last_count = cn;
            IPS_last_count = in;
		}
	}

    // check if dazzler image has changed so it needs dome redraw
    if ((terminal_type == CRT_DAZZLER) && (params.dazzler.on)) {
        // dazzler image size
        int cols_covered_by_dazzler_image = 40;
        int lines_covered_by_dazzler_image = 20;
        // image is at top right of screen
        int c0=screen_x_size - cols_covered_by_dazzler_image; 
        if (c0<0) c0=0; // c0 is first hidden colum under dazzler screen
        int l1=lines_covered_by_dazzler_image;
        if (l1 > screen_y_size2) l1=screen_y_size2; // l1 is first line visible below dazzler screen
        if (draw_flag) {
            // dazzler screen covers the text screen, so mark covered chars as "no draw"
            // signal chars under dazzer screen as 'not to update'
    	    for(int j = 0; j < l1; j++) {
	    	    for(int i = c0; i < screen_x_size; i++) {
                    attrib_plane[j][i]=255;
                }
            }
        }
        // check if mode has changed
        int mode = (params.dazzler.framebuffer_addr & 0xFF00) | 
                   (params.dazzler.resolution_x4 ? 1:0) |
                   (params.dazzler.framebuffer_2k ? 2:0) |
                   (params.dazzler.color_mode ? 4:0) |
                   ((params.dazzler.color & 15) << 4);
        if (params.dazzler.last.mode != mode) {
            params.dazzler.last.mode = mode;
            // yes, mode changed. Invalidate last framebuffer draw 
            memset(params.dazzler.last.framebuffer,-1, sizeof(params.dazzler.last.framebuffer));
        }
        // this is the rectangle that contains the area on GDI window that has been updated
        RECT rect;
	    rect.left = rect.top = LONG_MAX;
	    rect.right = rect.bottom = 0;

        // dazzler image has changed -> redraw it
        // c0 is first hidden colum under dazzler screen
        // l1 is first line visible below dazzler screen
        DrawDazzlerImage(c0, l1, 
                             cols_covered_by_dazzler_image, lines_covered_by_dazzler_image, 
                             rect); 
        // mark updated GDI area to be repainted by Windows
        if (rect.bottom) {
           InvalidateRectCount++; 
       	   InvalidateRect(hMain, &rect, FALSE);
        }
    }

	//if some char has changed, draw on screen char by char
    if (draw_flag) {
        RECT rect;
        rect.left = rect.top = LONG_MAX;
        rect.right = rect.bottom = 0;

        int attrib;
	    for(int j = 0; j < screen_y_size2; j++) {
		    for(int i = 0; i < screen_x_size; i++) {
                attrib=attrib_plane[j][i];
    			if (attrib == 255) continue; // char not to redraw
	    		DrawCharScreen(char_plane[j][i], color_plane[j][i], attrib, rect, i, j);
		    }
	    }
        if (rect.bottom) {
            InvalidateRectCount++; 
            InvalidateRect(hMain, &rect, FALSE);
        }
    }
    
	// This routine is called by Main thread, the one tha processed windows events
    if (InvalidateRectCount) {
	    UpdateWindow(hMain);
    }
}

void CONSOLE::ShowScreenHistoryBuffer(int nDelta)
{
    history_buffer_visible += nDelta; 
    if (history_buffer_visible < 0) history_buffer_visible=0;
    if (history_buffer_visible > MAX_SCREEN_HISTORY) history_buffer_visible = MAX_SCREEN_HISTORY;       
    if (history_buffer_wrap==0) if (history_buffer_visible > nhist) history_buffer_visible = nhist;
}

void CONSOLE::RefreshScreen_VDC()
{
	//      copy current display memory to video memory to be displayed
	//      UpdateScreen is only called within RefreshScreen() to update changes made
	//      in video. UpdateScreen made this changes available to be diplayed in
	//      windows by copying them to VDC[] array. RefreshScreen (called from 
	//      main windows thread) reads the VDC memory and paints the windows

    if (history_buffer_visible == 0) {
        // no terminal screen buffer history visible, copy the full screen to video mem
	    memcpy(params.VDC[params.VDCpage].char_plane, params.char_plane, sizeof(params.char_plane));
	    memcpy(params.VDC[params.VDCpage].color_plane, params.color_plane, sizeof(params.color_plane));
	    memcpy(params.VDC[params.VDCpage].attrib_plane, params.attrib_plane, sizeof(params.attrib_plane));
    } else {
        // history_buffer_visible lines of screen buffer history visible, 
        // so copy them to video mem, then the remaining of screen

        // determine first line of history to use (iHist) and lines to copy (nLen)
        int iHist, nLen;
        if (history_buffer_wrap == 0) {
            // screen history buffer not yet full -> copy history_buffer_visible lines from history
            nLen = history_buffer_visible; // number of history lines to show
            iHist = nhist - nLen; 
            if (iHist < 0) { iHist=0; nLen=history_buffer_visible=nhist; }
        } else {
            // screen history buffer full 
            nLen = history_buffer_visible; // number of history lines to show
            if (nLen > MAX_SCREEN_HISTORY) nLen=history_buffer_visible=MAX_SCREEN_HISTORY;
            iHist = nhist - nLen; 
            if (iHist < 0) { iHist+=MAX_SCREEN_HISTORY; }
        }
        // copy history to video mem starting at video lien iLin
        int iLin=0;
        for (int i=0; i<nLen; i++) {
            if (iLin >= CONS_Y_MAX) break; 
            if (iHist >= MAX_SCREEN_HISTORY) iHist -= MAX_SCREEN_HISTORY; 
            memcpy(params.VDC[params.VDCpage].char_plane[iLin], history_char_plane[iHist], CONS_X_MAX);
            memcpy(params.VDC[params.VDCpage].attrib_plane[iLin], history_attrib_plane[iHist], CONS_X_MAX);
            memcpy(params.VDC[params.VDCpage].color_plane[iLin], history_color_plane[iHist], CONS_X_MAX);
            iLin++; iHist++;               
        }
        // copy actual terminal screen to remaining of video mem
        int n=0;
        while(1) {
            if (iLin >= CONS_Y_MAX) break; 
            memcpy(params.VDC[params.VDCpage].char_plane[iLin], params.char_plane[n], CONS_X_MAX);
            memcpy(params.VDC[params.VDCpage].attrib_plane[iLin], params.attrib_plane[n], CONS_X_MAX);
            memcpy(params.VDC[params.VDCpage].color_plane[iLin], params.color_plane[n], CONS_X_MAX);
            iLin++; n++;
        }
    }

	// set the flashing cursor in the video memory
    // if viewing history, "history" label on screen but no cursor 
	if (history_buffer_visible) {
		char s[80];
		sprintf_s(s, 80, " History buffer line %d ", history_buffer_visible);
		int slen = strlen(s);
		int x = (screen_x_size - slen)/2 - 1;
		for(int i = 0; i < slen; i++) {
			if (s[i]==0) break;
			params.VDC[params.VDCpage].char_plane[0][x+i] = s[i];  // show the label as
			params.VDC[params.VDCpage].color_plane[0][x+i] = 0x06; // yellow & black
			params.VDC[params.VDCpage].attrib_plane[0][x+i] = 0x81;   // reverse & force color character
		}
    } else if (blink_status) {
		int bCursorVisible = 0;
		if ((cursor_type == 0) || (params.cursor_visible == 0) || 
			(params.current_x_pos <0) || 
			(params.current_x_pos >= screen_x_size) ||
			(params.current_y_pos <0) || 
			(params.current_y_pos >= screen_y_size)) {
			// No cursor
        } else if (terminal_type == CRT_TEK4010) {
            // Tek4010 has graphical cursor, no text cursor
        } else if (params.terminated) {
            // cpm emulation terminated -> do not show cursor
		} else if (cursor_type == 2) {
			// block cursor -> flip reverse attribute (bit0)
			params.VDC[params.VDCpage].attrib_plane[params.current_y_pos][params.current_x_pos] ^= 1; // xor bit0
			bCursorVisible = 1;
		} else {
			//  underline cursor -> flip underline attribute (bit1)
			if (params.VDC[params.VDCpage].char_plane[params.current_y_pos][params.current_x_pos] == '_') {
				// if character under cursor is underscore change it to space because Underline has no visible effect on underscore 
				params.VDC[params.VDCpage].char_plane[params.current_y_pos][params.current_x_pos] = ' ';
			} else {
				params.VDC[params.VDCpage].attrib_plane[params.current_y_pos][params.current_x_pos] ^= 2; // xor bit1
			}
			bCursorVisible = 1;
		}
	}

	//set the blink
	if (blink_status) {
		for(int j = 0; j < screen_y_size; j++) {
			for(int i = 0; i < screen_x_size; i++) {
				if (params.VDC[params.VDCpage].attrib_plane[j][i] & 8) {
					// blink attribute set
					if ((params.current_x_pos == i) && (params.current_y_pos == j)) {
						// cursor does not blink. It is already flashing
					} else {
						// hide character
						params.VDC[params.VDCpage].char_plane[j][i] = ' ';
					}
				}
			}
		}
	}

    params.tek4010.refresh.draw_AltI_info_col = 0; 
	if (paused) {
		char s[80];
		sprintf_s(s, 80, " Paused ");
		int slen = strlen(s);
		int x;
        if ((terminal_type == CRT_DAZZLER) && (params.dazzler.on)) {
    	    x = 0; // if dazzler screen visible, place text on top left corner of screen
        } else {
		    x = screen_x_size-slen-1; // regular placement: at top right corner of screen
        }
        if (terminal_type==CRT_TEK4010) {
            if (params.tek4010.refresh.draw_AltI_info_col < x) params.tek4010.refresh.draw_AltI_info_col=x; 
        }
		for(int i = 0; i < slen; i++) {
			if (s[i]==0) break;
			params.VDC[params.VDCpage].char_plane[0][x+i] = s[i];  // show the CPS label as
			params.VDC[params.VDCpage].color_plane[0][x+i] = 0x06; // yellow & black
			params.VDC[params.VDCpage].attrib_plane[0][x+i] = 0x81;   // reverse & force color character
		}
    }
	// set the CPS/IPS counter
	if (display_cps_ips && (paused == 0) && (IPS >= 0)) {
		char s[80];
		char sIPS[80];
		char sMaxIPS[80];
		if (CPS > 99999) CPS = 99999;
		if (CPS < 0) CPS = 0;
		if (IPS < 0) IPS = 0;
		if (IPS > 1000000) {
			sprintf_s(sIPS, "%.1fM", ((double) IPS) / 1000000.0);
		} else if (IPS > 500000) {
			sprintf_s(sIPS, "%dK", IPS / 1000);
		} else if (IPS > 1000) {
			sprintf_s(sIPS, "%.1fK", ((double) IPS) / 1000.0);
		} else {
			sprintf_s(sIPS, "%d", IPS);
		}
		if (MaxIPS < 1) {
			sprintf_s(sMaxIPS, "Max IPS");
		} else if (MaxIPS >= 1000000) {
			sprintf_s(sMaxIPS, "Max IPS: %.1fM", ((double) MaxIPS) / 1000000.0);
		} else if (MaxIPS >= 500000) {
			sprintf_s(sMaxIPS, "Max IPS: %dK", MaxIPS / 1000);
		} else if (MaxIPS >= 1000) {
			sprintf_s(sMaxIPS, "Max IPS: %.1fK", ((double) MaxIPS) / 1000.0);
		} else {
			sprintf_s(sMaxIPS, "Max IPS: %d", MaxIPS);
		}
		sprintf_s(s, " CPS: %d - IPS: %s (%s)", CPS, sIPS, sMaxIPS);
        extern int GSX_mouse_read; 
        if ((GSX_mouse_read) || 
            (((terminal_type == CRT_TEK4010) || (params.RG512.enabled)) && (Tek4010(2,0)))) {
            // if GIN mode active, show also the current cross hair coordiates
            char s2[80];
            sprintf_s(s2, " GIN X=%d Y=%d |%s", params.tek4010.GIN_x, params.tek4010.GIN_y, s);
            strcpy_s(s,s2); 
        }

		int slen = strlen(s);
		int x;
        if ((terminal_type == CRT_DAZZLER) && (params.dazzler.on)) {
    	    x = 0; // if dazzler screen visible, place text on top left corner of screen
        } else {
		    x = screen_x_size-slen-1; // regular placement: at top right corner of screen
        }
        if (terminal_type==CRT_TEK4010) {
            if (params.tek4010.refresh.draw_AltI_info_col < x) params.tek4010.refresh.draw_AltI_info_col=x; 
        }
		for(int i = 0; i < slen; i++) {
			if (s[i]==0) break;
			params.VDC[params.VDCpage].char_plane[0][x+i] = s[i];  // show the CPS label as
			params.VDC[params.VDCpage].color_plane[0][x+i] = 0x06; // yellow & black
			params.VDC[params.VDCpage].attrib_plane[0][x+i] = 0x81;   // reverse & force color character
		}
	}
	if (display_disk_io && (paused == 0) && (disk_io_activity)) {
        int x=screen_x_size-1; 
		disk_io_activity = 0;
		params.VDC[params.VDCpage].char_plane[0][x]   = ' ';  
		params.VDC[params.VDCpage].color_plane[0][x]  = 0x04; // red & black
		params.VDC[params.VDCpage].attrib_plane[0][x] = 0x81;   // reverse & force color character
        if (terminal_type==CRT_TEK4010) {
            if (params.tek4010.refresh.draw_AltI_info_col < x) params.tek4010.refresh.draw_AltI_info_col=x; 
        }
	}
    if (terminal_type == CRT_DAZZLER) {
        // print joy state on top of screenº
        int lin=0; 
        int ShowJoy;
        if (params.dazzler.JoyMode<0) {
            // joy disabled
            ShowJoy=0;
        } else if (params.dazzler.JoyMode>0) {
            // joy enabled
            ShowJoy=1;
        } else if (params.dazzler.joy[0].JoySensed) { // Joy1 is being readed by program
            ShowJoy=1;
        }
        if (ShowJoy) {
            int nJoy, b, slen; 
            char s[80];
            for (nJoy=0; nJoy<2; nJoy++) {
                b = params.dazzler.joy[nJoy].buttons; 
                sprintf_s(s, " Joy%c: X=%4d Y=%4d Btn=%c%c%c%c ", 
                    '1' + nJoy,
                    params.dazzler.joy[nJoy].x_pos, params.dazzler.joy[nJoy].y_pos, 
                    (b & 8) ? 'P':'.', (b & 4) ? 'P':'.', (b & 2) ? 'P':'.', (b & 1) ? 'P':'.');
    		    slen = strlen(s);
	    	    for(int x = 0; x < slen; x++) {
		    	    if (s[x]==0) break;
			        params.VDC[params.VDCpage].char_plane[lin][x] = s[x];  // show the CPS label as
			        params.VDC[params.VDCpage].color_plane[lin][x] = 0x06; // yellow & black
    			    params.VDC[params.VDCpage].attrib_plane[lin][x] = 0x81;   // reverse & force color character
                }
                lin++;
		    }
        }
    }

}

void CONSOLE::GetScreenChars(BYTE *scr, int scrlen)
{
	// return un scr the char into the screen

	int iPos = 0;
	BYTE c;
	int bEOL;

	// load scr with copy of the actual screen 
    // may be filled with history buffer

	for(int j = 0; j < screen_y_size; j++) {
		for(int i = 0; i < screen_x_size; i++) {
			c = params.VDC[params.VDCpage].char_plane[j][i];
			if (c < 33) {
				c = 32;
				// if it's a space, check if it's end of line
				bEOL = 1;
				for(int k = i; k < screen_x_size; k++) {
					if (params.VDC[params.VDCpage].char_plane[j][k] > 32) {
						bEOL = 0;
						break;
					}
				}
				if (bEOL == 1) break;
			}
			if (iPos >= scrlen-10) break;
			scr[iPos++] = c;
		}
		if (iPos >= scrlen-10) break;
		scr[iPos++] = 13;
		scr[iPos++] = 10;
	}
	for (;;) {
		// remove trailing blank lines
		if (iPos < 2) break;
		if ((scr[iPos-2] != 13) || (scr[iPos-1] != 10)) break;
		iPos = iPos -2;
	}
	// add last CR and a string terminator
	scr[iPos++] = 13;
	scr[iPos++] = 10;
	scr[iPos] = 0;

}

void CONSOLE::ClearScreen(BOOL update_flag)
// clears all non-locked lines of screen
// cursor at col 0 of first non locked line (normally line 0)
{
    if (update_flag) {
        memset(params.locked_lines, 0, sizeof(params.locked_lines));
    }

    int nlin0=-1; // first line cleared (may not be line 0 if some lines on top are locked
    // do not clear locked lines
    for (int j=0; j<CONS_Y_MAX; j++) {
        if (params.locked_lines[j]) continue; 
        if (nlin0 < 0) nlin0=j; 
        memset(&params.char_plane[j], 0, sizeof(params.char_plane[0]));
        memset(&params.color_plane[j], 0, sizeof(params.color_plane[0]));
        memset(&params.attrib_plane[j], 0, sizeof(params.attrib_plane[0]));
    }	
	params.current_x_pos = 0; 
    if (nlin0 >= 0) params.current_y_pos = nlin0;
    nhist = history_buffer_wrap = history_buffer_visible = 0; // clear screen -> clear terminal history buffer

	RequestRefreshScreen(false);
}

void CONSOLE::Blink()
{
	blink_status = (blink_status ? FALSE : TRUE);
	RequestRefreshScreen(false);
}


void CONSOLE::ScrollScreen(int nLines)
// scroll nLines between first non-lockd line to last non-locked line
{
    if (nLines == 0) return; // no scroll
    // determine if lines on top of screen are locked

    int nLin0=0; 
    for (int j=0; j<screen_y_size; j++) {
        if (params.locked_lines[j]==0) break;
        nLin0++; // top of screen line locked
    }
    // determine if lines on bottom of screen are locked
    int nLin1=0; 
    for (int j=screen_y_size-1; j>=0; j--) {
        if (params.locked_lines[j]==0) break;
        nLin1++; // top of screen line locked
    }
    if (nLin0+nLin1 >= screen_y_size) {
	    if(log) log->OutLog("\n[All Screen locked, cannot scroll]\n");
        return; 
    }

    if (nLines < 0) { // scroll reverse nLines
        int n=-nLines;
        while(n>0) {
        // scroll down one line in unlocked region
    	    for(int i = screen_y_size-nLin1-1; i > nLin0; i--) {
	    	    memcpy(params.char_plane[i], params.char_plane[i-1], CONS_X_MAX);
		        memcpy(params.attrib_plane[i], params.attrib_plane[i-1], CONS_X_MAX);
    		    memcpy(params.color_plane[i], params.color_plane[i-1], CONS_X_MAX);
    	    }
            // clear first line
	        memset(params.char_plane[nLin0], 0, CONS_X_MAX);
    	    memset(params.attrib_plane[nLin0], 0, CONS_X_MAX);
	        memset(params.color_plane[nLin0], 0, CONS_X_MAX);            
            n--;
        }
    } else {
        int n=nLines;
        while(n>0) { // scroll up nLines
            if (nLin0+nLin1==0) {
                // if no lines locked, copy to screen history buffer
                memcpy(history_char_plane[nhist], params.char_plane[0], CONS_X_MAX);
                memcpy(history_attrib_plane[nhist], params.attrib_plane[0], CONS_X_MAX);
                memcpy(history_color_plane[nhist], params.color_plane[0], CONS_X_MAX);
                nhist++;
                if (nhist >= MAX_SCREEN_HISTORY) {
                    history_buffer_wrap=1; 
                    nhist=0;
                }
            }
            
            // scroll up one line in unlocked region
        	for(int i = 1+nLin0; i < screen_y_size-nLin1; i++) {
	        	memcpy(params.char_plane[i - 1], params.char_plane[i], CONS_X_MAX);
	    	    memcpy(params.attrib_plane[i - 1], params.attrib_plane[i], CONS_X_MAX);
        		memcpy(params.color_plane[i - 1], params.color_plane[i], CONS_X_MAX);
	        }
            // clear last line
    	    memset(params.char_plane[screen_y_size - 1 -nLin1], 0, CONS_X_MAX);
	        memset(params.attrib_plane[screen_y_size - 1 - nLin1], 0, CONS_X_MAX);
	        memset(params.color_plane[screen_y_size - 1 - nLin1], 0, CONS_X_MAX);
            n--;
        }
    }
	
    if(log) {
        char sLog[100];
        if (nLin0+nLin1==0) {
            if (nLines==1) {
	            log->OutLog("\n[Scroll Screen]\n");
            } else {
                sprintf_s(sLog, "\n[Scroll Screen %d line(s)]\n", nLines); 
                log->OutLog(sLog);
            }
        } else {
            sprintf_s(sLog, "\n[Scroll Screen %d line(s), exclude %d lines on top, %d lines %d]\n", nLines, nLin0, nLin1);
        }
    }
    history_buffer_visible=0; // scroll -> view actual terminal screen instead of viewing the history buffer

}

void CONSOLE::DeleteLines(int nLines)
{
	if (nLines <= 0) return;	// deleting 0 lines: do nothing

    history_buffer_visible=0; // delete line -> view actual terminal screen instead of viewing the history buffer
    
    if (params.current_y_pos + nLines >= screen_y_size) {
		// delete more lines than the rest of the screen -> clear down from deleted line
		for(int j = params.current_y_pos; j < screen_y_size; j++) {
			memset(params.char_plane[j], 0, CONS_X_MAX);
			memset(params.attrib_plane[j], 0, CONS_X_MAX);
			memset(params.color_plane[j], 0, CONS_X_MAX);
		}
	} else {
		// delete lines and move up bottom of the screen
		for(int j = params.current_y_pos + nLines; j < screen_y_size; j++) {
			memcpy(params.char_plane[j - nLines], params.char_plane[j], CONS_X_MAX);
			memcpy(params.attrib_plane[j - nLines], params.attrib_plane[j], CONS_X_MAX);
			memcpy(params.color_plane[j - nLines], params.color_plane[j], CONS_X_MAX);
		}
		for(int j = screen_y_size - nLines; j < screen_y_size; j++) {
			memset(params.char_plane[j], 0, CONS_X_MAX);
			memset(params.attrib_plane[j], 0, CONS_X_MAX);
			memset(params.color_plane[j], 0, CONS_X_MAX);
		}
	}
}

void CONSOLE::InsertLines(int nLines)
{
	if (nLines <= 0) return;	// inserting 0 lines: do nothing

    history_buffer_visible=0; // insert new line -> view actual terminal screen instead of viewing the history buffer

	if (params.current_y_pos + nLines >= screen_y_size) {
		// insert more lines than the rest of the screen -> clear down from insert line
		for(int j = params.current_y_pos; j < screen_y_size; j++) {
			memset(params.char_plane[j], 0, CONS_X_MAX);
			memset(params.attrib_plane[j], 0, CONS_X_MAX);
			memset(params.color_plane[j], 0, CONS_X_MAX);
		}
	} else {
		// insert lines and move down bottom of the screen
		for(int j = screen_y_size-1; j >= params.current_y_pos + nLines; j--) {
			memcpy(params.char_plane[j], params.char_plane[j - nLines], CONS_X_MAX);
			memcpy(params.attrib_plane[j], params.attrib_plane[j - nLines], CONS_X_MAX);
			memcpy(params.color_plane[j], params.color_plane[j - nLines], CONS_X_MAX);
		}
		for(int j = params.current_y_pos; j < params.current_y_pos + nLines; j++) {
			memset(params.char_plane[j], 0, CONS_X_MAX);
			memset(params.attrib_plane[j], 0, CONS_X_MAX);
			memset(params.color_plane[j], 0, CONS_X_MAX);
		}
	}
}

void CONSOLE::PlotPixel(int x, int y, int bSet)
{
	// get c as pixel mask to draw into character bitmap
	BYTE c = (x & 1) ? 1 : 2;
	c = c << (y & 3)*2;

	// get bitmap from screen
	int x_pos = x >> 1; 
	int y_pos = y >> 2;
	BYTE scr = params.char_plane[y_pos][x_pos];
	scr = (scr < 128) ? 0 : scr - 128;
	if (params.attrib_plane[y_pos][x_pos] & 1) {
		// reverse bits
		scr = ~scr;
	}

	if (bSet) {
		// add pixel
		scr |= c;
	} else {
		// remove pixel
		scr &= ~c;
	}

	// put back bitmap to charmap
	if (scr > 127) {
		params.attrib_plane[y_pos][x_pos] |= 1;
		params.char_plane[y_pos][x_pos] = 128 + (~scr);
	} else {
		params.attrib_plane[y_pos][x_pos] &= ~1;
		params.char_plane[y_pos][x_pos] = 128 + scr;
	}
    // set color/attributes:
	params.color_plane[y_pos][x_pos] = current_color;

}

void CONSOLE::PlotPixelLine(int x0, int y0, int x1, int y1, int bSet)
{
        int dy = y1 - y0;
        int dx = x1 - x0;
        int stepx, stepy;

        if (dy < 0) { dy = -dy;  stepy = -1; } else { stepy = 1; }
        if (dx < 0) { dx = -dx;  stepx = -1; } else { stepx = 1; }
        dy <<= 1;                                                  // dy is now 2*dy
        dx <<= 1;                                                  // dx is now 2*dx

        PlotPixel(x0, y0, bSet);
        if (dx > dy) {
            int fraction = dy - (dx >> 1);                         // same as 2*dy - dx
            while (x0 != x1) {
                if (fraction >= 0) {
                    y0 += stepy;
                    fraction -= dx;                                // same as fraction -= 2*dx
                }
                x0 += stepx;
                fraction += dy;                                    // same as fraction -= 2*dy
                PlotPixel(x0, y0, bSet);
            }
        } else {
            int fraction = dx - (dy >> 1);
            while (y0 != y1) {
                if (fraction >= 0) {
                    x0 += stepx;
                    fraction -= dy;
                }
                y0 += stepy;
                fraction += dx;
                PlotPixel(x0, y0, bSet);
            }
        }

}

void CONSOLE::ExecCtrlSeqAction(int c, int d, BYTE p1, BYTE p2)
{
	if(log) log->OutLog("\n["); 
	
	switch(c) {
	case 0: if(log) log->OutLog("<no action defined>");
            break; // no command
	case CON_NOP:  //nop - does notihg, ignore control codes
			if(log) log->OutLog("No op - ignore");
			break;
	case CON_LEFT://left d columns
            if (d<1) d=1; 
			params.current_x_pos-=d;
			if(params.current_x_pos < 0) params.current_x_pos = 0;
            if(log) if (d==1) {
                        log->OutLog("cursor left");
                    } else {
                        char sLog[200];
                        sprintf_s(sLog, "cursor left %d columns", d);
                        log->OutLog(sLog); 
                    }
			break;
	case CON_RIGHT:	//cursor right
            if (d<1) d=1; 
			params.current_x_pos+=d;
			if(params.current_x_pos > screen_x_size - 1) params.current_x_pos = screen_x_size - 1;
            if(log) if (d==1) {
                        log->OutLog("cursor right");
                    } else {
                        char sLog[200];
                        sprintf_s(sLog, "cursor right %d columns", d);
                        log->OutLog(sLog); 
                    }
			break;
	case CON_DOWN:	//cursor down
            if (d<1) d=1; 
			params.current_y_pos+=d;
			if(params.current_y_pos > screen_y_size - 1) params.current_y_pos = screen_y_size - 1;
            if(log) if (d==1) {
                        log->OutLog("cursor down");
                    } else {
                        char sLog[200];
                        sprintf_s(sLog, "cursor down %d columns", d);
                        log->OutLog(sLog); 
                    }
			break;
	case CON_UP:	//cursor up
            if (d<1) d=1; 
			params.current_y_pos-=d;
			if(params.current_y_pos < 0) params.current_y_pos = 0;
            if(log) if (d==1) {
                        log->OutLog("cursor up");
                    } else {
                        char sLog[200];
                        sprintf_s(sLog, "cursor up %d columns", d);
                        log->OutLog(sLog); 
                    }
			break;
	case CON_EOS:	//erase to end of screen
			for(int i = params.current_x_pos; i < screen_x_size; i++) {
				params.char_plane[params.current_y_pos][i] = 0;
				params.attrib_plane[params.current_y_pos][i] = 0;
				params.color_plane[params.current_y_pos][i] = 0;
			}	
			for(int j = params.current_y_pos + 1; j < screen_y_size; j++) {
				for(int i = 0; i < screen_x_size; i++) {
					params.char_plane[j][i] = 0;
					params.attrib_plane[j][i] = 0;
					params.color_plane[j][i] = 0;
				}
			}
			if(log) log->OutLog("erase to end of screen");
			break;
	case CON_EOL:	//erase to end of line
			for(int i = params.current_x_pos; i < screen_x_size; i++) {
				params.char_plane[params.current_y_pos][i] = 0;
				params.attrib_plane[params.current_y_pos][i] = 0;
				params.color_plane[params.current_y_pos][i] = 0;
			}
			if(log) log->OutLog("erase to end of line");
			break;
	case CON_EBL:	//Erase from begin of line up to (and including) cursor position
			for(int i = 0; i<= params.current_x_pos; i++) {
				params.char_plane[params.current_y_pos][i] = 0;
				params.attrib_plane[params.current_y_pos][i] = 0;
				params.color_plane[params.current_y_pos][i] = 0;
			}
			if(log) log->OutLog("erase from begin of line");
			break;
	case CON_CLS:	//Clear Screen
			ClearScreen(false);
			if(log) log->OutLog("clear screen");
			break;
	case CON_HOME:	//home
			params.current_x_pos = params.current_y_pos = 0;
			if(log) log->OutLog("home");
			break;
	case CON_POS_YX:	//cursor pos y+nn x+nn  nn is d param 
            int x,y; 
            x=p2-d; y=p1-d; 
            goto cursor_pos_xy; 
	case CON_POS_XY: //cursor pos x+nn y+nn  nn is d param 
            x=p1-d; y=p2-d; 
        cursor_pos_xy:
			// KayPro: cursor can go to status line (line 25)
			int screen_y_size2;
            screen_y_size2 = screen_y_size;
            if (has_status_line) {
                screen_y_size2++;
                if (screen_y_size2 >= CONS_Y_MAX) screen_y_size2 = CONS_Y_MAX-1; 
            }	
			params.current_x_pos = (x < 0) ? 0 : (x > screen_x_size - 1) ? screen_x_size - 1 : x;
			params.current_y_pos = (y < 0) ? 0 : (y > screen_y_size2 - 1) ? screen_y_size2 - 1 : y;
			if(log) {
                char sLog[200];
    			sprintf_s(sLog, "Set Cursor Pos: X=%d, Y=%d", params.current_x_pos, params.current_y_pos);
                log->OutLog(sLog);
            }
            break;
	case CON_REVERSE_ON://Reverse On
			current_attrib |= 1; // Set
			if(log) log->OutLog("reverse on");
			break;
	case CON_REVERSE_OFF://Reverse Off
			current_attrib &= ~1; // reset
			if(log) log->OutLog("reverse off");
			break;
	case CON_BRIGHT_ON://Bright On
			current_attrib |= 4; // Set
			if(log) log->OutLog("bright on");
			break;
	case CON_BRIGHT_OFF://Bright Off
			current_attrib &= ~4; // Reset
			if(log) log->OutLog("bright off");
			break;
	case CON_BLINK_ON://Blink On
			current_attrib |= 8; // Set
			if(log) log->OutLog("blink on");
			break;
	case CON_BLINK_OFF://Blink Off
			current_attrib &= ~8; // Reset
			if(log) log->OutLog("blink off");
			break;
	case CON_UNDER_ON://Underline On
			current_attrib |= 2; // Set
			if(log) log->OutLog("underline on");
			break;
	case CON_UNDER_OFF://Underline Off
			current_attrib &= ~2; // Reset
			if(log) log->OutLog("underline off");
			break;
	case CON_CUR_ON://Cursor visible on
			params.cursor_visible = 1; // Set
			if(log) log->OutLog("cursor visible: on");
			break;
	case CON_CUR_OFF://Cursor visible off
			params.cursor_visible = 0; // Reset
			if(log) log->OutLog("cursor visible: off");
			break;
	case CON_INS_LIN://Insert Line
            if (d<1) d=1; 
			InsertLines(d);
            if(log) if (d==1) {
                        log->OutLog("insert line");
                    } else {
                        char sLog[200];
                        sprintf_s(sLog, "insert %d lines", d);
                        log->OutLog(sLog); 
                    }
			break;
	case CON_DEL_LIN://Delete Line			}
            if (d<1) d=1; 
			DeleteLines(d);
            if(log) if (d==1) {
                        log->OutLog("delete line");
                    } else {
                        char sLog[200];
                        sprintf_s(sLog, "delete %d lines", d);
                        log->OutLog(sLog); 
                    }
			break;
	case CON_EEL://Erase entire line
			for(int i = 0; i < screen_x_size; i++) {
				params.char_plane[params.current_y_pos][i] = 0;
				params.attrib_plane[params.current_y_pos][i] = 0;
				params.color_plane[params.current_y_pos][i] = 0;
			}
			if(log) log->OutLog("erases entire current line");
			break;
	case CON_RESET_ATTR://reset attributes
			current_attrib = 0;
			if(log) log->OutLog("reset Attributes");
			break;
	case CON_REVERSE_TOGGLE://Toggle inverse video
			current_attrib = (current_attrib & 1) ? (current_attrib & 0xfe) : (current_attrib | 1);
			if(log) log->OutLog("toggle reverse video");
			break;
	case CON_CR:	//Carriadge return
			params.current_x_pos = 0;
			if(log) log->OutLog("CR");
			break;
	case CON_CRLF://CR LF
			params.current_x_pos = 0;
			if(log) log->OutLog("CR ");
	case CON_LF://LF
			params.current_y_pos++;
			if(params.current_y_pos >= screen_y_size) {
				ScrollScreen(1);
				params.current_y_pos = screen_y_size - 1;
			}
			if(log) log->OutLog("LF");
			break;
	case CON_REVERSE_LF://
			params.current_y_pos--;
			if(params.current_y_pos < 0) {
				ScrollScreen(-1);
				params.current_y_pos = 0;
			}
			if(log) log->OutLog("Reverse LF");
			break;
	case CON_CUR_SAVE://save cursor
            params.save_current_x_pos=params.current_x_pos; 
            params.save_current_y_pos=params.current_y_pos; 
            if(log) {
                char sLog[200];
                sprintf_s(sLog, "save current cursor pos (x=%d, y=%d)", 
                    params.current_x_pos, params.current_y_pos);
                log->OutLog(sLog); 
            }
			break;
	case CON_CUR_RESTORE://restore cursor
            x=params.current_x_pos; y=params.current_y_pos; 
            params.current_x_pos=params.save_current_x_pos; 
            params.current_y_pos=params.save_current_y_pos; 
            if(log) {
                char sLog[200];
                sprintf_s(sLog, "restore cursor pos (cursor goes from x=%d, y=%d to x=%d, y=%d)", 
                    x,y, params.current_x_pos,params.current_y_pos);
                log->OutLog(sLog); 
            }
			break;
	case CON_BACKSPACE://backspace
			if(!(params.current_x_pos == 0 && params.current_y_pos == 0)) {
				// backspace to end of previous line
				if(--params.current_x_pos < 0) {
					params.current_x_pos = screen_x_size - 1;
					params.current_y_pos--;
				}
				params.char_plane[params.current_y_pos][params.current_x_pos] = 0;
				params.attrib_plane[params.current_y_pos][params.current_x_pos] = 0;
			 	params.color_plane[params.current_y_pos][params.current_x_pos] = 0;
			}
			if(log) log->OutLog("BackSpace");
			break;
	case CON_REPLY:// send a reply from terminal back to program
            // (as if it was typed on the keyboard)
            char * sReply; 
            sReply=TermCtrlSeqReply[d];
			if(log) log->OutLog("Reply: ");
            while(*sReply) {
                PressKey(*sReply);
                if(log) {
                    char sLog[40];
                    if (*sReply < 32) {
                        sprintf_s(sLog, "#%d ", *sReply);
                    } else {
                        sprintf_s(sLog, "%c ", *sReply);
                    }
                    log->OutLog(sLog); 
                }
                sReply++;
            }            
			break;
	case CON_CUR_REPORT:// send a reply from terminal back to program
            // (as if it was typed on the keyboard) reporting cursor pos
            char sReplyText[100];
            sReplyText[0]=0; sReply=sReplyText; 
            if ((terminal_type == CRT_VT100) && (terminal_subtype==VT100_ANSI)) {
                // ANSI: ESC [ 6 n: report cursor pos as ESC [ lin;col R
                // lin and col must have 2 digits (VCCP.COM expects this)
                sprintf_s(sReplyText, "%c%c%02d;%02d%c", 27, '[', params.current_y_pos+1,
                                                              params.current_x_pos+1, 'R');
            }
            if(log) {
                char sLog[200];
                sprintf_s(sLog, "report cursor location: %s", sReplyText);
                log->OutLog(sLog); 
            }
            while(*sReply) {
                PressKey(*sReply);
                sReply++;
            }            
			break;
	case CON_INS_CHR:// Insert char
            if (params.current_x_pos < screen_x_size-1) {
    			for(int i = screen_x_size-1; i > params.current_x_pos; i--) {
	    			params.char_plane[params.current_y_pos][i] = params.char_plane[params.current_y_pos][i-1];
		    		params.attrib_plane[params.current_y_pos][i] = params.attrib_plane[params.current_y_pos][i-1];
			    	params.color_plane[params.current_y_pos][i] = params.color_plane[params.current_y_pos][i-1];
			    }
            } 
            params.char_plane[params.current_y_pos][params.current_x_pos] = 0;
       		params.attrib_plane[params.current_y_pos][params.current_x_pos] = 0;
	    	params.color_plane[params.current_y_pos][params.current_x_pos] = 0;
            if(log) {
                char sLog[200];
                sprintf_s(sLog, "insert char at column %d", params.current_x_pos);
                log->OutLog(sLog); 
            }
			break;
	case CON_DEL_CHR:// delete char
            if (params.current_x_pos < screen_x_size-1) {
    			for(int i = params.current_x_pos; i < screen_x_size-1; i++) {
	    			params.char_plane[params.current_y_pos][i] = params.char_plane[params.current_y_pos][i+1];
		    		params.attrib_plane[params.current_y_pos][i] = params.attrib_plane[params.current_y_pos][i+1];
			    	params.color_plane[params.current_y_pos][i] = params.color_plane[params.current_y_pos][i+1];
			    }
            } 
            params.char_plane[params.current_y_pos][screen_x_size-1] = 0;
       		params.attrib_plane[params.current_y_pos][screen_x_size-1] = 0;
	    	params.color_plane[params.current_y_pos][screen_x_size-1] = 0;
            if(log) {
                char sLog[200];
                sprintf_s(sLog, "delete char at column %d", params.current_x_pos);
                log->OutLog(sLog); 
            }
			break;
	case CON_SET_ATTR:// attributes, general setting
            // SET_ATTR_abcd   -> 0=off, 1=on, 2=toggle, 9=do not change
            //                  a=blink, b=bright, c=underline, d=reverse
            int mask, mask_and, mask_or, mask_xor, dd; 
            mask_and=0xf; mask_or=0; mask_xor=0; mask=1; 
            if(log) log->OutLog("set attributes:");
            // build the mask for current_attrib
            for (int i=0; i<4; i++) {
                dd = d % 10; d=d/10;
                if (dd==0) { mask_and = mask_and & (~mask); } else
                if (dd==1) { mask_or  = mask_or  | mask; } else
                if (dd==2) { mask_xor = mask_xor | mask; }
                if(log) {
                    if (dd==2) log->OutLog(" toggle");
                    if (i==0) log->OutLog(" reverse video"); else 
                    if (i==1) log->OutLog(" bright"); else 
                    if (i==2) log->OutLog(" blink"); else 
                    if (i==3) log->OutLog(" underline"); 
                    if (dd==0) log->OutLog(" off"); else
                    if (dd==1) log->OutLog(" on"); else log->OutLog(" no change"); 
                    if (i<3) log->OutLog(",");
                }
                mask=mask << 1; 
            }
            // apply mask
            current_attrib &= mask_and; 
            current_attrib |= mask_or; 
            current_attrib ^= mask_xor; 
			break;
	case CON_SET_LIN_LOCK:// set line lock_NN
            // lock line y
            y=p1-d; if (y<0) y=0; if (y>=screen_y_size) y=screen_y_size-1;
            params.locked_lines[y]=1;
            if(log) {
                char sLog[200];
                sprintf_s(sLog, "lock line %d", y);
                log->OutLog(sLog); 
            }
            break;
	case CON_RESET_LIN_LOCK:// reset line lock_NN
            // unlock line y
            y=p1-d; if (y<0) y=0; if (y>=screen_y_size) y=screen_y_size-1;
            params.locked_lines[y]=0;
            if(log) {
                char sLog[200];
                sprintf_s(sLog, "unlock line %d", y);
                log->OutLog(sLog); 
            }
            break;
	case CON_RESET_ALL_LIN_LOCKS:// reset all line locks
            // unlock all lines
            memset(params.locked_lines, 0, sizeof(params.locked_lines)); 
            if(log) log->OutLog("unlock all lines");
            break;
	case CON_SET_TOP_LIN_LOCK:// set top line lock, above cursor
            // lock top of screen up to above cursor
            for (int j=0; j<params.current_y_pos;j++) params.locked_lines[j]=1;
            if(log) {
                char sLog[200];
                sprintf_s(sLog, "lock lines 0 to %d", params.current_y_pos-1);
                log->OutLog(sLog); 
            }
            break;
    case CON_WRITE_STATUS_LINE_MSG: 
            // clear, shows status line 25. Set attrin to reverse
            // Start writing on it by setting the cursor at line 25
            if ((has_status_line) && (screen_y_size < CONS_Y_MAX)) {
    			for(int i = 0; i < screen_x_size; i++) {
	    			params.char_plane[screen_y_size][i] = 32; // space
		    		params.attrib_plane[screen_y_size][i] = 0;
			    	params.color_plane[screen_y_size][i] = 1; // reversed
    			}
                // save current cursor pos and current attrib
                params.save_current_x_pos=params.current_x_pos; 
                params.save_current_y_pos=params.current_y_pos; 
                params.save_current_attrib=current_attrib; 
                // set reverse on
                current_attrib = 1; 
                // set cursor at line 25
                params.current_x_pos=0; 
                params.current_y_pos=screen_y_size; 
                if(log) log->OutLog("Start writing on status line");
            } else {
                if(log) log->OutLog("Start writing on status line (ignored, no status line)");
            }
            break; 
    case CON_END_STATUS_LINE_MSG: 
            // restore cursor and attrib
            if ((has_status_line) && (screen_y_size < CONS_Y_MAX)) {
                params.current_x_pos=params.save_current_x_pos; 
                params.current_y_pos=params.save_current_y_pos; 
                current_attrib=params.save_current_attrib; 
                if(log) log->OutLog("End writing on status line");
            } else {
                if(log) log->OutLog("End writing on status line (ignored, no status line)");
            }
            break; 
    case CON_CLEAR_STATUS_LINE: 
            if ((has_status_line) && (screen_y_size < CONS_Y_MAX)) {
    			for(int i = 0; i < screen_x_size; i++) {
	    			params.char_plane[screen_y_size][i] = 0; // space
		    		params.attrib_plane[screen_y_size][i] = 0;
			    	params.color_plane[screen_y_size][i] = 0; // reversed
    			}
                if(log) log->OutLog("Clear status line");
            } else {
                if(log) log->OutLog("Clear status line (ignored, no status line)");
            }
            break; 
    case CON_SCROLL: 
            // SCROLL_NN_abcd
            //           a=0 scroll up (normal)
            //             1 scroll down (reverse)
            //           b=0 = one line
            //             1 = lines to scroll given in param 1  
            //             2 = lines to scroll given in param 2
            //           c=0 = from top of screen/first un locked line
            //             1 = from line given in param 1  
            //             2 = from line given in param 2
            //           d=0 = for screen size 
            //             1 = for lines given in param 1  
            //             2 = for lines given in param 2
            int dNN, scroll_nlines, scroll_for, scroll_from, clear_locked_lines;
            if(log) log->OutLog("scroll: ");
            dNN = d / 10000; clear_locked_lines=0; 
            dd = d % 10; d=d/10; 
            if (dd==1) scroll_for=p1 - dNN; else
            if (dd==2) scroll_for=p2 - dNN; else scroll_for=screen_y_size; 
            if (dd>0) clear_locked_lines=1; 
            dd = d % 10; d=d/10; 
            if (dd==1) scroll_from=p1 - dNN; else
            if (dd==2) scroll_from=p2 - dNN; else scroll_from=0; 
            if (dd>0) clear_locked_lines=1; 
            dd = d % 10; d=d/10; 
            if (dd==1) scroll_nlines=p1 - dNN; else
            if (dd==2) scroll_nlines=p2 - dNN; else scroll_nlines=1; 
            dd = d % 10; d=d/10; 
            if (dd==1) scroll_nlines=-scroll_nlines; 
            if (clear_locked_lines) {
                // clear locked lines to enable scrolling for entire display
                memset(params.locked_lines, 0, sizeof(params.locked_lines)); 
                // lock lines on top of screen to set scroll_from line (whew the scroll starts)
                if ((scroll_from < 0) || (scroll_from >= screen_y_size)) {
                    if(log) {
                        char sLog[200];
                        sprintf_s(sLog, "invalid scroll from value %d (must be 0..%d) ", scroll_from, screen_y_size-1);
                        log->OutLog(sLog); 
                    }
                } else {
                    for(int j=0; j<scroll_from;j++) params.locked_lines[j]=1; // mark top of screen as locked until line scroll_from
                }
                // lock lines on bottom of screen to set scroll_for lines (whew the scroll ends)
                y=scroll_from+scroll_for; if (y > screen_y_size) y = screen_y_size;
                if (y < 0) {
                    if(log) {
                        char sLog[200];
                        sprintf_s(sLog, "invalid scroll for value %d (must be 0..%d) ", scroll_for, screen_y_size);
                        log->OutLog(sLog); 
                    }
                } else {
                    for(int j=y; j<screen_y_size;j++) params.locked_lines[j]=1; // mark bottom of screen as locked until line scroll_from
                }
            }
            // perform scroll
            ScrollScreen(scroll_nlines); 
            // clear locked lines
            if (clear_locked_lines) {
                if(log) {
                    char sLog[200];
                    sprintf_s(sLog, "Scroll %d lines from line %d for (region of) %d lines", scroll_nlines, scroll_from, scroll_for);
                    log->OutLog(sLog); 
                }
                memset(params.locked_lines, 0, sizeof(params.locked_lines)); 
            } else {
                if(log) {
                    char sLog[200];
                    sprintf_s(sLog, "Scroll %d lines ", scroll_nlines);
                    log->OutLog(sLog); 
                }
            }
            break; 
    case CON_PAGE: 
            // PAGE_a
            //      a=0 = display page 0
            //        1 = display page 1
            //        2 = toggle page
            if ((d==0) || (d==1)) {
                if (params.visible_page == d) {
                    if(log) {
                        char sLog[200];
                        sprintf_s(sLog, "Select visible page %d (already selected) ", params.visible_page);
                        log->OutLog(sLog); 
                    }
                    break;
                }
                // swap lines 0..23 with 24..47
                d=2; // set to swap
            }
            if (d==2) { // swap pages
                int a; 
                for (int j=0; j<CONS_Y_MAX; j++) for(int i=0;i<CONS_X_MAX;i++) {
	    			a=params.char_plane[j][i]; params.char_plane[j][i]=params.alt_page.char_plane[j][i]; params.alt_page.char_plane[j][i]=a;
	    			a=params.attrib_plane[j][i]; params.attrib_plane[j][i]=params.alt_page.attrib_plane[j][i]; params.alt_page.attrib_plane[j][i]=a;
	    			a=params.color_plane[j][i]; params.color_plane[j][i]=params.alt_page.color_plane[j][i]; params.alt_page.color_plane[j][i]=a;
                }
                params.visible_page=1-params.visible_page; 
                if(log) {
                    char sLog[200];
                    sprintf_s(sLog, "Select visible page %d", params.visible_page);
                    log->OutLog(sLog); 
                }
            } else {
                if(log) {
                    char sLog[200];
                    sprintf_s(sLog, "Cannot select visible invalid page %d", d);
                    log->OutLog(sLog); 
                }
            }
            break; 
	}
	if(log) log->OutLog("]\n"); 
}

void CONSOLE::PutChar(BYTE code, BOOL update_flag)
{
	buffer[buffer_ptr++] = code; buffer[buffer_ptr]=0;
	char logstring[256];
	BYTE last_code;

    // put a new char in console -> view actual terminal screen instead of viewing the history buffer
    history_buffer_visible=0; 

	// incremet the number of chars sent to terminal
	CPS_count ++;
    
    // check the expect string against printed char code
    char sChIn[2]; sChIn[0]=code; sChIn[1]=0; 
    ExpectString(3, sChIn); 

    if ((code == 27) && (buffer_ptr > 1)) {
        // ESC inside antoher ESC sequence
   		if(log) log->OutLog("\nESC unknown sequence \n");
        // restart a new one
        buffer[0]=code; 
        buffer[1]=0; 
        buffer_ptr=1; 
    }

	if(log) {
		    if (code == 27) log->OutLog("\n");
		    log->OutLogOneChar(code);
		    if (code == 10) log->OutLog("\n");
	}
    if (buffer_ptr > 15) {
   		if(log) log->OutLog("\nESC unknown sequence too long - Ignore\n");
        buffer_ptr=0; 
        return; 
    }
	if (TermCtrlSeqAction[0] != 0) {
	   // custom terminal control sequences
		BYTE p1 = 0; BYTE p2 = 0;
		BYTE c; int param_used = 0;
		int ifound = -1;
		for (int iCtrl=0;iCtrl<MAX_CTRL_SEQ;iCtrl++) {
			if (0 == TermCtrlSeq[iCtrl]) break;
			for (int i=0;i<MAX_CRTL_SEQ_LEN;i++) {
				c = TermCtrlSeq[iCtrl][i];
				if (i==buffer_ptr) {
					if (c == 0) {
						ifound = iCtrl;
					} else {
						ifound = -2; // partial found
					}
					break;
				}
				if (c == 255) {
					//  char 255 match everything -> read param p1 or p2
					if (param_used == 0) {
						p1 = buffer[i];
						param_used = 1; 
					} else if (param_used == 1) {
						p2 = buffer[i];
						param_used = 2; 
					}
				} else {
					if (c != buffer[i]) break;
				}
			}
		}
		if (ifound == -2) return; // partial found -> exit keeping chars
		if (ifound >= 0) {
			// execute control seq
			int c = TermCtrlSeqAction[ifound];
			int d = TermCtrlSeqActionParam[ifound];
			ExecCtrlSeqAction(c, d, p1, p2);
			buffer_ptr = 0; // clear ctrl sequence to avoid being executed again
			buffer[0] = 0; 
		}

	}
	
    if ((terminal_type == CRT_VT100) && (terminal_subtype == VT100_ANSI) && 
        (buffer_ptr==1) &&
        (params.vt100_charset[params.vt100_current_charset]==VT100_gr_mode) ) {
        // translate VT100 semigraphics to similar regular ascii chars
        // according to this: https://en.wikipedia.org/wiki/DEC_Special_Graphics
        int c=0; 
        if (code == '_') c=32; else
        if (code == 0x60) c='·'; else
        if (code == 'a') c='#'; else
        if (code == 'f') c='º'; else 
        if (code == 'g') c='±'; else 
        if ((code >= 'j') && (code <='m')) c='+'; else // corners
        if (code == 'n') c='+'; else 
        if ((code >= 'o') && (code <='s')) c='-'; else // horizontal bars
        if ((code >= 't') && (code <='w')) c='+'; else // junctions
        if (code == 'x') c='|';
        if (c) {
            buffer[0]=c; 
        }
    } else if ((params.graphic_mode==Osborne_gr_mode) &&
		(buffer_ptr == 1)) {
		// Handle Osborne graphic mode
		if ((code < 32) && (code != 27)) {
			// convert ctrl-chars to graphic chars
			buffer[0] = code + 128;		
		} else if ((code >= 'a') && (code <= 127)) {
			// convert graphics layout a-z chars printed in keyboard to the
			// equivalent char
			buffer[0] = code - 'a' + 1 + 128;
		}
	} else if ((params.graphic_mode == H19_gr_mode) &&
		(buffer_ptr == 1) && (code >= 94) && (code < 128)) {
		// Handle H-19 graphic mode 
        buffer[0] = code + 128;
    }
    if ((params.RG512.enabled) && (params.RG512.TekMode==0) && 
        (  (buffer[0] == 28) || (buffer[0] == 29))) {
        // RG-512: FS and GS activates 4010 mode 
        params.RG512.TekMode=1; 
        params.RG512.DrawMode=0; 
        ExecCtrlSeqAction(CON_CUR_OFF,0,0,0); // disable ascii cursor 
  		if(log) log->OutLog("\nRG-512: Enter 4010 mode");        
    }

	if(buffer[0] == 0x07) {
		// BELL
		buffer_ptr = 0;
		if(log) log->OutLog("\nPRINT CHR(7) ^G BELL - Ignored\n");
        if ((terminal_type == CRT_TEK4010) || (params.RG512.TekMode)) params.tek4010.ByPassMode=0; 
	}
	else if((terminal_type == CRT_TEK4010) || (params.RG512.TekMode)) {
        double font_scale = ( (params.tek4010.CharSize==1) ? TEK_SMALL_FONT : (params.tek4010.CharSize==2) ? TEK_BIG_FONT : 1.0 );
        int tekfontw = (int) (14 * font_scale);
        int tekfonth = (int) (22 * font_scale);
       TekProcessCtrlChar:
        if(buffer[0] == 0) {
            // NUL char -> ignore it
		    buffer_ptr = 0;
        } else if(buffer[0] == 0x08) {
		    // BACKSPACE = cursor left
            params.tek4010.gr_x_pos -= tekfontw; 
            if (params.tek4010.gr_x_pos < 0) params.tek4010.gr_x_pos=0; 
		    buffer_ptr = 0;
    		if(log) log->OutLog("\nTek4010: Cursor left\n");
        } else if((buffer[0] == 13) || (buffer[0 ]== 4)) {
            // <CR> to current margin column zero
            // <EOT> same effect as <CR>
            if (params.tek4010.ByPassMode) {
                // if ByPass mode active, <CR> clears Bypass mode instead of performing
                // regular operation
                params.tek4010.ByPassMode=0; 
            } else {
                params.tek4010.gr_x_pos=(params.tek4010.margin) ? 512: 0; 
                params.tek4010.mode=0; // return to alpha mode
                if (params.RG512.TekMode) params.RG512.DrawMode=0; 
            }
		    buffer_ptr = 0;
    		if(log) log->OutLog("\nTek4010: <CR>\n");
        } else if(buffer[0] == 10) {
            // ^J = <LF> = Line Feed = cursor down. At bottom of screen, do not scroll
            // (Tek displays cannot scroll contents). Instead toggle the active margin
            // and go to top of it. gr pos is the lower left corner of char when the char is drawn
            // so first line of screen is not at y=0, but instead at y=tekfonth-1
            params.tek4010.gr_y_pos += tekfonth; 
            if (params.tek4010.gr_y_pos >= 780) {
                params.tek4010.margin=1-params.tek4010.margin; 
                params.tek4010.gr_x_pos ^= 512; 
                params.tek4010.gr_y_pos = tekfonth-1; 
            }
            params.tek4010.ByPassMode=0;
		    buffer_ptr = 0;
            if(screen_log) {
                screen_log->OutLogByte(13);
                screen_log->OutLogByte(10);
            }
    		if(log) log->OutLog("\nTek4010: <LF> Cursor down\n");
        } else if(buffer[0] == 11) {
            // ^K = cursor up. At top of screen, do not move
            params.tek4010.gr_y_pos -= tekfonth; 
            if (params.tek4010.gr_y_pos < tekfonth) {
                params.tek4010.gr_y_pos = tekfonth-1; 
            }
		    buffer_ptr = 0;
    		if(log) log->OutLog("\nTek4010: Cursor up\n");
        } else if((buffer[0] == 24) && (params.RG512.enabled)) {
            // <CAN> = ^X = exit from tek 4010 mode and return to regular ascii mode
            params.RG512.TekMode=0; 
		    buffer_ptr = 0;
            ExecCtrlSeqAction(CON_CUR_ON,0,0,0); // enable back ascii cursor 
    		if(log) log->OutLog("\nRG-512: Leave 4010 mode\n");
        } else if((buffer[0] == 25) && (params.RG512.enabled)) {
            // <EM> = ^Y = clear RG-512 graphic memory
            params.RG512.DrawMode=0; // set normal draw mode
            ClearScreen_GrOverlay();
  		    buffer_ptr = 0;
    		if(log) log->OutLog("\nRG-512: Clear graphic memory\n");
        } else if((buffer[0] == 26) && (params.RG512.enabled)) {
            // <SUB> = ^Z = clear terminal ascii memory
       		ExecCtrlSeqAction(CON_CLS,0,0,0);
            buffer_ptr = 0;
    		if(log) log->OutLog("\nRG-512: Clear ascii memory\n");
        } else if(buffer[0] == 28) {
            // <FS> enter point mode
            params.tek4010.mode=3; // point mode
            params.tek4010.Hi=0; // where to store hi byte received. 0-> y, 1->x; Start expecting HiY
		    buffer_ptr = 0;
    		if(log) log->OutLog("\nTek4010: <FS> Enter point mode\n");
        } else if(buffer[0] == 29) {
            // <GS> enter vector mode
            params.tek4010.mode=2; // vector mode
            params.tek4010.DarkMode=1; // set to 1 on entering graph mode so first vector is not draw (allow to position gr cursor at its desired draw start coord)
            params.tek4010.Hi=0; // where to store hi byte received. 0-> y, 1->x; Start expecting HiY
		    buffer_ptr = 0;
    		if(log) log->OutLog("\nTek4010: <GS> Enter vector mode\n");
        } else if(buffer[0] == 30) {
            // <RS> enter incremental plot mode
            params.tek4010.mode=4; // incremental plot mode
		    buffer_ptr = 0;
    		if(log) log->OutLog("\nTek4010: <RS> Enter Incremental plot mode\n");
        } else if(buffer[0] == 31) {
            // <US> enter alfa mode
            params.tek4010.mode=0; // alfa mode
		    buffer_ptr = 0;
            params.tek4010.ByPassMode=0;
    		if(log) log->OutLog("\nTek4010: <US> Enter alpha mode\n");
        } else if ((buffer[0] == 0x1b) && (buffer_ptr >= 2) && (buffer[1] == 28) ) {
            // ESC FS n -> special point mode: set intensity -> not implemented
            if (buffer_ptr == 3) {
   		        buffer_ptr = 0;
       		    if(log) log->OutLog("\nTek4010: ESC FS n -> special point mode (set intensity) Not implemented\n");
            }
        } else if ((buffer[0] == 0x1b) && (buffer_ptr >= 2) && (buffer[1] == '[')) {                    
            // ESC [ 38h -> xterm sequence to enter to Tek4010 emulation mode: ignored
            // sent by DDXTEK driver
            if ((buffer_ptr == 6) && (buffer[2] == '?') && (buffer[3] == '3') && (buffer[4] == '8') && (buffer[5] == 'h') ) {
   		        buffer_ptr = 0;
       		    if(log) log->OutLog("\nTek4010: xterm sequence to enter to Tek4010 emulation mode: ignored\n");
            }
        } else if ((buffer[0] == 0x1b) && (buffer_ptr >= 2) && (buffer[1] == '/')) {                    
            // escape sequences sent by DDVRET driver
            if ((buffer_ptr == 3) && (buffer[2] == 'f')) {
                // ESC / f -> load cursor: ignored
   		        buffer_ptr = 0;
       		    if(log) log->OutLog("\nRG-512: load cursor: ignored\n");
            } else if ((buffer_ptr == 4) && (buffer[2] == '0') && (buffer[3] == 'd') ) {
                // ESC / 0 d -> draw mode
                params.RG512.DrawMode=0; // erase mode
   		        buffer_ptr = 0;
       		    if(log) log->OutLog("\nRG-512: use fore color\n");
            } else if ((buffer_ptr == 4) && (buffer[2] == '1') && (buffer[3] == 'd') ) {
                // ESC / 1 d -> erase mode
                params.RG512.DrawMode=1; // erase mode
   		        buffer_ptr = 0;
       		    if(log) log->OutLog("\nRG-512: use background color\n");
            } else if ((buffer_ptr == 4) && (buffer[2] == '2') && (buffer[3] == 'd') ) {
                // ESC / 2 d -> Xor mode
                params.RG512.DrawMode=2; 
   		        buffer_ptr = 0;
       		    if(log) log->OutLog("\nRG-512: use xor color mode\n");
            } 
        } else if (buffer[0] == 0x1b) {
            if ((buffer_ptr == 2) && (buffer[1] >= 0x1d) && (buffer[1] <= 31))  {
                // ESC GS -> same as <GS>
                // ESC RS -> same as <RS>
                // ESC US -> same as <US>
                buffer[0]=buffer[1];     // place the control char at beggining of sequence
                goto TekProcessCtrlChar; // and process it as it was received without ESC
    		} else if ((buffer_ptr == 2) && (buffer[1] == 'a') && (params.RG512.enabled))  {
                // ESC a -> terminate erase mode in RG-512
                params.RG512.DrawMode=0; 
      		    buffer_ptr = 0;
        		if(log) log->OutLog("\nRG-512: Terminate erase mode\n");
    		} else if ((buffer_ptr == 2) && (buffer[1] == 127) && (params.RG512.enabled))  {
                // ESC DEL -> set erase mode in RG-512
                params.RG512.DrawMode=1; 
      		    buffer_ptr = 0;
        		if(log) log->OutLog("\nRG-512: Set erase mode\n");
    		} else if ((buffer_ptr == 2) && (buffer[1] == 17) && (params.RG512.enabled))  {
                // ESC DC1 = ESC ^Q -> read back graphic memory: not implemented
      		    buffer_ptr = 0;
        		if(log) log->OutLog("\nRG-512: read back graphic memory: not implemented\n");
    		} else if ((buffer_ptr == 2) && (buffer[1] == 3))  {
                // ESC ^C = xterm sequence to leave Tek4010 emulation mode: ignored, just homes the cursor
                params.tek4010.gr_x_pos=0;
                params.tek4010.gr_y_pos=tekfontw-1;
   		        buffer_ptr = 0;
       		    if(log) log->OutLog("\nTek4010: xterm sequence to leave Tek4010 emulation mode: just homes cursor\n");
            } else if ((buffer_ptr == 2) && (buffer[1] == 5))  {
                // ESC ^E = ESC ENQ = send to program the current crosshair position
        		if(log) log->OutLog("\nTek4010: ESC <ENQ> return crosshair position\n");
                Tek4010(3,0); // send GIN data
                if (params.RG512.enabled) {
                    // DDVRET driver does not echo enq data to terminal, so no need to set bypass mode
                } else {
                    params.tek4010.ByPassMode=1; // set bypass mode
                }
     		    buffer_ptr = 0;
            } else if ((buffer_ptr == 2) && (buffer[1] == 12))  {
                // ESC ^L = ESC FF = Same as PAGE key on Tek4010 (mapped to ESC key in PC keyboard)
                Tek4010(0,0); // clear screen
     		    buffer_ptr = 0;
                if (params.RG512.enabled) {
                    params.RG512.DrawMode=0;
                    ExecCtrlSeqAction(CON_CLS,0,0,0);
                }
        		if(log) log->OutLog("\nTek4010: ESC <FF> Clear Screen\n");
            } else if ((buffer_ptr == 2) && (buffer[1] == 14))  {
                // ESC SO -> select alternate APL charset
     		    buffer_ptr = 0;
    		    if(log) log->OutLog("\nTek4010: Select alternate APL charset: not implemented\n");
            } else if ((buffer_ptr == 2) && (buffer[1] == 15))  {
                // ESC SO -> select ASCII charset
     		    buffer_ptr = 0;
    		    if(log) log->OutLog("\nTek4010: Select ASCII charset\n");
            } else if ((buffer_ptr == 2) && (buffer[1] == 23))  {
                // ESC ETB -> make hardcopy
                params.tek4010.ByPassMode=0;
     		    buffer_ptr = 0;
    		    if(log) log->OutLog("\nTek4010: Make hardcopy: not implemented\n");
            } else if ((buffer_ptr == 2) && (buffer[1] == 24))  {
                // ESC ^X = ESC CAN = Set bypass condition
                params.tek4010.ByPassMode=1; // set bypass mode
     		    buffer_ptr = 0;
                 if(log) log->OutLog("\nTek4010: ESC <CAN> set bypass condition\n");
            } else if ((buffer_ptr == 2) && (buffer[1] == 26))  {
                // ESC ^Z = ESC SUB = enter GIN mode. Activate crosshair
                params.tek4010.mode=1; // GIN mode
                params.tek4010.ByPassMode=1;
     		    buffer_ptr = 0;
    		    if(log) log->OutLog("\nTek4010: ESC ^Z Enter GIN mode\n");
            } else if ((buffer_ptr == 2) && (buffer[1] == '8'))  {
                // ESC 8 -> normal 74 cols x 35 lines character set
                params.tek4010.CharSize=0;
     		    buffer_ptr = 0;
    		    if(log) log->OutLog("\nTek4010: Select normal font size\n");
            } else if ((buffer_ptr == 2) && 
                ((buffer[1] == '9') || (buffer[1] == ':') || (buffer[1] == ';') ))  {
                    // ESC 9 -> small 81 cols x 38 lines character set
                    // ESC : -> small 121 cols x 58 lines character set
                    // ESC ; -> small 133 cols x 64 lines character set
                params.tek4010.CharSize=1; // only one small charset emulated, for 148x70 (half size chars)
     		    buffer_ptr = 0;
    		    if(log) log->OutLog("\nTek4010: Select small font size\n");
            } else if ((buffer_ptr == 2) && (buffer[1] == '0') && (params.RG512.enabled))  {
                // ESC 0 -> sent by DDVRET driver: normal character set
                params.tek4010.CharSize=0;
     		    buffer_ptr = 0;
    		    if(log) log->OutLog("\nRG-512: Select normal font size\n");
            } else if ((buffer_ptr == 2) && (params.RG512.enabled) &&
                ((buffer[1] == '1') || (buffer[1] == '2') || (buffer[1] == '3') ))  {
                    // ESC 1..3: sent by DDVRET driver to select big fonts
                params.tek4010.CharSize=2; // only one big charset emulated 
     		    buffer_ptr = 0;
    		    if(log) log->OutLog("\nRG-512: Select big font size\n");
            } else if ((buffer_ptr == 2) && (buffer[1] == 0x60))  {
                // ESC ` -> normal vector: continuous line, non defocused, no write thru
                params.tek4010.Pattern=0; // =0 -> solid vector, =1 -> dotted line, =2 -> dot-dashed, =3 -> short dashed, =4 -> long dashed
     		    buffer_ptr = 0;
    		    if(log) log->OutLog("\nTek4010: Select normal vector\n");
            } else if ((buffer_ptr == 2) && (buffer[1] == 'a'))  {
                // ESC a -> dotted vector 
                params.tek4010.Pattern=1; 
     		    buffer_ptr = 0;
    		    if(log) log->OutLog("\nTek4010: Select dotted vector\n");
            } else if ((buffer_ptr == 2) && (buffer[1] == 'b'))  {
                // ESC b -> dot-dashed vector 
                params.tek4010.Pattern=2; 
     		    buffer_ptr = 0;
    		    if(log) log->OutLog("\nTek4010: Select dot-dashed vector\n");
            } else if ((buffer_ptr == 2) && (buffer[1] == 'c'))  {
                // ESC c -> short-dashed vector 
                params.tek4010.Pattern=3; 
     		    buffer_ptr = 0;
    		    if(log) log->OutLog("\nTek4010: Select short-dashed vector\n");
            } else if ((buffer_ptr == 2) && (buffer[1] == 'd'))  {
                // ESC d -> long-dashed vector 
                params.tek4010.Pattern=4; 
     		    buffer_ptr = 0;
    		    if(log) log->OutLog("\nTek4010: Select long-dashed vector\n");
            } else if ((buffer_ptr == 2) && (buffer[1] >= 'h') && (buffer[1] <= 'l'))  {
                // ESC h..l -> defocused vector
     		    buffer_ptr = 0;
    		    if(log) log->OutLog("\nTek4010: Select defocused vector: Not Implemented\n");
            } else if ((buffer_ptr == 2) && (buffer[1] >= 'p') && (buffer[1] <= 't'))  {
                // ESC p..t -> write thru vector
     		    buffer_ptr = 0;
    		    if(log) log->OutLog("\nTek4010: Select write thru vector: Not Implemented\n");
            } else if (buffer_ptr >= 2) {
     		    buffer_ptr = 0;
				if(log) log->OutLog("\nTek4010: unknown Escape sequence: ignored\n");
            }
        } else if (params.tek4010.mode==4) {
            // incremental plot mode
            int data = buffer[0];
            int dx,dy,x,y,pendown;
            dx=dy=pendown=0;          
            if (data == ' ') { params.tek4010.beam=0; } // BEAM OFF
            else if (data == 'P') { 
                if (params.tek4010.beam==0) pendown=1; 
                params.tek4010.beam=1; 
            } // BEAM ON
            else if (data == 'D') { dx= 0; dy=-1;} // move N
            else if (data == 'E') { dx= 1; dy=-1;} // move NE
            else if (data == 'A') { dx= 1; dy= 0;} // move E
            else if (data == 'I') { dx= 1; dy= 1;} // move SE
            else if (data == 'H') { dx= 0; dy= 1;} // move S
            else if (data == 'J') { dx=-1; dy= 1;} // move SW
            else if (data == 'B') { dx=-1; dy= 0;} // move W
            else if (data == 'F') { dx=-1; dy=-1;} // move NW
            else if (log) log->OutLog("\nTek4010: Invalid incremental plot char\n");
            x=params.tek4010.gr_x_pos + dx; 
            y=params.tek4010.gr_y_pos + dy; 
            if (x<0) x=0; if (x>=1024) x=1024-1; 
            if (y<0) y=0; if (y>=780) x=780-1; 
            if ((dx==0) && (dy==0)) {
                // no plot increment (pen command or invalid direction) -> does nothing
            } else if (pendown) {
                // point at x,y
                DrawPoint_GrOverlay(x, y, (TEK_DECAY << 16), 1024, 780);
            } else if (params.tek4010.beam) {
                // line to x,y
                DrawVector_GrOverlay(params.tek4010.gr_x_pos, params.tek4010.gr_y_pos, 
                                     (TEK_DECAY << 16), x, y, 1024, 780);
            }
            // make new point received the current graphic position
            params.tek4010.gr_x_pos = x; 
            params.tek4010.gr_y_pos = y;             
  		    buffer_ptr = 0;
        } else if ((params.tek4010.mode==2) || (params.tek4010.mode==3)) {
            // receive characters in graphic mode
            //   HiY (X 0 1 y9 y8 y7 y6 y5)
            //   LoY (X 1 1 y4 y3 y2 y1 y0)
            //   HiX (X 0 1 x9 x8 x7 x6 x5)
            //   LoX (X 1 0 x4 x3 x2 x1 x0)
            //   HiY ... US
            int data = buffer[0] & 0x1f; 
            int c = (buffer[0] >> 5) & 3; 
            if (c==1) { // Hi part of coord
                if (params.tek4010.Hi) { // where to store hi byte received. 0-> y, 1->x; 
                    params.tek4010.HiX=data; 
                } else {
                    params.tek4010.HiY=data; 
                }
            } else if (c==3) { // Lo part of y coord
                params.tek4010.LoY=data; 
                params.tek4010.Hi=1; // where to store hi byte received. 0-> y, 1->x; Reset to expect HiY again
            } else if (c==2) { // Lo part of x coord and trigger opperation
                // original tek coords have origin 0,0 in lower left corner, ranges 1024x780
                // coords in program have origin 0,0 in UPPER left corner, ranges 1024x780
                params.tek4010.recv_x=(data & 31) + (params.tek4010.HiX << 5); 
                params.tek4010.recv_y=(params.tek4010.LoY & 31) + (params.tek4010.HiY << 5); 
                params.tek4010.recv_y=780-1-params.tek4010.recv_y;
                params.tek4010.Hi=0; // where to store hi byte received. 0-> y, 1->x; Reset to expect HiY again
                if (params.tek4010.recv_x < 0) params.tek4010.recv_x=0; 
                if (params.tek4010.recv_x >= 1024) params.tek4010.recv_x = 1024-1; 
                if (params.tek4010.recv_y < 0) params.tek4010.recv_y=0; 
                if (params.tek4010.recv_y >= 780) params.tek4010.recv_y = 780-1; 
                if (params.tek4010.DarkMode) {
                    // set to 1 on entering graph mode so first vector is not draw 
                    // allows to position gr cursor at its desired draw start coord
                    params.tek4010.DarkMode=0; // clear dark mode. Next coord will draw a vector
                    if (log) {
                        char slog[100];
                        sprintf_s(slog, "\nTek4010: Graphic Mode: Set Gr Cursor at x=%d,y=%d \n", 
                            params.tek4010.recv_x, params.tek4010.recv_y);
                        log->OutLog(slog);
                    }
                } else if ((params.tek4010.mode==3) || // point mode
                    ((params.tek4010.gr_x_pos == params.tek4010.recv_x) && 
                     (params.tek4010.gr_y_pos == params.tek4010.recv_y))) {
                     // point mode if zero length vector -> draw a point
                    DrawPoint_GrOverlay(params.tek4010.recv_x, params.tek4010.recv_y,
                                        (TEK_DECAY << 16), 1024, 780);
                    if (log) {
                        char slog[100];
                        sprintf_s(slog, "\nTek4010: Graphic Mode: Point x=%d,y=%d \n", 
                            params.tek4010.recv_x, params.tek4010.recv_y);
                        log->OutLog(slog);
                    }
                } else {
                    int attrib; 
                    if (params.RG512.enabled) {
                        // RG512 has no patterns, but support erasing (attrib = 16) or xoring (attrib=32)
                        attrib = (params.RG512.DrawMode << 4);
                    } else {
                        // Tek4010 cannot erasing/xor but support line patterns 
                        attrib = params.tek4010.Pattern & 7; 
                    }
                    DrawVector_GrOverlay(params.tek4010.gr_x_pos, params.tek4010.gr_y_pos, 
                                         params.tek4010.recv_x, params.tek4010.recv_y, 
                                         (TEK_DECAY << 16) | attrib, 
                                         1024, 780);
                    if (log) {
                        char slog[100];
                        sprintf_s(slog, "\nTek4010: Graphic Vector: x0=%d,y0=%d x1=%d,y1=%d (attrib %d)\n", 
                            params.tek4010.gr_x_pos, params.tek4010.gr_y_pos, 
                            params.tek4010.recv_x, params.tek4010.recv_y, attrib);
                        log->OutLog(slog);
                    }
                }
                // make new point received the current graphic position
                params.tek4010.gr_x_pos = params.tek4010.recv_x; 
                params.tek4010.gr_y_pos = params.tek4010.recv_y; 
            } else {
				if(log) log->OutLog("\nTek4010: unknown char in graphic mode: ignored\n");
            }
  		    buffer_ptr = 0;
        } else {
            // non graphic mode -> regular ascii chars
            int data = buffer[0]; 
            if (data==9) data=32; // TAB = VT is handled as space
            if (data < 32) {
				if(log) log->OutLog("\nTek4010: unknown control char: ignored\n");
            } else if (params.tek4010.ByPassMode) {
                // bypass mode activated
            } else {
                // log char to be sent to screen
                if(screen_log) screen_log->OutLogByte(data);
                // draw a char. gr pos is lower left corner of char
                int y = params.tek4010.gr_y_pos - (tekfonth-1); if (y<0) y=0;
                DrawChar_GrOverlay(params.tek4010.gr_x_pos, y,
                    0,data, params.tek4010.CharSize, 1024, 780);
                // advance cursor
                params.tek4010.gr_x_pos += tekfontw; 
                if (params.tek4010.gr_x_pos >= 1024) { // reached end of line 
                    params.tek4010.gr_y_pos += tekfonth; // down one line
                    if (params.tek4010.gr_y_pos >= 780) {// reached end of screen
                        params.tek4010.margin=1-params.tek4010.margin; // toggle margin
                        params.tek4010.gr_y_pos = tekfonth-1; // start on top of new margin
                    }
                    params.tek4010.gr_x_pos = (params.tek4010.margin) ? 512: 0; 
                }
            }
   		    buffer_ptr = 0;
        }
    }


	else if((buffer[0] == 0x08) && (terminal_type == CRT_VT100)) {
		// BACKSPACE
        ExecCtrlSeqAction(CON_BACKSPACE,0,0,0);
		buffer_ptr = 0;
	}
	else if((buffer[0] == 0x0f) && (terminal_type == CRT_VT100) && (terminal_subtype == VT100_ANSI)) {
		// Shift Out -> select charset G0
        params.vt100_current_charset=0; 
		buffer_ptr = 0;
		if(log) log->OutLog("\nANSI: Select charset G0\n");
	}
	else if((buffer[0] == 0x0e) && (terminal_type == CRT_VT100) && (terminal_subtype == VT100_ANSI)) {
		// Shift In -> select charset G1
        params.vt100_current_charset=1; 
		buffer_ptr = 0;
		if(log) log->OutLog("\nANSI: Select charset G1\n");
	}
	else if(buffer[0] == 0x09) {
		// tab
		params.current_x_pos = (int)((params.current_x_pos + CONS_TABS) / CONS_TABS) * CONS_TABS;
		if(params.current_x_pos >= screen_x_size) {
			params.current_x_pos = 0;
			if(++params.current_y_pos >= screen_y_size) {
				ScrollScreen(1);
				params.current_y_pos = screen_y_size - 1;
			}
		}
		buffer_ptr = 0;
		if(log) log->OutLog("\nPRINT CHR(9) ^I TAB\n");
		if(screen_log) screen_log->OutLogByte(buffer[0]);
	}
	else if(buffer[0] == 0x0a) {
		// Line Feed
		if(++params.current_y_pos >= screen_y_size) {
			ScrollScreen(1);
			params.current_y_pos = screen_y_size - 1;
		}
		buffer_ptr = 0;
		if(screen_log) {
			screen_log->OutLogByte(13);
			screen_log->OutLogByte(10);
		}
	}
	else if(buffer[0] == 0x0d) {
		// Carriadge return
		params.current_x_pos = 0;
		buffer_ptr = 0;
	}
	else if((buffer[0] == 0x08) && 
        ((terminal_type == CRT_KAYPRO) || 
         (terminal_type == CRT_OSBORNE) || (terminal_type == CRT_VIO) )) {
		//Kaypro/Osborne: ^H -> cursor left
        ExecCtrlSeqAction(CON_LEFT,0,0,0);
		buffer_ptr = 0;
	}
	else if((buffer[0] == 0x0c) && 
        ((terminal_type == CRT_KAYPRO) || 
         (terminal_type == CRT_OSBORNE) || (terminal_type == CRT_VIO) )) {
		//Kaypro/Osborne/VIO: ^L -> cursor right
        ExecCtrlSeqAction(CON_RIGHT,0,0,0);
		buffer_ptr = 0;
	}
	else if((buffer[0] == 0x0a) && (terminal_type == CRT_KAYPRO)) {
		//Kaypro: ^J -> cursor down
        ExecCtrlSeqAction(CON_DOWN,0,0,0);
		buffer_ptr = 0;
	}
	else if((buffer[0] == 0x16) && (terminal_type == CRT_OSBORNE)) {
		//Osborne: ^V -> cursor down
        ExecCtrlSeqAction(CON_DOWN,0,0,0);
		buffer_ptr = 0;
	}
	else if((buffer[0] == 0x0b) && 
        ((terminal_type == CRT_KAYPRO) || 
         (terminal_type == CRT_OSBORNE) || (terminal_type == CRT_VIO) )) {
		//Kaypro/Osborne/VIO: ^K -> cursor up
        ExecCtrlSeqAction(CON_UP,0,0,0);
		buffer_ptr = 0;
	}
	else if((buffer[0] == 0x17) && (terminal_type == CRT_KAYPRO)) {
		// Kaypro. ^W -> erase to end of screen
        ExecCtrlSeqAction(CON_EOS,0,0,0);
		buffer_ptr = 0;
	}
	else if((buffer[0] == 0x18) && (terminal_type == CRT_KAYPRO)) {
		// Kaypro. ^X -> erase to end of line
        ExecCtrlSeqAction(CON_EOL,0,0,0);
		buffer_ptr = 0;
	}
	else if((buffer[0] == 0x1a) && 
            (terminal_type == CRT_TERM125)) {
        // WaveMate terminal-125: ^Z clear screen and set screen in normal (non-inverted) mode
        params.inverted_screen = 0;
        RequestRefreshScreen(true); // request a full redraw to update inverted screen state
		ExecCtrlSeqAction(CON_CLS,0,0,0);
		buffer_ptr = 0;
    }
	else if(buffer[0] == 0x1a) {
		// ^Z clear screen
		ExecCtrlSeqAction(CON_CLS,0,0,0);
		buffer_ptr = 0;
	}
	else if((buffer[0] == 0x1c) && 
            (terminal_type == CRT_TERM125)) {
        // WaveMate terminal-125: ^ backslash clear screen and set screen inverted mode
        params.inverted_screen = 1;
        RequestRefreshScreen(true); // request a full redraw to update inverted screen state
		ExecCtrlSeqAction(CON_CLS,0,0,0);
		buffer_ptr = 0;
    }
	else if((buffer[0] == 0x1e) && 
            ((terminal_type == CRT_KAYPRO) || (terminal_type == CRT_TERM125) ||
            (terminal_type == CRT_OSBORNE) || (terminal_type == CRT_VIO) )) {
		//Kaypro/Osborne/imsai vio: ^^ -> home
		ExecCtrlSeqAction(CON_HOME,0,0,0);
		buffer_ptr = 0;
	}
	else if((buffer[0] == 0x04) && (terminal_type == CRT_VIO)) {
		//imsai vio: ^D -> delete line and move cursor to beggining of line
		ExecCtrlSeqAction(CON_DEL_LIN,0,0,0);
        params.current_x_pos = 0;
		buffer_ptr = 0;
	}
	else if((buffer[0] == 0x05) && (terminal_type == CRT_VIO)) {
		//imsai vio: ^E -> enter line (insert line) and move cursor to beggining of line
		ExecCtrlSeqAction(CON_INS_LIN,0,0,0);
        params.current_x_pos = 0;
		buffer_ptr = 0;
	}
	else if ((buffer[0] == 0x1b) && (terminal_type == CRT_KAYPRO)) {
		// Terminal type = KayPro/ADM-3A: Esc
		
		if ((buffer_ptr > 1) && ((buffer[1] == 'L') || (buffer[1] == 'D'))) {
			if (buffer_ptr == 6) {
				// KayPro: ESC L y1 x1 y2 x2: plot pixel line: 
				// KayPro: ESC D y1 x1 y2 x2: unplot pixel line: 
				// get coordinates
				int x1 = buffer[3] - 31;
				if (x1 < 0) x1 = 0; if (x1 >= 160) x1 = 160-1;
				int y1 = buffer[2] - 31;
				if (y1 < 0) y1 = 0; if (y1 >= 100) y1 = 100-1;
				int x2 = buffer[5] - 31;
				if (x2 < 0) x2 = 0; if (x2 >= 160) x2 = 160-1;
				int y2 = buffer[4] - 31;
				if (y2 < 0) y2 = 0; if (y2 >= 100) y2 = 100-1;
				if (buffer[1] == 'L') {
					PlotPixelLine(x1,y1,x2,y2,1);
   					if(log) {
						sprintf_s(logstring, "\nKaypro: ESC L yxyx: Plot Pixel Line: X1=%d, Y1=%d, X2=%d, Y2=%d\n", x1, y1, x2, y2);
						log->OutLog(logstring);
					}
				} else {
					PlotPixelLine(x1,y1,x2,y2,0);
   					if(log) {
						sprintf_s(logstring, "\nKaypro: ESC D yxyx: UnPlot Pixel Line: X1=%d, Y1=%d, X2=%d, Y2=%d\n", x1, y1, x2, y2);
						log->OutLog(logstring);
					}
				}
				buffer_ptr = 0;
			}
		}
		else if (buffer_ptr == 4) {
			if(buffer[1] == '=') {
				// KayPro: cursor pos: ESC = y+32 x+32
				// cursor can go to status line (line 25)
                ExecCtrlSeqAction(CON_POS_YX, 32, buffer[2], buffer[3]); 
			}
			else if((buffer[1] == '*') || (buffer[1] == ' ')) {
				// KayPro: plot pixel: ESC * y x
				// KayPro: unplot pixel: ESC <space> y x
				// get xy coordinates
				int x = buffer[3] - 32;
				if (x < 0) x = 0; if (x >= 160) x = 160-1;
				int y = buffer[2] - 32;
				if (y < 0) y = 0; if (y >= 100) y = 100-1;
				if (buffer[1] == '*') {
					PlotPixel(x,y,1);
   					if(log) {
						sprintf_s(logstring, "\nKaypro: ESC * yx: Plot Pixel Pos: X=%d, Y=%d\n", x, y);
						log->OutLog(logstring);
					}
				} else {
					PlotPixel(x,y,0);
   					if(log) {
						sprintf_s(logstring, "\nKaypro: ESC <space> yx: UnPlot Pixel Pos: X=%d, Y=%d\n", x, y);
						log->OutLog(logstring);
					}
				}
			}
			else {
				if(log) log->OutLog("\nKayPro: ESC x y z: unknown Escape sequence: ignored\n");
			}
			buffer_ptr = 0;
		}
		if ((buffer_ptr == 3) && ((buffer[1] == 'B') || (buffer[1] == 'C'))) {
			// Terminal type = KayPro: Attributes
			if((buffer[1] == 'B' || buffer[1] == 'C') && buffer[2] == '0') {
				if (buffer[1] == 'B') {
					current_attrib |= 1; // Set Reverse
				} else {
					current_attrib &= ~1; // reset
				}
   				if(log) log->OutLog("\nKaypro: ESC B|C0: Set Reverse\n");
			}
			else if((buffer[1] == 'B' || buffer[1] == 'C') && buffer[2] == '1') {
				if (buffer[1] == 'B') {
					current_attrib |= 4; // Set bright
				} else {
					current_attrib &= ~4; // Reset
				}
	   			if(log) log->OutLog("\nKaypro: ESC B|C1: Set Bright\n");
			}
			else if((buffer[1] == 'B' || buffer[1] == 'C') && buffer[2] == '2') {
				if (buffer[1] == 'B') {
					current_attrib |= 8; // Set Blink
				} else {
					current_attrib &= ~8; // Reset
				}
   				if(log) log->OutLog("\nKaypro: ESC B|C2: Set Blink\n");
			}
			else if((buffer[1] == 'B' || buffer[1] == 'C') && buffer[2] == '3') {
				if (buffer[1] == 'B') {
					current_attrib |= 2; // Set Underscore
				} else {
					current_attrib &= ~2; // Reset
				}
   				if(log) log->OutLog("\nKaypro: ESC B|C3: Set Underscore\n");
			}
			else if((buffer[1] == 'B' || buffer[1] == 'C') && buffer[2] == '4') {
				if (buffer[1] == 'B') {
					params.cursor_visible = 1; // Set
				} else {
					params.cursor_visible = 0; // Reset
				}
				if(log) log->OutLog("\nKaypro: ESC B|C4: Cursor visible/invisible\n");
			}
			else if((buffer[1] == 'B' || buffer[1] == 'C') && buffer[2] == '5') {
				// NOT Implemented
				if(log) log->OutLog("\nKaypro: ESC B|C5: Not implemented: Video mode on/off\n");
			}
			else if((buffer[1] == 'B' || buffer[1] == 'C') && buffer[2] == '6') {
                // Kaypro: ESC B|C6: Remember/recover cursor position
				if (buffer[1] == 'B') {
					// Remember
					ExecCtrlSeqAction(CON_CUR_SAVE,0,0,0); 
				} else {
					// Recover
					ExecCtrlSeqAction(CON_CUR_RESTORE,0,0,0); 
				}
			}
			else if((buffer[1] == 'B' || buffer[1] == 'C') && buffer[2] == '7') {
				// NOT Implemented
				if(log) log->OutLog("\nKaypro: ESC B|C7: Not implemented: Status line preservation on/off\n");
			}
			else {
				if(log) log->OutLog("\nKaypro: ESC unknown Escape sequence: ignored\n");
			}
			buffer_ptr = 0;
		}
		if ((buffer_ptr == 2) && 
			((buffer[1] == 'E') || (buffer[1] == 'R') ||
			 (buffer[1] == 'A') || (buffer[1] == 'G'))) {
			// Terminal type = KayPro: Ins/Del line
			if(buffer[1] == 'E') {
				ExecCtrlSeqAction(CON_INS_LIN,0,0,0);
			}
			else if(buffer[1] == 'R') {
				ExecCtrlSeqAction(CON_DEL_LIN,0,0,0);
			}
			else if(buffer[1] == 'A') {
   				if(log) log->OutLog("\nKaypro: ESC A: Set normal charset (not implemented)\n");
			}
			else if(buffer[1] == 'G') {
   				if(log) log->OutLog("\nKaypro: ESC G: Set Greek charset (not implemented)\n");
			}
			else {
				if(log) log->OutLog("\nKaypro: Unknown Escape sequence: ignored\n");
			}
			buffer_ptr = 0;
		}
	}
	else if ((buffer[0] == 0x1b)  && (terminal_type == CRT_VT100)) {
		last_code = buffer[buffer_ptr - 1];
		
		if((buffer[1] == 12 ) && buffer_ptr == 2) {
			// VT-52: ESC ^L: clear screen
			ExecCtrlSeqAction(CON_CLS,0,0,0); 
			buffer_ptr = 0;
		}
		else if((buffer[1] == '(' || buffer[1] == '<' || buffer[1] == 'q') && (buffer_ptr == 2) && (terminal_subtype != VT100_ANSI )) {
			// VT-52/H-19, ESC (, ESC <, ESC q
			current_attrib &= ~1;
			buffer_ptr = 0;
			if(log) log->OutLog("\nVT-52: ESC (, ESC <, ESC q: Reset Reverse\n");
		}
        else if((buffer[1] == ')' || buffer[1] == '>' || buffer[1] == 'p') && (buffer_ptr == 2) && (terminal_subtype != VT100_ANSI )) {
			// VT-52/H-19, ESC ), ESC >, ESC p
			current_attrib |= 1;
			buffer_ptr = 0;
			if(log) log->OutLog("\nVT-52: ESC ), ESC >, ESC p: Set Reverse\n");
		}
		else if(buffer[1] == '*' && (buffer_ptr == 2) && (terminal_subtype == 0 )) {
			// VT-52, ESC *
			ExecCtrlSeqAction(CON_CLS,0,0,0); 
			buffer_ptr = 0;
		}
		else if(buffer[1] == 'E' && buffer_ptr == 2) {
			// VT-52, ESC E
            terminal_subtype = 0; // ESC E is not ANSI
			ExecCtrlSeqAction(CON_CLS,0,0,0); 
			buffer_ptr = 0;
		}
		else if(buffer[1] == '<' && buffer_ptr == 2) {
			// VT-52, ESC <
            if(log) log->OutLog("\nVT-52: ESC <: Toggle VT-52/ANSI mode: ignored\n");
			buffer_ptr = 0;
		}
		else if(buffer[1] == '=' && buffer_ptr == 4) {
			// ANSI: ESC = y+32 x+32
            ExecCtrlSeqAction(CON_POS_YX, 32, buffer[2], buffer[3]); 
			buffer_ptr = 0;
		}
		else if(buffer[1] == 'Y' && buffer_ptr == 4) {
			// VT-52, ESC Y y+32 x+32
            ExecCtrlSeqAction(CON_POS_YX, 32, buffer[2], buffer[3]); 
			buffer_ptr = 0;
		}
		else if((buffer[1] == 'x') && buffer_ptr == 3) {
			// H-19, ESC x   -> Set Modes. Only mode 5 is implemented
            terminal_subtype = VT100_H19;
            if (buffer[2]=='5') {
			    params.cursor_visible = 0; 
			    if(log) log->OutLog("\nH-19: ESC x 5: Cursor off\n");
            } else if (buffer[2]=='1') {
			    if(log) log->OutLog("\nH-19: ESC x 1: Enable 25th line: ignored\n");
            } else {
			    if(log) {
                    sprintf_s(logstring, "\nH-19: ESC x %c: Unimplemented Set Mode \n", buffer[2]);
	    			log->OutLog(logstring);
    			}
            }
    	    buffer_ptr = 0;
		}
		else if((buffer[1] == 'y') && buffer_ptr == 3) {
			// H-19, ESC y   -> Reset Modes. Only mode 5 is implemented
            terminal_subtype = VT100_H19;
            if (buffer[2]=='5') {
			    params.cursor_visible = 1; 
			    if(log) log->OutLog("\nH-19: ESC y 5: Cursor on\n");
            } else {
			    if(log) {
                    sprintf_s(logstring, "\nH-19: ESC y %c: Unimplemented Reset Mode \n", buffer[2]);
	    			log->OutLog(logstring);
    			}
            }
    	    buffer_ptr = 0;
		}
		else if((buffer[1] == 'e') && buffer_ptr == 2) {
			// VT-52, ESC e -> Enable Cursor
			ExecCtrlSeqAction(CON_CUR_ON,0,0,0);
			buffer_ptr = 0;
		}
		else if((buffer[1] == 'f') && buffer_ptr == 2) {
			// VT-52, ESC f -> Disable Cursor
			ExecCtrlSeqAction(CON_CUR_OFF,0,0,0);
			buffer_ptr = 0;
		}
		else if((buffer[1] == 'j') && buffer_ptr == 2) {
			// VT-52, ESC j
            ExecCtrlSeqAction(CON_CUR_SAVE,0,0,0);
			buffer_ptr = 0;
		}
		else if((buffer[1] == 'k') && buffer_ptr == 2) {
			// VT-52, ESC k
            ExecCtrlSeqAction(CON_CUR_RESTORE,0,0,0);
			buffer_ptr = 0;
		}
		else if('0' <= buffer[1] && buffer[1] <= '9' && buffer_ptr == 2) {
			// VT-52, Key Pad ?
			buffer_ptr = 0;
			if(log) log->OutLog("\nVT-52: KeyPad: ignored\n");
		}
        else if( (buffer[1] == '#') && (buffer_ptr == 3))  {
            // VT100: ESC # n -> double height/width chars not implemented
			buffer_ptr = 0;
            if(log) log->OutLog("\nVT100: double height/width chars not implemented\n");
        }
		else if( ((buffer[1] == '(') || (buffer[1] == ')')) && (buffer_ptr == 3))  {
            // VT100: select character sets
            //        ESC ) A  or  ESC ) B  or  ESC ( B  or  ESC ( B  -> select UK/US charater set -> exit graphic charset
            //        ESC ) 0  or  ESC ( 0  -> select special charater set -> enter graphic charset
            buffer_ptr = 0;
            if (buffer[1] == '(') {
                params.vt100_current_charset=0; // ESC ( sets G0 charset
            } else {
                params.vt100_current_charset=1; // ESC ) sets G1 charset
            }
            if (buffer[2]=='0') {
                params.vt100_charset[params.vt100_current_charset]=VT100_gr_mode; 
                if(log) log->OutLog("\nVT100: select DEC Special Graphics charset\n");
            } else {
                params.vt100_charset[params.vt100_current_charset]=0; 
                if(log) log->OutLog("\nVT100: select DEC normal charset\n");
            }
        }
		else if(buffer[1] == '[' && (('a' <= last_code && last_code <= 'z') || ('A' <= last_code && last_code <= 'Z'))) {
			// ANSI
			int vals[32];
			memset(vals, 0, sizeof(vals));
			int cnt = ReadEscSeq(buffer + 2, vals);
            terminal_subtype=VT100_ANSI;
			if(last_code == 'H' || last_code == 'f') {
                // ANSI: ESC [ y;x H|f: Set Cursor Pos (Home is pos 1,1)
                ExecCtrlSeqAction(CON_POS_YX, 1, vals[0], vals[1]); 
			}
			else if(last_code == 'A') {
				// ANSI: ESC [ n A: Cursor Up n lines. 
                ExecCtrlSeqAction(CON_UP, vals[0], 0, 0); 
			}
			else if(last_code == 'B') {
                // ANSI: ESC [ n B: Cursor Down n lines
                ExecCtrlSeqAction(CON_DOWN, vals[0], 0, 0); 
			}
			else if(last_code == 'C') {
                // ANSI: ESC [ n C: Forward n cols
                ExecCtrlSeqAction(CON_RIGHT, vals[0], 0, 0); 
			}
			else if(last_code == 'D') {
				// ANSI: ESC [ n D: Back n cols. 
                ExecCtrlSeqAction(CON_LEFT, vals[0], 0, 0); 
			}
			else if(last_code == 's') {
				// ANSI: ESC [ s: Save Cursor pos
				ExecCtrlSeqAction(CON_CUR_SAVE,0,0,0); 
			}
			else if(last_code == 'u') {
				// ANSI: ESC [ u: Restore Cursor pos
				ExecCtrlSeqAction(CON_CUR_RESTORE,0,0,0); 
			}
			else if((last_code == 'n') && (vals[0] == 6)){
				// ANSI: ESC [ 6 n: report cursor pos as ESC [ lin;col R
				ExecCtrlSeqAction(CON_CUR_REPORT,0,0,0); 
			}
			else if(last_code == 'J') {
				// ESC[ n J
				if (cnt == 0) vals[0] = 0;
				if (vals[0] == 0) {
                    ExecCtrlSeqAction(CON_EOS,0,0,0); 
					// ANSI: ESC [ 0 J: Erase from current pos to the bottom of the screen
				} else if (vals[0] == 1) {
					for(int i = 0; i <= params.current_x_pos; i++) {
						params.char_plane[params.current_y_pos][i] = 0;
						params.attrib_plane[params.current_y_pos][i] = 0;
						params.color_plane[params.current_y_pos][i] = 0;
					}
					for(int j = 0; j < params.current_y_pos; j++) {
						for(int i = 0; i < screen_x_size; i++) {
							params.char_plane[j][i] = 0;
							params.attrib_plane[j][i] = 0;
							params.color_plane[j][i] = 0;
						}
					}
					if(log) log->OutLog("\nANSI: ESC [ 1 J: Erase from beggining of screen up to current pos\n");

				} else if (vals[0] == 2) {
					ExecCtrlSeqAction(CON_CLS,0,0,0); 
					// ANSI: ESC [ 2 J: Clear Screen and Home
				} else {
					if(log) log->OutLog("\nANSI: ESC [ n J: unknown Clear mode. Ignored\n");
				}
			}
			else if(last_code == 'M') {
				// ESC[ n M: Delete n lines
				if (cnt == 0) vals[0] = 1;
                ExecCtrlSeqAction(CON_DEL_LIN,vals[0],0,0); 
			}
			else if(last_code == 'L') {
				// ESC[ n L: Insert n lines
				if (cnt == 0) vals[0] = 1;
                ExecCtrlSeqAction(CON_INS_LIN,vals[0],0,0); 
			}
			else if(last_code == 'r') {
				// ESC [ n;m r   set scroll region
                if (cnt == 0) {
                    memset(params.locked_lines, 0, sizeof(params.locked_lines)); // enable scrolling for entire display
                    if(log) log->OutLog("\nANSI: ESC [ r: set scroll entire display\n");
                } else {
                    // note that line number for param n/m starts at 1. So ESC [ 1;25 r is the whole screen
                    // scrolls zone includes line n and line m
                    // n should be < to m
                    int ln0, ln1;
                    ln0=vals[0]-1; ln1=vals[1]-1; 
                    if (ln0 < 0) ln0=0; 
                    if (ln1 < 0) ln1=0; 
                    if (ln0 > screen_y_size) ln0=screen_y_size; 
                    if (ln1 > screen_y_size) ln1=screen_y_size; 
                    memset(params.locked_lines, 0, sizeof(params.locked_lines)); // enable scrolling for entire display
                    for (int j=0; j<ln0; j++) params.locked_lines[j]=1; // mark top lines as locked
                    for (int j=ln1; j<CONS_Y_MAX; j++) params.locked_lines[j]=1; // mark bottom lines as locked
                    if (log) {
                        char sLog[200];
                        sprintf_s(sLog, "\nANSI: ESC [ n;m r: set scroll region lines %d to %d \n", ln0, ln1);
                        log->OutLog(sLog);
                    }    		        
                }
			}
			else if(last_code == 'S') {
				// ESC [ n S   scroll 
				if (cnt == 0) vals[0] = 1;
                ScrollScreen(vals[0]); 
			}
			else if(last_code == 'T') {
				// ESC [ n T   scroll reverse
				if (cnt == 0) vals[0] = 1;
                ScrollScreen(-vals[0]); 
			}
			else if(buffer[2]=='?') {
                if ((buffer[3]=='4') && (buffer[4]=='h')) {
                    if(log) log->OutLog("\nANSI: ESC [ ? 4 h: Set smooth scrolling: ignored\n");
                } else if ((buffer[3]=='4') && (buffer[4]=='l')) {
                    if(log) log->OutLog("\nANSI: ESC [ ? 4 l: Set normal scrolling: ignored\n");
                } else if ((buffer[3]=='2') && (buffer[4]=='5') && (buffer[5]=='h')) {
           			ExecCtrlSeqAction(CON_CUR_ON,0,0,0);
                } else if ((buffer[3]=='2') && (buffer[4]=='5') && (buffer[5]=='l')) {
                    ExecCtrlSeqAction(CON_CUR_OFF,0,0,0);
                } else if ((buffer[3]=='5') && (buffer[4]=='l')) {
                    if(log) log->OutLog("\nANSI: ESC [ ? 5 l: Set normal non-inverted video: ignored\n");
                } else if ((buffer[3]=='5') && (buffer[4]=='h')) {
                    if(log) log->OutLog("\nANSI: ESC [ ? 5 h: Set inverted screen: ignored\n");
                } else if ((buffer[3]=='3') && (buffer[4]=='l')) {
                    if(log) log->OutLog("\nANSI: ESC [ ? 3 l: Set 80 columns mode: ignored\n");
                } else if ((buffer[3]=='3') && (buffer[4]=='h')) {
                    if(log) log->OutLog("\nANSI: ESC [ ? 3 h: Set 132 columns mode: ignored\n");
                } else if ((buffer[3]=='6') && (buffer[4]=='l')) {
                    if(log) log->OutLog("\nANSI: ESC [ ? 6 l: Set origin relative: ignored\n");
                } else if ((buffer[3]=='6') && (buffer[4]=='h')) {
                    if(log) log->OutLog("\nANSI: ESC [ ? 6 h: Set origine absolute: ignored\n");
                } else if ((buffer[3]=='7') && (buffer[4]=='l')) {
                    params.discard_at_eol=1;
                    if(log) log->OutLog("\nANSI: ESC [ ? 7 l: Set Wraparround off\n");
                } else if ((buffer[3]=='7') && (buffer[4]=='h')) {
                    params.discard_at_eol=0;
                    if(log) log->OutLog("\nANSI: ESC [ ? 7 h: Set Wraparround on\n");
                }
            } else if(last_code == 'K') {
				// ESC[ n K
				if (cnt == 0) {
				   vals[0] = 0;
				}
				if (vals[0] == 0) {
                    // ANSI: ESC [ 0 K: Erases from the current cursor position to the end of the current line
                    ExecCtrlSeqAction(CON_EOL,0,0,0); 
				} else if (vals[0] == 1) {
					for(int i = 0; i <= params.current_x_pos; i++) {
						params.char_plane[params.current_y_pos][i] = 0;
						params.attrib_plane[params.current_y_pos][i] = 0;
						params.color_plane[params.current_y_pos][i] = 0;
					}
					if(log) log->OutLog("\nANSI: ESC [ 1 K: Erases from start of current line to the current cursor position \n");
				} else if (vals[0] == 2) {
                    // ANSI: ESC [ 2 K: Erases entire current line
                    ExecCtrlSeqAction(CON_EEL,0,0,0); 
				} else {
					if(log) log->OutLog("\nANSI: ESC [ n K: unknown Erase line mode. Ignored\n");
				}
			}
			else if(last_code == 'm') {
				// ESC[Ps;...;Psm
				if (cnt == 0) {
					current_attrib = 0;
					if(log) log->OutLog("\nANSI: ESC [ m: Reset Attributes\n");
				}
				for(int i = 0; i < cnt; i++) {
					if(vals[i] == 0) { 
						current_attrib = 0;
						if(log) log->OutLog("\nANSI: ESC [ 0 m: Reset Attributes\n");
					} else if(vals[i] == 1) { 
						// set bright/underscore attribute
						current_attrib |= 4;
						if(log) log->OutLog("\nANSI: ESC [ 1 m: Set Bright\n");
					} else if(vals[i] == 4) { 
						current_attrib |= 2;
						if(log) log->OutLog("\nANSI: ESC [ 4 m: Set Underscore\n");
					} else if(vals[i] == 5) { 
						current_attrib |= 8;
						if(log) log->OutLog("\nANSI: ESC [ 5 m: Set Blink\n");
					} else if(vals[i] == 7) { 
						current_attrib |= 1;
						if(log) log->OutLog("\nANSI: ESC [ 7 m: Set Reverse\n");
					} else if(30 <= vals[i] && vals[i] <= 37) {
						vals[i] -= 30;
                        current_attrib |= 128; // set bit7 to render char in color
						current_color =(current_color & 0xf0) | ((vals[i] & 1) ? 0x04 : 0) | ((vals[i] & 2) ? 0x02 : 0) | ((vals[i] & 4) ? 0x01 : 0);
						if(log) log->OutLog("\nANSI: ESC [ 30..37 m: Set Color\n");
					} else if(40 <= vals[i] && vals[i] <= 47) {
						vals[i] -= 40;
                        current_attrib |= 128; // set bit7 to render char in color
						current_color = (current_color & 0x0f) | ((vals[i] & 1) ? 0x40 : 0) | ((vals[i] & 2) ? 0x20 : 0) | ((vals[i] & 4) ? 0x10 : 0);
						if(log) log->OutLog("\nANSI: ESC [ 40..47 m: Set Background Color\n");
					} else {
						if(log) log->OutLog("\nANSI: ESC [ n m: unknown Attribute: ignored\n");
					}
				}
			} else {
				if(log) log->OutLog("\nANSI: ESC [ aA-zZ: unknown Escape sequence: ignored\n");
			}
			buffer_ptr = 0;
		}
		else if(buffer[1] != '[' && last_code != 'Y' && last_code != '=' && last_code != 'x' && last_code != 'y' && 
               (('a' <= last_code && last_code <= 'z') || ('A' <= last_code && last_code <= 'Z'))) {
			// VT-52
			if(last_code == 'A') {
				// VT-52: ESC A: Cursor Up
                ExecCtrlSeqAction(CON_UP,0,0,0);
			}
			else if(last_code == 'B') {
				// VT-52: ESC B: Cursor Down
                ExecCtrlSeqAction(CON_DOWN,0,0,0);
			}
			else if(last_code == 'C') {
				// VT-52: ESC C: Cursor Right
                ExecCtrlSeqAction(CON_RIGHT,0,0,0);
			}
			else if(last_code == 'D') {
				// VT52: ESC D Cursor Left
                ExecCtrlSeqAction(CON_LEFT,0,0,0);
			}
			else if(last_code == 'H') {
				// VT-52: ESC H: Home
                ExecCtrlSeqAction(CON_HOME,0,0,0);
			}
			else if(last_code == 'I') {
				// VT-52: ESC I: Toggle inverse video
				current_attrib = (current_attrib & 1) ? (current_attrib & 0xfe) : (current_attrib | 1);
				if(log) log->OutLog("\nVT-52: ESC I: Toggle inverse video\n");
			}
			else if(last_code == 'J') {
				// VT-52: ESC J: Erase to end of screen
                ExecCtrlSeqAction(CON_EOS,0,0,0);
			}
			else if(last_code == 'K') {
				// VT-52: ESC K: Erase to end of line
                ExecCtrlSeqAction(CON_EOL,0,0,0);
			}
			else if(last_code == 'L') {
				// H-19: ESC L: Insert line
                ExecCtrlSeqAction(CON_INS_LIN,0,0,0);
                params.current_x_pos = 0;
			}
			else if(last_code == 'M') {
                if (terminal_subtype==VT100_H19) {
				    // H-19: ESC M: Delete line
                    ExecCtrlSeqAction(CON_DEL_LIN,0,0,0);
                    params.current_x_pos = 0;
                } else {
                    // ANSI: ESC M: moves cursor one line up, scrolling if needed (takes into account scroll region)
                    // used by TeleWrite, in ANSI mode
                    // determine if lines on top of screen are locked
                    int nLin0=0; 
                    for (int j=0; j<screen_y_size; j++) {
                        if (params.locked_lines[j]==0) break;
                        nLin0++; // top of screen line locked
                    }
                    if (params.current_y_pos <= nLin0) {
                        // scroll region up
                        ScrollScreen(-1);
                        params.current_y_pos = nLin0;
                    } else {
                        params.current_y_pos--;
                    }
                    if(log) log->OutLog("\nANSI: ESC M: moves cursor one line up, scrolling if needed \n");                   
                }
			}
			else if(last_code == 'F') {
				// H-19: ESC F
                terminal_subtype = VT100_H19;
                params.graphic_mode = H19_gr_mode;
                if(log) log->OutLog("\nH-19: ESC F: Enter Graphic mode\n");
			}
			else if(last_code == 'G') {
				// H-19: ESC G
                terminal_subtype = VT100_H19;
                params.graphic_mode = 0;
                if(log) log->OutLog("\nH-19: ESC G: Exit Graphic mode\n");
            }
			else if ((last_code == 'N') && (terminal_subtype == VT100_H19)) {
				// H-19: ESC N delete char
                ExecCtrlSeqAction(CON_DEL_CHR,0,0,0);
            }
			else if ((last_code == 'l') && (terminal_subtype == VT100_H19)) {
				// H-19: ESC l erase entire line
                ExecCtrlSeqAction(CON_EEL,0,0,0);
            }
			else if ((last_code == 'o') && (terminal_subtype == VT100_H19)) {
				// H-19: ESC o erase begining of line up to (including) cursor pos
                ExecCtrlSeqAction(CON_EBL,0,0,0);
            }
			else if ((last_code == 'w') && (terminal_subtype == VT100_H19)) {
				// H-19: ESC w -> Discard at End of Line
                // last char of line (at col 79) gets overprinted instead of issuing a <CR><LF>
                params.discard_at_eol=1; 
                if(log) log->OutLog("\nH-19: ESC w: Discard at End of Line\n");
            }
			else if ((last_code == 'v') && (terminal_subtype == VT100_H19)) {
				// H-19: ESC v -> Wrap arround at End of Line
                // issue a <CR><LF> if line is full (and scroll if necessary)
                params.discard_at_eol=0; 
                if(log) log->OutLog("\nH-19: ESC v: Wrap arround at End of Line\n");
			} else {
                if (terminal_subtype == VT100_H19) {
				    if(log) log->OutLog("\nH-19: Unknown escape sequence. ignored\n");
                } else if (terminal_subtype == VT100_ANSI) {
				    if(log) log->OutLog("\nANSI: Unknown escape sequence. ignored\n");
                } else {
				    if(log) log->OutLog("\nVT-52: Unknown escape sequence. ignored\n");
                }
			}
			buffer_ptr = 0;
		}
	}
	else if ((buffer[0] == 0x1b)  && (terminal_type == CRT_OSBORNE)) {
		// Osborne 
		last_code = buffer[buffer_ptr - 1];

		if(buffer[1] == '=' && buffer_ptr == 4) {
			// Osborne: ESC = y+32 x+32: Set Cursor Pos
            ExecCtrlSeqAction(CON_POS_YX,32,buffer[2],buffer[3]);
			buffer_ptr = 0;
		}
		else if((buffer[1] == 'S') && buffer_ptr == 4) {
			// ESC S y+32 x+32: set virtual screen 52x24 top left corner position - ignored
            if(log) log->OutLog("\nOsborne: set virtual screen 52x24 left corner visible position - ignored\n");
			buffer_ptr = 0;
		}
		else if((buffer[1] == '.') && buffer_ptr == 3) {
			// ESC . n   Set cursor type
			buffer_ptr = 0;
			if (buffer[2] == '0') {
				params.cursor_visible = 0; 
			} else {
				params.cursor_visible = 1; 
			}
			if(log) log->OutLog("\nOsborne: ESC . n: Set cursor type (0=invisible)\n");
		}
		else if((buffer[1] == '[') && buffer_ptr == 2) {
			// ESC [ homes screen. Needed on Osborne 1 52 x 24 build-in display
			buffer_ptr = 0;
			if(log) log->OutLog("\nOsborne: ESC [: Homes 52x24 Screen Position (Not implemented)\n");
		}
		else if((buffer[1] == 27) && (buffer_ptr == 2) && (params.graphic_mode==Osborne_gr_mode)) {
			// print the semigraphic char 27 (not the esc char)
			buffer_ptr = 0;
			PutChar(128+27, update_flag);
		}
		else if((buffer[1] == 'g') && buffer_ptr == 2) {
			// ESC g
			params.graphic_mode = Osborne_gr_mode;
			buffer_ptr = 0;
			if(log) log->OutLog("\nOsborne: ESC g: Graphic mode On\n");
		}
		else if((buffer[1] == 'G') && buffer_ptr == 2) {
			// ESC G
			params.graphic_mode = 0;
			buffer_ptr = 0;
			if(log) log->OutLog("\nOsborne: ESC G: Graphic mode Off\n");
		}
		else if((buffer[1] == 'a') && buffer_ptr == 2) {
			// ESC a -> set alternate charset
			current_attrib |= 16;
			buffer_ptr = 0;
			if(log) log->OutLog("\nOsborne Executive: ESC a: Set Alternate CharSet\n");
		}
		else if((buffer[1] == 'A') && buffer_ptr == 2) {
			// ESC A -> set normal charset
			current_attrib &= ~16;
			buffer_ptr = 0;
			if(log) log->OutLog("\nOsborne Executive: ESC A: Set Normal CharSet\n");
		}
		else if((buffer[1] == 'T') && buffer_ptr == 2) {
			// Osborne: ESC T: erase to end of line
            ExecCtrlSeqAction(CON_EOL,0,0,0);
			buffer_ptr = 0;
		}
		else if((buffer[1] == 't') && buffer_ptr == 2) {
			// Osborne: ESC t: erase to end of line (with nulls) 
            ExecCtrlSeqAction(CON_EOL,0,0,0);
			buffer_ptr = 0;
		}
		else if((buffer[1] == 'Y') && buffer_ptr == 2) {
			// Osborne: ESC Y: Erase to end of screen
            ExecCtrlSeqAction(CON_EOS,0,0,0);
			buffer_ptr = 0;
		}
		else if((buffer[1] == 'y') && buffer_ptr == 2) {
			// Osborne: ESC y: Erase to end of screen
            ExecCtrlSeqAction(CON_EOS,0,0,0);
			buffer_ptr = 0;
		}
		else if((buffer[1] == 'Z') && buffer_ptr == 2) {
			// Osborne: ESC Z: Clear Screen
			ExecCtrlSeqAction(CON_CLS,0,0,0);
			buffer_ptr = 0;
		}
		else if((buffer[1] == 'E') && buffer_ptr == 2) {
            // Osborne: ESC E: Insert Line
			ExecCtrlSeqAction(CON_INS_LIN,0,0,0);
			buffer_ptr = 0;
		}
		else if((buffer[1] == 'R') && buffer_ptr == 2) {
            // Osborne: ESC R: Delete Line
			ExecCtrlSeqAction(CON_DEL_LIN,0,0,0);
			if(log) log->OutLog("\n\n");
			buffer_ptr = 0;
		}
		else if((buffer[1] == 'Q') && buffer_ptr == 2) {
            // Osborne: ESC Q: Insert Char
			ExecCtrlSeqAction(CON_INS_CHR,0,0,0);
			buffer_ptr = 0;
		}
		else if((buffer[1] == 'W') && buffer_ptr == 2) {
            // Osborne: ESC W: Delete Char
			ExecCtrlSeqAction(CON_DEL_CHR,0,0,0);
			buffer_ptr = 0;
		}
		else if((buffer[1] == ')') && buffer_ptr == 2) {
			current_attrib |= 4;
			buffer_ptr = 0;
			if(log) log->OutLog("\nOsborne: ESC ): Set High\n");
		}
		else if((buffer[1] == '(') && buffer_ptr == 2) {
			current_attrib &= ~4;
			buffer_ptr = 0;
			if(log) log->OutLog("\nOsborne: ESC (: ReSet High\n");
		}
		else if((buffer[1] == '^') && buffer_ptr == 2) {
			current_attrib |= 8;
			buffer_ptr = 0;
			if(log) log->OutLog("\nOsborne: ESC ^: Set Blink\n");
		}
		else if((buffer[1] == 'q') && buffer_ptr == 2) {
			current_attrib &= ~8;
			buffer_ptr = 0;
			if(log) log->OutLog("\nOsborne: ESC q: ReSet Blink\n");
		}
		else if(((buffer[1] == 'j') || (buffer[1] == 'b')) && buffer_ptr == 2) {
			current_attrib |= 1;
			buffer_ptr = 0;
			if(log) log->OutLog("\nOsborne: ESC j|b: Set Reverse\n");
		}
		else if(((buffer[1] == 'k') || (buffer[1] == 'd')) && buffer_ptr == 2) {
			current_attrib &= ~1;
			buffer_ptr = 0;
			if(log) log->OutLog("\nOsborne: ESC k|d: ReSet Reverse\n");
		}
		else if(((buffer[1] == 'l') || (buffer[1] == 'L')) && buffer_ptr == 2) {
			current_attrib |= 2;
			buffer_ptr = 0;
			if(log) log->OutLog("\nOsborne: ESC L|l: Set Underline\n");
		}
		else if(((buffer[1] == 'm') || (buffer[1] == 'M')) && buffer_ptr == 2) {
			current_attrib &= ~2;
			buffer_ptr = 0;
			if(log) log->OutLog("\nOsborne: ESC M|m: ReSet Underline\n");
		}
		else if ((buffer_ptr >= 2) && 
			     (buffer[1] != '=') && (buffer[1] != 'S') && (buffer[1] != '.')) {
			buffer_ptr = 0;
			if(log) log->OutLog("\nOsborne: Escape sequence unimplemented\n");
		}
	}
	else if ((buffer[0] == 0x1b)  && (terminal_type == CRT_VIO)) {
		// IMSAI VIO
		// ESC 1 ($1B $49) = Set/Clear Tab -> not impemented
		// ESC ^I ($1B $09) = clear all tabs -> not implemented
		// ESC S = scroll toggle mode -> not implemented
		// ESC U = uppercase/lowercase toggle -> not implemented
		// ESC L = lines per page toggle -> not implemented
		// ESC C = columns per page toggle -> not implemented

		if(buffer[1] == 'T' && buffer_ptr == 2) {
			// ESC T = ASCII text Mode: allows chars 0..127 + reverse (bit 7)
			MappedVideoMem(0, 0, 5, 2 << 2); // SET VIO Mode (this also sets for a full redraw)
			buffer_ptr = 0;
   			if(log) {
				sprintf_s(logstring, "\nVIO: ESC T: ASCII Text Mode\n");
				log->OutLog(logstring);
			}
		}
		if(buffer[1] == 'E' && buffer_ptr == 2) {
			// ESC E = Extended text Mode: allows chars 128..255 + reverse (bit 7)
			MappedVideoMem(0, 0, 5, 1 << 2); // SET VIO Mode (this also sets for a full redraw)
			buffer_ptr = 0;
   			if(log) {
				sprintf_s(logstring, "\nVIO: ESC T: Extended Text Mode\n");
				log->OutLog(logstring);
			}
		}
		if(buffer[1] == 'G' && buffer_ptr == 2) {
			// ESC G = Graphics text Mode: allows chars 0..255, no reverse 
			MappedVideoMem(0, 0, 5, 3 << 2); // SET VIO Mode (this also sets for a full redraw)
			buffer_ptr = 0;
   			if(log) {
				sprintf_s(logstring, "\nVIO: ESC G: Graphics Text Mode\n");
				log->OutLog(logstring);
			}
			// note: on real HW, when in graphics mode, control chars are not allowed
			// in this simulation, control chars are still allowed
		}
		else if((buffer[1] == 'V') && buffer_ptr == 2) {
			// ESC V = Inverse video toggle
			current_attrib ^= 1;
			buffer_ptr = 0;
			if(log) {
                sprintf_s(logstring, "\nVIO: ESC V: Inverse video toggle (now is %s)\n", (current_attrib & 1) ? "Inverse":"Normal");
				log->OutLog(logstring);
			}
		}
		if(buffer[1] == '=' && buffer_ptr == 4) {
			// VIO: ESC = y+32 x+32: Set Cursor Pos
            ExecCtrlSeqAction(CON_POS_YX,32,buffer[2],buffer[3]);
			buffer_ptr = 0;
		}
	}
	else if(buffer[0] >= 0x20) {
		// Print ascii char
		if(screen_log) screen_log->OutLogByte(buffer[0]);
		params.char_plane[params.current_y_pos][params.current_x_pos] = buffer[0];
		params.attrib_plane[params.current_y_pos][params.current_x_pos] = current_attrib;
		params.color_plane[params.current_y_pos][params.current_x_pos] = current_color;
			
        if ((params.discard_at_eol) && (params.current_x_pos >= screen_x_size - 1)) {
            // discard at end of line: if line exhasuted, do not advance cursor nor 
            // issue a <CR><LF> nor scroll. Next char will overprint 
        }
		else if((params.current_x_pos == screen_x_size - 1) && 
			(params.current_y_pos == screen_y_size - 1) &&
			(terminal_type == CRT_KAYPRO) &&
			((params.cursor_visible == 0) || 
			 (cursor_type == 0))) {
			//Special case for KayPro: do not scroll on last character if cursor not visible
		}
		else if((params.current_y_pos == screen_y_size) && (has_status_line)) {
			//Special case for KayPro: write allowed on status line
			if(params.current_x_pos < screen_x_size - 1) {
                params.current_x_pos++; // if not at end of status line, advance cursor after writting the char 
            } else {
                params.current_x_pos=0; // restart on left instead of scrolling is exceeds status line length
            }
		}
		else if((params.current_x_pos >= screen_x_size-1) && (params.current_y_pos >= screen_y_size - 1)) {
			ScrollScreen(1);
			params.current_x_pos = 0;
			params.current_y_pos = screen_y_size - 1;
		}
		else {
            params.current_x_pos++;
			if(params.current_x_pos >= screen_x_size) {
				params.current_x_pos = 0;
				params.current_y_pos++;
			}
		}
		buffer_ptr = 0;
	}
	else if(buffer[0] == 0x7f) {
		buffer_ptr = 0;
	}
	else {
		// unknown
		buffer_ptr = 0;
	}

	//Update if chars processed
	if ((buffer_ptr == 0) && (update_flag)) {
        RequestRefreshScreen(false);
        // when stepping on code debug, uncommend the following line to effectively draw GUI window right now
        // on normal execution, should be commented out
        // RefreshScreen();
    }

    // control cps rate 
    if (((terminal_max_cps) || (terminal_type == CRT_VT100) || (terminal_type == CRT_TEK4010)) && 
        (cpm->emulation_running)) {
        int cps = terminal_max_cps;
        // by default VT100 works at 19200 bauds -> aprox 1500 chars per second 
        if ((terminal_type == CRT_VT100) && (cps==0)) cps = 1500; 
        // by default TEK4010 works at 9600 bauds -> aprox 1200 chars per second 
        if ((terminal_type == CRT_TEK4010) && (cps==0)) cps = 1200; 
        // measure 25 msec, check chars printed (sent to terminal) < cps, wait if necessary to slow down print rate
        int slice=25; 
        if (cps < 100) slice = 1000 / cps; 
        static int Tm0 = 0; 
        static int ChSent = 0; 
        int tnow = GetTickCount();
        int ms= tnow-Tm0; 
        if ((ms < 0) || (ms > slice)) {
            // invalid time slice, reset counters
            Tm0=tnow; ChSent=0; 
        } else {
            // time slice not expired, keep sending chars to terminal
            ChSent++; 
            if (ChSent > cps/(1000/slice)) {
                // exceed chars sent allowed in time slice, thus wait 
                Sleep(slice-ms); // wait to achieve CPS on console selected by user
                Tm0=tnow; ChSent=0; 
            } 
        }
    }
}

void CONSOLE::OpenNewLine()
{
	// if cursor not in colum 0 then <CR><LF>
	if (params.current_x_pos > 0) PutString("\r\n");
}

void CONSOLE::PutString(char string[])
{
	int cnt = strlen(string);
	for(int i = 0; i < cnt; i++) {
		PutChar((BYTE)string[i], false);
        	if (cpm->terminate_cpm_requested) break; 
    	}
	
	RequestRefreshScreen(false);
}

int CONSOLE::ReadEscSeq(BYTE codes[], int params[])
{
	// ANSI
	int val = 0, idx = 0, pt = 0;
	BOOL flag = FALSE;
	
	for(;;) {
		BYTE code = codes[pt++];
		
		if('0' <= code && code <= '9') {
			// ”’l
			val = val * 10 + code - '0';
			flag = TRUE;
		}
		else if(code == ';') {
			params[idx++] = val;
			val = 0;
			flag = FALSE;
		}
		else {
			if(flag)
				params[idx++] = val;
			break;
		}
	}
	return idx;
}

int CONSOLE::GetKey()
{
	// Nonblocking read char from keyboard
	// if no char returns 0

    int val = GetKeyStatus(1);

	if (upper_case_only) {
	   if ((val >= 'a') && (val <= 'z')) val = val - 'a' + 'A';
	}
	if (console_echo) {
		if ((val >= 32) || (val == 8) || (val == 13)) PutChar(val, TRUE);
	}
	return val;
}

void CONSOLE::PasteToKeyboard(char * s)
{
    extern char paste_text[MAX_PASTE];
    EnterCriticalSection(&KbdCriticalSection);
    memcpy(paste_text, s, MAX_PASTE); 
    LeaveCriticalSection(&KbdCriticalSection);
}

int CONSOLE::GetChar()
{
	int n; 
	BYTE c;

	c = 0;
	for(;;) {
		if (params.terminated) break;
        if (cpm->terminate_cpm_requested) break; 
		n = GetKeyStatus(0);
		if (n != 0) {
			c = GetKey();
			break;
		}
		Sleep(40); // wait for a key press
	}
	return c;	

}

void CONSOLE::GetString(char dest[], int length, BOOL& console_terminated, BOOL CtrlC_allowed)
{

	int ptr = 0; // point to first free char in buff. Also = types str len 
	int cur = 0; // current cursor pos in buf
	int cur_x, cur_y; // current pos of cursor in screen
	int InsMode = 1; // insert mode. =0 -> overwrite mode
	int hist_i = hist_ptr; // select last entry in history
	int prt_hist = 0; // flag to print selected history line

    char buf[512+1];
	if (length > 512) length = 512;
	memset(buf, 0, sizeof(buf)); // init buf as empty
	if (length == 0) return;

    history_buffer_visible=0; // bdos input line -> view actual terminal screen instead of viewing the history buffer

	// edit keys:
	// <- ->, Home, End: move cursor on line
	// Ins: toggle overwrite/insert mode
	// BackSpace, Del: delete char
	// Esc: delete entire line
	// Up/Down: recover previous/next command line history line
	// PgUp/PgDn: up/down 5 lines in console screen text history

	KeyboardRawMode = 1; // to allow interacting with cursor keys even if redefined

	while(!params.terminated) {
        if (cpm->terminate_cpm_requested) break; 
		if((ptr >= 510) || (ptr >= length)) {
			// Check max len of read buffer
			ptr = length;
			PutChar(0x0d, true); // only prints CR, not LF
			buf[ptr] = '\0';
			break;
		} else if(GetKeyStatus(0) == 0) {
			Sleep(40); // pause on key waiting on input line
		} else {
			BYTE code = GetKey();
			
			prt_hist = 0;
            if (terminal_type == CRT_TEK4010) {
                // for Tek, only editing key allowed is BACKSPACE
                if (code == 8) {
                    if (ptr > 0) {
                        ptr--; PutChar(8, true);
                    }
                } else if (code == 13) {
				    // Enter key
				    PutChar(0x0d, true);
				    buf[ptr] = '\0';
				    break;
			    } else if((code == 3) && (CtrlC_allowed)) {
				    // Ctrl-C -> exit then WBOOT
				    PutString("^C\r\n");
				    buf[0] = 3;
				    buf[1] = 0;
				    ptr=1; 
				    break;
			    } else if((code < 32) || (code > 127)) {
				    // Non printable -> ignore
			    } else {
					PutChar(code, true);
					buf[ptr] = code; 
					ptr++;
                }
                continue; // goto loop main while
            }

			if (code == K_PgUp) { // PgUp
                ShowScreenHistoryBuffer(5); 
                RequestRefreshScreen(false);
            } else if (code == K_PgDn) { // PgDn
                ShowScreenHistoryBuffer(-5); 
                RequestRefreshScreen(false);
            } else if (code == K_Up) { // up 
				// recover previous history line
				hist_i--;
				if (hist_i < 0) {
					hist_i = -1;
				} else {
					prt_hist = 1; // set flag to print history line
				}
			} else if (code == K_Down) { // down
				// recover next history line
				hist_i++;
				if (hist_i >= hist_ptr) {
					hist_i = hist_ptr;
				} else {
					prt_hist = 1; // set flag to print history line
				}
			}
			if ((code == 0x08) || (code == 27) || (prt_hist == 1)) {
				// backspace -> delete 1 char, 
				// Esc -> delete entire line 
				// recover history line -> also delete entire current line
				if (code != 8) { // delete line al right of cursor
					// save cursor
					cur_x = params.current_x_pos;
					cur_y = params.current_y_pos;
					// overwrite line after cursor with spaces
					for (int i=cur; i<ptr;i++) PutChar(' ', false);
					ptr = cur;
					// restore cursor
					params.current_x_pos = cur_x;
					params.current_y_pos = cur_y;
                } 
				for (;;) {
					if (cur>0) {
						// buf contains chars. back one space
						if (params.current_x_pos>0) {
							// cursor in middle of line, ok
							cur_x = --params.current_x_pos;
							cur_y = params.current_y_pos;
						} else {
							// buf cursor at beggining of second line -> goto end of previous line
							cur_y = --params.current_y_pos;
							cur_x = params.current_x_pos = screen_x_size - 1;
						}
						// print rest of line
						for (int i=cur;i<ptr;i++) PutChar(buf[i], false);
						// print extra space for deleted char
						PutChar(' ', false);
						// now put cursor back at current pos
						params.current_x_pos = 	cur_x;  
						params.current_y_pos = 	cur_y; 
						// update cur, ptr and buf
						cur--; ptr--;
						for (int i=cur;i<ptr;i++) buf[i] = buf[i+1];
					}
					if (code == 8) break; // backspace -> del only one char
					if (cur == 0) break; // no more chars to del 
				}
				RequestRefreshScreen(false);
			}
			if (code >= K_Left) {
				// editing chars
				if ((code == K_Left) ||(code == K_Home)) { // left/Home
					for(;;) {
						if (cur>0) {
							// buf contains chars. back one char
							if (params.current_x_pos>0) {
								// cursor in middle of line, ok
								--params.current_x_pos;
							} else {
								// buf cursor at beggining of second line -> goto end of previous line
								--params.current_y_pos;
								params.current_x_pos = screen_x_size - 1;
							}
							cur--;
						}
						if (code == K_Left) break; // -> only one char
						if (cur == 0) break; // no more chars to go left
					}
					RequestRefreshScreen(false);
				} else if ((code == K_Right) || (code == K_End)) { // right/End
					for (;;) {
						if (cur < ptr) {
							// cur not at end of buf. forward one char
							if (params.current_x_pos<screen_x_size - 1) {
								// cursor in middle of line, ok
								++params.current_x_pos;
							} else {
								// buf cursor at end of line -> goto beginning of next line
								++params.current_y_pos;
								params.current_x_pos = 0;
							}
							cur++;
						}
						if (code == K_Right) break; // -> forward only one char
						if (cur >= ptr) break; // no more chars to forward
					}
					RequestRefreshScreen(false);
				} else if (code == K_Ins) { // Ins
					// toggle insert <-> overwrite mode
					InsMode = 1- InsMode;
				} else if (code == K_Del) { // Del
					if (cur < ptr) {
						cur_x = params.current_x_pos;
						cur_y = params.current_y_pos;
						// print rest of line skipping one char
						for (int i=cur+1; i<ptr;i++) {
							PutChar(buf[i], false);
							buf[i-1]=buf[i];
						}
						PutChar(' ', false);
						ptr--;
						// restore cursor
						params.current_x_pos = cur_x;
						params.current_y_pos = cur_y;
						RequestRefreshScreen(false);
					}
				}
			} else if(code == 0x0d) {
				// Enter key
				PutChar(0x0d, true);
				buf[ptr] = '\0';
				break;
			} else if((code == 3) && (CtrlC_allowed)) {
				// Ctrl-C -> exit then WBOOT
				PutString("^C\r\n");
				buf[0] = 3;
				buf[1] = 0;
				ptr=1; cur=1;
				break;
			} else if(code < 32) {
				// Non printable -> ignore
			} else if(code >= 0x20) {
				if (InsMode == 0) {
					PutChar(code, true);
					buf[cur] = code; // overwrite char at cur
					// increase cur ptr if at end of line
					if (cur == ptr) ptr++;
					cur++;
				} else {
					// insert char at cur in buf
					for (int i=ptr+1;i>cur;i--) buf[i]=buf[i-1];
					buf[cur] = code; 
					// print char
					PutChar(code, false);
					cur_x = params.current_x_pos;
					cur_y = params.current_y_pos;
					// print rest of line
					int prev_y, scroll=0;
					for (int i=cur+1;i<=ptr;i++) {
						prev_y = params.current_y_pos;
						PutChar(buf[i], false);
						if ((params.current_x_pos == 0) && 
							(prev_y == params.current_y_pos) &&
							(prev_y == screen_y_size - 1)) {
							// scroll line
							scroll = 1;
						}
					}
					// set cursor again after inserted char
					if (scroll == 1) cur_y--;
					params.current_x_pos = cur_x;  
					params.current_y_pos = cur_y; 
					RequestRefreshScreen(false);
					// increase cur ptr
					ptr++;
					cur++;
				}
			}
		}
		if (prt_hist == 1) {
			// print history entry
			prt_hist = 0;
			BYTE c;
			ptr = 0;
			for (int i=0;; i++) {
				c = history[hist_i][i];
				buf[i] = c;
				if (c==0) break;
				PutChar(c, false);
				ptr++;
				if (ptr >= length-1) break; // do not fullfill last char of input buffer
			}
			cur = ptr; // cursor at end of line
			RequestRefreshScreen(false);
		}

	}	
	KeyboardRawMode = 0; 
	// save history if buf not empty
	if (buf[0] >= 32) {
		// check if buf is equal to last history entry
		int save=1;
		if (hist_ptr > 0) {
			// history buffer not empty. If not the same -> save buf
			save = 0;
			for (int i=0;; i++) {
				if (history[hist_ptr-1][i] != buf[i]) save=1;
				if (buf[i] == 0) break;
			}
		}
		if (save > 0) {
			if (hist_ptr == HIST_MAX) {
				// history buffer full -> discard last entry
				for (int n=1; n<HIST_MAX; n++) {
					for (int i=0;; i++) {
						history[n-1][i] = history[n][i];
						if (history[n][i] == 0) break;
					}
				}
				hist_ptr--;
			}	
			for (int i=0;; i++) {
				history[hist_ptr][i] = buf[i];
				if (buf[i] == 0) break;
			}
			hist_ptr++;
		}
	}

	strcpy_s(dest, 512, buf);
	console_terminated = params.terminated;
}

void CONSOLE::InitGetStringHistory()
{
	hist_ptr = 0;
	memset(history, 0, sizeof(history));
}

int CONSOLE::GetKeyStatus(int RemoveWaitingKey)
// return 0 if no key pressed/no text waiting to be pasted/no char from submit file
// return the waiting char if any
// if RemoveWaitingKey= 1 -> remove char from Keyboard buffer/paste/submit 
{
    char c; 
	int n; 

    EnterCriticalSection(&KbdCriticalSection);
	if(key_r_ptr != key_w_ptr) {    // there is a key in keyboad buffer?
		c = key_buffer[key_r_ptr];  // yes, get it
		if (RemoveWaitingKey) key_r_ptr = (key_r_ptr + 1) & 0xff; // if ReturnKey flag -> remove the key from keyboard buffer
        if (c==255) c=0; // char $FF is returned as no char (allow to pause between key sequences)
	} else {
		c = 0;
	}
    if (c==0) {
        // no key read. Check if something is pasted
        extern char paste_text[MAX_PASTE];
        c=(paste_text[0]); 
        if (c) { // yes, something is pending to be pasted
            if (c==9) c=32; // convert tab to space
            if ((c<32) && (c!=13)) c=0; // ignore non ascii chars (except <CR>)
            if (RemoveWaitingKey) {
                // if ReturnKey flag -> remove the key from pasted text
                n=strlen(paste_text); 
        	    memcpy(paste_text, &(paste_text[1]), n-1);
		        paste_text[n-1] = 0;
            }
        }
    }
	LeaveCriticalSection(&KbdCriticalSection);
    if (c==0) {
        // no key read nor text pasted. Check if submit file provides a char
        if ((cpm) && (c = cpm->has_xsub_pending_chars())) { // yes, char waiting
            // if ReturnKey flag -> remove the key from submit file
            if (RemoveWaitingKey) c = cpm->return_xsub_pending_char(); 
        }
    }

    // sleep to avoid a z80 tight loop on GetKeyStatus to eat all the host cpu
    static int count_last = 0; 
    n = (int) (count_last - cpm->z80->count); 
    if ((n > 0) && (n < 100)) {
        // more than one and less than 100 count from last call to GetKeyStatus
        // this is a thight z80 loop -> wait
        Sleep(10); 
    }
    count_last = cpm->z80->count; 
	return c;
}

void CONSOLE::PressKey(BYTE code)
{
	// WM_CHAR
	if (paused) return;

    if(log) {
        char sLog[10];
        if (code <= 32) {
            sprintf_s(sLog, "{#%d}", code); 
        } else {
            sprintf_s(sLog, "{%c}", code); 
        }
        log->OutLog(sLog); 
    }

	EnterCriticalSection(&KbdCriticalSection);
	if(((key_w_ptr + 1) & 0xff) != key_r_ptr) {
		key_buffer[key_w_ptr] = code;
		key_w_ptr = (key_w_ptr + 1) & 0xff;
	}
	LeaveCriticalSection(&KbdCriticalSection);
}


void CONSOLE::ResetKeyBuffer()
{
	EnterCriticalSection(&KbdCriticalSection);
	key_r_ptr = key_w_ptr = 0;
	LeaveCriticalSection(&KbdCriticalSection);
}

int GetTimeMS() {
    static LARGE_INTEGER s_frequency;
    static BOOL s_use_qpc = QueryPerformanceFrequency(&s_frequency);
    if (s_use_qpc) {
        LARGE_INTEGER now;
        QueryPerformanceCounter(&now);
        return (int) ((1000LL * now.QuadPart) / s_frequency.QuadPart);
    } else {
        return GetTickCount();
    }
}


int CONSOLE::ExpectString(int Mode, char * sExpect)
// mode = 0 -> initialize
// mode = 1 -> setup expect for sExpect string
// mode = 2 -> return status: 0=no expect in progress, 1=expect in progress
// mode = 3 -> check if printed char sExpect[0] matches the current expect string
//             triggers new expect string if any
{
    if (Mode==0) {
        Expect_String[0]=0; 
        Expect_Matched=0; 
    } else if (Mode==1) {
        strcpy_s(Expect_String, sExpect); 
        Expect_Matched=0; 
        if (log) {
            log->OutLog("\n[EXPECT: Waiting for String \"");
            log->OutLog(Expect_String);
            log->OutLog("\"]\n");
        }
    } else if (Mode==2) {
        if (Expect_String[0]==0) return 0; // no expect in progress
        return 1; // expect in progress
    } else if (Mode==3) {
        if ((Expect_String[0]==0) && (cpm)) cpm->has_xsub_pending_chars(); // if no expect in progress, checks if there any to be triggered
        if (Expect_String[0]==0) return 0; // no expect in progress, return
        char cIn = sExpect[0];
        char cExpect = Expect_String[Expect_Matched]; 
        if (cIn != cExpect) {
            // no match 
            Expect_Matched=0; 
            return 0; 
        }
        // char match. Increment number of matched chars
        Expect_Matched++; 
        // Check if expected string in fully matched
        if (Expect_String[Expect_Matched]==0) {
            // no more chars to match -> string matched!
            if (log) {
                log->OutLog("\n[EXPECT: Matched String \"");
                log->OutLog(Expect_String);
                log->OutLog("\"]\n");
            }
            // expect honored/fullfilled, now remove it
            Expect_Matched=0; 
            Expect_String[0]=0; 
            // call has_xsub_pending_chars to trigner any following expect 
            if (cpm) cpm->has_xsub_pending_chars(); 
        }
    }
    return 0; 
}

