#include "stdafx.h"

#include <windows.h>
#include <stdio.h>
#include <math.h>
#include "cpm.h"
#include "z80.h"
#include "console.h"
#include "..\res\resource.h"

// these functions xxx_GrOverlay are intended to be called from
// z80 thread when processing instructions
// the functions queues the draw operations, so ther will be performed
// on main thread by RefreshScreen() called on WM_TIMER event


void CONSOLE::ClearScreen_GrOverlay()
// notify a clear screen pending for Graphic Overlay
{
    if (params.GrOverlay.enabled==0) return; 
    AddToDrawList_GrOverlay(-1, // clear screen command
                            0,0,0,0,0); 
}

void CONSOLE::DrawVector_GrOverlay(int x0, int y0, int x1, int y1, int pattern, int wx, int wy)
// add a vector to pending graphics overlay draw list
// coords are in range 0..wx-1 and 0..wy-1
// patterns = bits 0..2  = line type 0..4 for tek4010 alisased lines
//            bit 4      = 16 -> erase line
//            bit 5      = 32 -> xor for RG512 lines 
//            bit 7      = 128 -> draw using color
//            bits 8..10 = GSX line color 0..7
//            bits 16..23 = decay counter (for Tek4010)
{
    if (params.GrOverlay.enabled==0) return; 
    // do not draw vector if invalid coordinates
	if ((x0 < 0) || (x1 < 0) || (y0< 0) || (y0 < 0)) return; 
    x0=screen_x_dots * x0 / wx; // convert coords to current GUI windows size
    x1=screen_x_dots * x1 / wx; 
    y0=screen_y_dots * y0 / wy; 
    y1=screen_y_dots * y1 / wy; 

	if ((x0 >= screen_x_dots) || (x1 >= screen_x_dots) || 
        (y0 >= screen_y_dots) || (y1 >= screen_y_dots)) return; 

    AddToDrawList_GrOverlay(1, // is a vector
                            x0,y0,x1,y1,pattern); 

}

void CONSOLE::DrawPoint_GrOverlay(int x0, int y0, int pattern, int wx, int wy)
// add a point to pending graphics overlay draw list
// coords are in range 0..wx-1 and 0..wy-1
// patterns = bit 4       = 16 -> erase point for RG512 points
//            bit 5       = 32 -> xor for RG512 points
//            bit 7       = 128 -> draw using color
//            bits 8..10  = GSX point color 0..7
//            bits 16..23 = decay counter (for Tek4010)
{
    if (params.GrOverlay.enabled==0) return; 
    // do not draw if invalid coordinates
	if ((x0 < 0) || (y0< 0)) return; 
    x0=screen_x_dots * x0 / wx; // convert coords to current GUI windows size
    y0=screen_y_dots * y0 / wy; 
	if ((x0 >= screen_x_dots) || (y0 >= screen_y_dots)) return; 

    AddToDrawList_GrOverlay(2, // is a point
                            x0,y0,0,0,pattern); 
}

void CONSOLE::DrawChar_GrOverlay(int x0, int y0, int w, char c, int pattern, int wx, int wy)
// add a char to pending graphics overlay draw list
// coords are in range 0..wx-1 and 0..wy-1
// patterns = bit 0..1   = 1 -> use small charset for tek4010 = 2 -> use big
//            bit 3      = 8 -> charset Opaque background (the char cell is given by x0,y0,x1,y1)
//            bit 4      = 16 -> erase char
//            bit 5      = 32 -> xor for RG512 chars
//            bit 7      = 128 -> draw using color
//            bits 8..10 = GSX char line color 0..7
{
    if (params.GrOverlay.enabled==0) return; 
    // do not draw if invalid coordinates
	if ((x0 < 0) || (y0< 0)) return; 
    x0=screen_x_dots * x0 / wx; // convert coords to current GUI windows size
    y0=screen_y_dots * y0 / wy; 
	if ((x0 >= screen_x_dots) || (y0 >= screen_y_dots)) return; 

    AddToDrawList_GrOverlay(3, // is a char
                            x0,y0,w,c,pattern); 
    // char width is placed in x1
    // char is placed in y1
}

void CONSOLE::FillArea_GrOverlay(int x0, int y0, int x1, int y1, int pattern, int wx, int wy)
// fill area to pending graphics overlay draw list
// coords are in range 0..wx-1 and 0..wy-1
// patterns = bit 4      = 16 -> erase area
//            bit 5      = 32 -> xor area
//            bit 7      = 128 -> draw using color
//            bits 8..10 = GSX fill color 0..7
{
    if (params.GrOverlay.enabled==0) return; 
    // do not draw area if invalid coordinates
	if ((x0 < 0) || (x1 < 0) || (y0< 0) || (y0 < 0)) return; 
    x0=screen_x_dots * x0 / wx; // convert coords to current GUI windows size
    x1=screen_x_dots * x1 / wx; 
    y0=screen_y_dots * y0 / wy; 
    y1=screen_y_dots * y1 / wy; 

	if ((x0 >= screen_x_dots) || (x1 >= screen_x_dots) || 
        (y0 >= screen_y_dots) || (y1 >= screen_y_dots)) return; 

    AddToDrawList_GrOverlay(4, // is FillArea
                            x0,y0,x1,y1,pattern); 

}

void CONSOLE::AddToDrawList_GrOverlay(int type, 
                                      int x0, int y0, int x1, int y1, 
                                      int attrib)
// add to pending graphics overlay draw list
{
    if (params.GrOverlay.enabled==0) return; 
    int n; 

    EnterCriticalSection(&KbdCriticalSection);
    n=params.GrOverlay.nVectors; 
    if (n<MAX_VECT) { // safety
        // add char to draw list
        params.GrOverlay.nVectors++;
        params.GrOverlay.vect[n].type=type; 
        params.GrOverlay.vect[n].x0=x0;
        params.GrOverlay.vect[n].y0=y0;
        params.GrOverlay.vect[n].x1=x1; 
        params.GrOverlay.vect[n].y1=y1; 
        params.GrOverlay.vect[n].attrib=attrib; 
    }
    RefreshScreen_event_pending = 1; 
    LeaveCriticalSection(&KbdCriticalSection);
    if ( n>(MAX_VECT*80/100) ) {
        Sleep(50); // vector list near full. wait so refresh can draw some of the pending vectors
    }
}


// This functions is called from RefreshScreen() on main thread (called in turn by WM_TIMER event)
// read draw operations queued, and perform them usign Window GDI
int CONSOLE::DrawImage_GrOverlay(int mode, RECT * rect)

// mode = 0 -> called inside gricial region. Copies gr overlay queue to static local var GrOv
//             set GrOv.ClearScreen_requested=1 is Graphic overlay bitmap should be cleared
//             by calling DrawImage_GrOverlay(1)
//      = 1 -> clear graphics overlay and draw local queue vectors/points/chars to graphics
//             overlay. return gr_rect with the invalidate rectangle
//      = 2 -> sets RG512 mouse shape according to GIN mode, draws TEK4010 alpha cursor 
//             and crosshair. Returns number of rectangles invalidated on main GUI window to be redraw on WM_PAINT 
{
    static struct {
        int nVectors;
        struct {
            int type, attrib; 
            int x0,y0,x1,y1;
        } vect[MAX_VECT];
        int ClearScreen_requested; 
    } GrOv; // this struct should match the one defined in console.h

    if (mode==0) {
        // this function is called in the critical region Enter/LeaveCriticalSection(&KbdCriticalSection)
        // so must be very fast and should not issue any other calls. 
        // It copies info for overlay graphics to be redraw on local static struc, to be 
        // processed once leaving the critical region
        GrOv.ClearScreen_requested = 0; 
        GrOv.nVectors             = 0;
        // copy pending to be draw vector list ...
        int type; 
        for (int n=0; n<params.GrOverlay.nVectors; n++) {
            // copy draw list 
            type = GrOv.vect[GrOv.nVectors].type   = params.GrOverlay.vect[n].type; 
            GrOv.vect[GrOv.nVectors].attrib = params.GrOverlay.vect[n].attrib; 
            GrOv.vect[GrOv.nVectors].x0     = params.GrOverlay.vect[n].x0; 
            GrOv.vect[GrOv.nVectors].y0     = params.GrOverlay.vect[n].y0; 
            GrOv.vect[GrOv.nVectors].x1     = params.GrOverlay.vect[n].x1; 
            GrOv.vect[GrOv.nVectors].y1     = params.GrOverlay.vect[n].y1; 
            if (type==-1) {
                // clear graphical overlay screen requested. Discard current draw list up to now
                GrOv.nVectors=0; 
                GrOv.ClearScreen_requested=1; 
            } else {
                GrOv.nVectors++;
            }
        }
        params.GrOverlay.nVectors=0; // ... and empty the queue 
        // now add back to the queue the vectors that are decaying, if any
        int attrib, decay, nd; 
        nd=0; 
        for (int n=0; n<GrOv.nVectors; n++) {
            decay = (GrOv.vect[n].attrib & 0xFF0000); 
            if (decay==0) continue; // no decay
            // reduce decay remaining 
            attrib = (GrOv.vect[n].attrib & 0xFF00FFFF) | (decay - 0x10000); 
            // add back the vector to the main list
            params.GrOverlay.vect[nd].type   = GrOv.vect[n].type; 
            params.GrOverlay.vect[nd].attrib = attrib; 
            params.GrOverlay.vect[nd].x0   = GrOv.vect[n].x0; 
            params.GrOverlay.vect[nd].y0   = GrOv.vect[n].y0; 
            params.GrOverlay.vect[nd].x1   = GrOv.vect[n].x1; 
            params.GrOverlay.vect[nd].y1   = GrOv.vect[n].y1; 
            nd++; 
        }
        params.GrOverlay.nVectors=nd; 
        return 0; 
    } else if (mode==1) {
        // clear graphics overlay and draw local queue vectors/points/chars to graphics
        // overlay. return gr_rect with the invalidate rectangle
        // init invalidate rect
        rect->left = rect->top = LONG_MAX; 
        rect->right = rect->bottom = 0;
        // clear the graphics overlay if requested 
        if (GrOv.ClearScreen_requested) {
            HBRUSH bru;
  	        rect->left =   0;
            rect->top =    0;
   	        rect->right =  screen_x_dots;
            rect->bottom = screen_y_dots;
            if (terminal_type == CRT_TEK4010) {
                bru = CreateSolidBrush(RGB(0,48,0)); // dark green to Tek
            } else {
                bru = CreateSolidBrush(RGB(0,0,0)); // full black background
            }
            FillRect(hdcDIBgr, rect, bru);
            DeleteObject(bru);
        }
        // process GrOv array to perform GDI calls to draw on graphic overlay
        if (GrOv.nVectors==0) return 0; // nothing to draw
        HPEN hPen0 = CreatePen(PS_SOLID, 1, RGB(0,0,0)); // black pen
        HPEN svPenGr = (HPEN) SelectObject(hdcDIBgr, hPen0);
        // draw both on GUI window and on Gr overlay bitmap
        int x0,y0,x1,y1,a,type,attrib, ch, w, decay, 
            line_pattern, XORMode,EraseMode, 
            CharsetScale, OpaqueCharsetBk, HasColor, DrawColor, fill_pattern;             
        for (int n=0; n<GrOv.nVectors; n++) {
            x0=GrOv.vect[n].x0; y0=GrOv.vect[n].y0; 
            x1=GrOv.vect[n].x1; y1=GrOv.vect[n].y1; 
            type = GrOv.vect[n].type; 
            attrib = GrOv.vect[n].attrib; 
            // decode attrib
            line_pattern = (attrib & 7);        // only applies to aliased lines
            fill_pattern = (attrib & 15);       
            EraseMode    = (attrib & 16) ? 1:0; 
            XORMode      = (attrib & 32) ? 1:0; 
            HasColor     = (attrib & 128) ? 1:0; 
            DrawColor    = (attrib >> 8) & 7; 
            decay        = (attrib >> 16) & 255; 
            CharsetScale = (attrib & 3); // 0=normal, 1=small, 2=big
            OpaqueCharsetBk = (attrib & 8) ? 1:0; 
            // select color
            if (HasColor==0) {
                DrawColor=2; // Monocrome screen -> use green
            } else {
                // GSX color 1 is white, 0=black)
                if (DrawColor) DrawColor=8-DrawColor; 
            }
            COLORREF fore_col = RGB((DrawColor & 4) ? 255 : 0, (DrawColor & 2) ? 255 : 0, (DrawColor & 1) ? 255 : 0);
            HPEN hPen1 = CreatePen(PS_SOLID, 1, fore_col); // color pen
            // draw mode
            int svRop = SetROP2(hdcDIBgr, R2_COPYPEN);
            if (XORMode) {
                SetROP2(hdcDIBgr, R2_XORPEN); // draw with xor mode
            } else if (EraseMode) {
                SetROP2(hdcDIBgr, R2_BLACK); // draw allways color 0
            }
            if (type == 1) { // draw a vector
                if (params.GrOverlay.antialiased) { 
                    // attrib is type of line: =0 -> solid vector, =1 -> dotted line, =2 -> dot-dashed, =3 -> short dashed, =4 -> long dashed
                    // no other attrib can be selected
                    AntiAliased_Line(x0,y0,x1,y1, line_pattern, decay);
                } else {
                    // draw line, no frills
                    SelectObject(hdcDIBgr, hPen1);
                    MoveToEx(hdcDIBgr, x0, y0, NULL);
                    LineTo(hdcDIBgr, x1, y1);
                }
                // so x1,y1 are outside the redraw rectangle
                x1++; y1++; 
            } else if (type == 2) { // draw a point
                if (params.GrOverlay.antialiased) {
                    AntiAliased_Point(x0,y0,decay);
                    x0--; y0--;
                    x1=x0+3; y1=y0+3; // so x1,y1 are outside the redraw rectangle
                } else {
                    SetPixel(hdcDIBgr, x0, y0, fore_col);
                    x1=x0; y1=y0; 
                }
            } else if (type == 3) { // draw a char
                w =x1; // char width
                ch=y1; // the char 
                if (ch < 32) continue; // not printable
                // x1 and y1 is the wifth/height of rect arround the char (the char cell)
                if (w==0) w=font_x_dots; // if =0 use font size
	            RECT rct;
	            rct.left = x0;
	            rct.top = y0;
	            rct.right = x1 = rct.left + w;
	            rct.bottom = y1 = rct.top + font_y_dots;
                rct.right++; rct.bottom++; // because fillrect excludes bottom and right border
                if (OpaqueCharsetBk) { // if opaque char, erase background
			        HBRUSH bru = CreateSolidBrush(RGB(0,0,0));
			        FillRect(hdcDIBgr, &rct, bru);
			        DeleteObject(bru);
                }
                if (ch == 32) continue; // space -> nothing to print
                char string[3]; string[1]=0; string[0]=ch;
                if (XORMode==0) {
                    // normal draw
                    if (CharsetScale == 1) { 
           			    SelectObject(hdcDIBgr, hFont_small); 
                    } else if (CharsetScale == 2) { 
           			    SelectObject(hdcDIBgr, hFont_big); 
                    } else {
       			        SelectObject(hdcDIBgr, hFont);
                    }
                    SetTextColor(hdcDIBgr, fore_col); 
	    	        SetBkColor(hdcDIBgr, RGB(0,0,0));
                    int svMode=SetBkMode(hdcDIBgr, TRANSPARENT); 
                    DrawText(hdcDIBgr, string, 1, &rct, DT_LEFT | DT_SINGLELINE | DT_NOPREFIX );      
                    SetBkMode(hdcDIBgr, svMode); 
                } else {
                    // xor draw
                    // on Windows GDI, SetROP2 does not appies to text output. 
                    // Must draw text in a separate bitmap then copy it inverted to main bitmap
                    HDC hdc = GetDC(hMain);
                    HDC hdcDIBmem = CreateCompatibleDC(hdc);
                    HBITMAP hbmem = CreateCompatibleBitmap(hdc, w + 2, font_y_dots + 2);
                    HGDIOBJ svObj = SelectObject(hdcDIBmem, hbmem);
			        HBRUSH bru = CreateSolidBrush(RGB(255,255,255));
                    RECT r;
                    r.left = r.top = 0; r.right = w; r.bottom = font_y_dots;
			        FillRect(hdcDIBmem, &r, bru);
			        DeleteObject(bru);
       			    SelectObject(hdcDIBmem, hFont); // normal font
                    SetTextColor(hdcDIBmem, RGB(0,0,0)); 
		            SetBkColor(hdcDIBmem, RGB(255,255,255));
                    SetBkMode(hdcDIBmem, TRANSPARENT); 
                    DrawText(hdcDIBmem, string, 1, &r, DT_LEFT | DT_SINGLELINE | DT_NOPREFIX );      
                    BitBlt(hdcDIBgr,x0,y0, w,font_y_dots, hdcDIBmem, 0, 0, SRCAND); 
                    SelectObject(hdcDIBmem, svObj);
                    DeleteObject(hdcDIBmem);
                    DeleteDC(hdcDIBmem);
                }
            } else if (type == 4) { // fill area
                FillArea(x0,y0,x1,y1, fore_col, HasColor, EraseMode, XORMode, fill_pattern); 
            }
            // reorder coords
            if (x0 > x1) {a=x0; x0=x1; x1=a;} // make sure x0<x1 and y0<y1
            if (y0 > y1) {a=y0; y0=y1; y1=a;}
            x1++; y1++; // expand one pixel botton and right (this extra pixel will be explided from repaint rect)
            if (x0 < 0) x0=0; if (y0 < 0) y0=0; 
            if (x1 > screen_x_dots) x1=screen_x_dots; if (y1 > screen_y_dots) y1=screen_y_dots; 
            // expand invalidate rect to contain the vector rectangle
            if (x0 < rect->left) rect->left=x0; 
            if (y0 < rect->top) rect->top=y0; 
            if (x1 > rect->right) rect->right=x1; 
            if (y1 > rect->bottom) rect->bottom=y1; 
            // reset GDI objects
            SelectObject(hdcDIBgr, svPenGr);
            DeleteObject(hPen1);
            SetROP2(hdcDIBgr, svRop); 
        }
        SelectObject(hdcDIBgr, svPenGr);
        DeleteObject(hPen0);
    } else if (mode==2) {
        // handle RG512 mouse image. Should be a cross if GIN mode active
        if ((params.RG512.enabled) && (params.RG512.TekMode)) {
            // RG-512 in TekMode
            if (params.tek4010.mode != 1) { 
                // no GIN mode
                // set arrow mouse shape if not already set
                if (params.RG512.MouseCursor != 0) {
                    HCURSOR hCur = LoadCursor(NULL, IDC_ARROW); 
                    SetCursor(hCur); 
                    SetClassLongPtr(hMain, GCLP_HCURSOR, (LONG_PTR) hCur);
                    params.RG512.MouseCursor = 0; 
                }
            } else { 
                // GIN Mode
                // set cross mouse shape if not already set
                if (params.RG512.MouseCursor != 1) {
                    HCURSOR hCur = LoadCursor(NULL, IDC_CROSS); 
                    SetCursor(hCur); 
                    SetClassLongPtr(hMain, GCLP_HCURSOR, (LONG_PTR) hCur);
                    params.RG512.MouseCursor = 1; 
                }
                // get mouse position in GIN variables, so it can be seen when Alt-I is active
                GetMousePosInGIN(); 
            }
        }
        // handle TEK4010 cross hair and alpha cursor. 
        // Should be visible if GIN mode active / alpha mode
        if (terminal_type == CRT_TEK4010) {
            // handle alpha cursor
            RECT crect0; // cursor rectangle on GDI
            RECT crect1; 
            // will calculate the rectangle to erase (crect0) by copying it from gr overlay origin
            // and the rectangle to draw (crect1) as cursor directly on hdcDIB context
            // but wll not perform these actions yet
            int erase_crect0 = 0; 
            int draw_crect1 = 0; 
            if (params.tek4010.last.cursor_draw) {
                // erase last alfa cursor on screen
                params.tek4010.last.cursor_draw=0; 
                memcpy(&crect0, &params.tek4010.last.cursor_rect, sizeof(crect0)); // crect0 = rect to erase
                erase_crect0=1; // should erase
            }
            if (params.tek4010.mode == 0) { // alpha mode
                // draw alpha cursor
                double font_scale = ( (params.tek4010.CharSize==1) ? TEK_SMALL_FONT : (params.tek4010.CharSize==2) ? TEK_BIG_FONT : 1.0 );
                crect1.left   = params.tek4010.gr_x_pos * screen_x_dots / 1024; 
                crect1.bottom = params.tek4010.gr_y_pos * screen_y_dots / 780 + 1; 
                crect1.right  = crect1.left + (int) ( font_x_dots * font_scale); 
                crect1.top = crect1.bottom  - (int) ( font_y_dots * font_scale); 
                memcpy(&params.tek4010.last.cursor_rect, &crect1, sizeof(crect1)); 
                params.tek4010.last.cursor_draw=1; 
                draw_crect1=1; // should draw
            }
            params.tek4010.refresh.draw_cursor_flag=0;
            if ((erase_crect0) && (draw_crect1) && (EqualRect(&crect0, &crect1))) {
                // alpha cursor still at same position. Nothing to draw in GUI window
            } else {
                // alpha cursor moved, has disapeared or becomes visible: should redraw
                // so first erase old position by copying rect from source hdcDIBgr
                if (erase_crect0) {
                    // should erase cursor at old position
                    // expand invalidate rect to contain the old cursor position to be erased
                    if (crect0.left < rect->left) rect->left=crect0.left; 
                    if (crect0.top < rect->top) rect->top=crect0.top; 
                    if (crect0.right > rect->right) rect->right=crect0.right;
                    if (crect0.bottom > rect->bottom) rect->bottom=crect0.bottom; 
                }
                // if needed, draw cursor at new position
                if (draw_crect1) {
                    params.tek4010.refresh.draw_cursor_flag=1;
                    // expand invalidate rect to contain the new cursor position to be drawn
                    if (crect1.left < rect->left) rect->left=crect1.left; 
                    if (crect1.top < rect->top) rect->top=crect1.top; 
                    if (crect1.right > rect->right) rect->right=crect1.right;
                    if (crect1.bottom > rect->bottom) rect->bottom=crect1.bottom; 
                }
            }   
            // handle GIN cross hair
            POINT pt0, pt1; 
            int erase_xrect0 = 0; 
            int draw_xrect1 = 0; 
            if (params.tek4010.last.crosshair_draw) {
                // erase last cross hair on screen
                params.tek4010.last.crosshair_draw=0; 
                memcpy(&pt0,  &params.tek4010.last.xhair_pt, sizeof(pt0)); // pt0 = point to erase
                erase_xrect0=1; 
            }
            if (params.tek4010.mode == 1) { // GIN mode
                // get mouse position
	            GetCursorPos(&pt1);
	            ScreenToClient(hMain, &pt1);
    	        if ((pt1.x < 1) || (pt1.x >= screen_x_dots-1) ||
	                (pt1.y < 1) || (pt1.y >= screen_y_dots-1)) {
	                // mouse not in screen area -> do not draw crosshair
	            } else {
                	// draw crosshair cursor at mouse position
                    memcpy(&params.tek4010.last.xhair_pt, &pt1, sizeof(pt1)); 
                    params.tek4010.last.crosshair_draw=1; 
                    draw_xrect1=1; 
                }
            }
            if ((erase_xrect0) && (draw_xrect1) && (pt0.x==pt1.x) && (pt0.y==pt1.y)) {
                // crosshair still at same position. Nothing to draw in GUI window
            } else {
                // crosshair moved, disapeared or becomes visible: should redraw 
                // first remove crosshair at old position 
                if (erase_xrect0) {
                    // should erase at old position
                    // save the horiz rect to be erased when processing the WM_PAINT event
                }
                if (draw_xrect1) {
                    // store GIN postion
                    params.tek4010.GIN_x = pt1.x * 1024 / screen_x_dots; 
                    params.tek4010.GIN_y = pt1.y * 780 / screen_y_dots; 
                }
                // expand invalidate rect to whole screen to erase and maybe redraw the crosshair
                if (erase_xrect0 || draw_xrect1) {
                    rect->left=0; 
                    rect->top=0; 
                    rect->right=screen_x_dots;
                    rect->bottom=screen_y_dots;
                }
            }
            return 0; 
        }
    }
    return 0; 
}





void CONSOLE::Term125_FictionalHiresVectorEngine(int addr, int data)
// interface OUT (add),data for a fictional hires vector engine add-on
// to WaveMate Terminal-125 video card
// just to enjoy subLOGIC fligh simulator with the hi res graphics it deserves
{
    static int Coord[4];
    static int iCoord=0; 

    if (addr==0x10) { // control port
        // activate graphic overlay
        params.GrOverlay.enabled=1;                      
        params.GrOverlay.antialiased=1; 
        // this function is called by z80 thread. This thread should not write to 
        // GDI window, so instead, it calls to xxx_GrOvelay functions that 
        // queues the draws to be done. the main thread is the one that
        // porcesses windows messages and calls console->RefreshScreen() on WM_TIMER
        // event. This routine reads the queue and perform draws on GDI
        if (data==1) {
            // write 1 to port 10 -> clear graphic overlay
            ClearScreen_GrOverlay();       
        } else if (data==2) {
            // write 2 to port 10 -> start coordinate list
            iCoord=0;
        } else if (data==3) {
            // write 3 to port 10 -> draw solid vector 
            DrawVector_GrOverlay(Coord[0], Coord[1], Coord[2], Coord[3], 0, 255,255);
        } else if (data==4) {
            // write 4 to port 10 -> draw point 
            DrawPoint_GrOverlay(Coord[0], Coord[1], 0, 255,255);
        }
    } else if (addr==0x11) { // data port
        // write to port 11 -> store coordinates
        if (iCoord < 4) {
            Coord[iCoord]=data; 
            iCoord++;
        }
    }
}




// functions that draws on Graphics Overlay bitmap
// called by RefreshScreen(void) 
// these funcs are executed on main thread, thus they can perform GDI calls


void CONSOLE::FillArea(int x0, int y0, int x1, int y1, COLORREF fore_col, 
                       int HasColor, int EraseMode, int XORMode, int pattern)
{
    static char patternMap[16*16]= 
        "xxxx"  ".x.x"  "x..."  "...." "x.x." "xxxx" "xx.." "x..." "x..." "...x" ".x.." ".x.." "...." 
        "xxxx"  "x.x."  "..x."  ".x.." "x.x." "...." "xx.." "...." ".x.." "..x." ".x.." "xxxx" "xxxx"  
        "xxxx"  ".x.x"  "x..."  "...." "x.x." "xxxx" "..xx" "...." "..x." ".x.." ".x.." ".x.." "...."  
        "xxxx"  "x.x."  "..x."  "...x" "x.x." "...." "..xx" "...." "...x" "x..." ".x.." ".x.." "....";
    
	DWORD pixelRGB, colRGB = 0; 
    int rr,gg,bb; 
    int  pos,a,xpat,ypat; 

    if (HasColor) {
        rr = GetRValue(fore_col); 
        gg = GetGValue(fore_col); 
        bb = GetBValue(fore_col); 
        colRGB = RGB(rr,gg,bb);
    }

    // reorder coords
    if (x0 > x1) {a=x0; x0=x1; x1=a;} // make sure x0<x1 and y0<y1
    if (y0 > y1) {a=y0; y0=y1; y1=a;}
    if (y0 < 0) y0=0; 
    if (y1 >= screen_y_dots) y1 = screen_y_dots-1; 
    if (x0 < 0) x0=0; 
    if (x1 >= screen_x_dots) x1 = screen_x_dots-1; 

    // both x1 and y1 are filled
    while (pattern >= 13) pattern -= 13; 
    if (pattern <0) pattern=0; 
    for (int y=y0; y<=y1; y++) {
        pos=screen_x_dots * (screen_y_dots - 1 - y) + x0; 
        for (int x=x0; x<=x1; x++) {
            if (pattern) {
                xpat=x & 3; ypat=y & 3; 
                if (patternMap[xpat + pattern * 4 + ypat*13*4]=='.') {
                    pos++;
                    continue; // skip this pixel
                }
            }
            if (EraseMode) {
                lpBMPgr[pos]=0; 
            } else if (HasColor==0) {
                pixelRGB=lpBMPgr[pos]; // get pixel 
                if (XORMode) {   
                    // invert green component of pixel
                    rr = GetRValue(pixelRGB); 
                    gg = 255 - GetGValue(pixelRGB); 
                    bb = GetBValue(pixelRGB); 
                    // set new green còmponent in pixel
                    lpBMPgr[pos]= RGB(rr,gg,bb);
                } else {
                    rr = GetRValue(pixelRGB); 
                    gg = 255; 
                    bb = GetBValue(pixelRGB); 
                    // set green component
                    lpBMPgr[pos]= RGB(rr,gg,bb);
                }
            } else if (XORMode) {
                lpBMPgr[pos] = ~lpBMPgr[pos]; 
            } else {
                lpBMPgr[pos] = colRGB; // Fill rectangle
            }
            pos++;
        }
    }

}	

void CONSOLE::SetPixelAA(int x, int y, int ammount, int decay)
// set pixel adding ammount (0..255) of color to green component of pixel
// color is set by decay value. If decay=TEK_DECAY -> pixel is white, if =0 -> pixel is green
{
	DWORD pixelRGB; 
    int rr,gg,bb; 
    int  pos; 

    // check pixel in range
	if ((x<0) || (y<0) || (x>=screen_x_dots) || (y>=screen_y_dots)) return; 
    if (ammount==0) return; if (ammount > 200) ammount = 200;
    // calc quantity of white according to decay 
    if (decay > TEK_DECAY) decay = TEK_DECAY; 
    rr = bb = ammount * decay / TEK_DECAY; 

    // get pixel 
    pos=screen_x_dots * (screen_y_dots - 1 - y) + x; 
    pixelRGB=lpBMPgr[pos];
    // get green component
    gg = GetGValue(pixelRGB); 
    // add 8bit ammount to green component
    if (gg < ammount) gg=ammount; 
    // set pixel back 
    lpBMPgr[pos]= RGB(rr,gg,bb);
}	

void CONSOLE::AntiAliased_Point(int x0, int y0, int decay)
{
	COLORREF fore_col = RGB(0,255,0);

    // check pixel in range
	if ((x0<0) || (y0<0) || (x0>=screen_x_dots) || (y0>=screen_y_dots)) return; 

    SetPixelAA(x0, y0, 255, decay);
	SetPixelAA(x0,y0-1,112, decay);
	SetPixelAA(x0,y0+1,112, decay);
	SetPixelAA(x0-1,y0,112, decay);
	SetPixelAA(x0+1,y0,112, decay);
	SetPixelAA(x0-1,y0-1,48, decay);
	SetPixelAA(x0+1,y0-1,48, decay);
	SetPixelAA(x0-1,y0+1,48, decay);
	SetPixelAA(x0+1,y0+1,48, decay);
}


void CONSOLE::AntiAliased_Line(int x0, int y0, int x1, int y1, int pattern, int decay)
// pattern is type of line: =0 -> solid vector, =1 -> dotted line, =2 -> dot-dashed, =3 -> short dashed, =4 -> long dashed
{
    int a,x,y, am ,amf; 
    double rx,ry,dx,dy,f; 
    static char *patternMap[5]= {
        "xxxxxxxxxxxxxxxx",
        "x.x.x.x.x.x.x.x.", 
        "xxxxx.x.xxxxx.x.",
        "xxxx....xxxx....",
        "xxxxxxxx........"
    };

    if ((pattern < 0) || (pattern > 4)) pattern = 0; 
    dx = (x1-x0); 
    dy = (y1-y0); 

    if (abs(dx) <= abs(dy)) {
        // vertical line
        // guarantee descending line
        if (y0>y1) {a=y0;y0=y1;y1=a; a=x0;x0=x1;x1=a;}
        // draw line body
        if (dy==0) dx=0; else dx=dx/dy; 
        rx=x0;
        for (y=y0; y<=y1; y++) {
            x=(int) rx; f=rx-x; 
            amf= (int)(255.0 * f); 
            am = 255-amf; 
            if ((pattern) && (patternMap[pattern][y & 15]) == '.') {
                // skip this point
            } else {
                SetPixelAA(x-1,y,am  / 2, decay);
                SetPixelAA(x,  y,amf / 2 + am, decay);
                SetPixelAA(x+1,y,amf + am / 2, decay);
                SetPixelAA(x+2,y,amf / 2, decay);
            }
            rx=rx+dx;
        }
    } else {
        // horizontal line
        // guarantee left to right line
        if (x0>x1) {a=y0;y0=y1;y1=a; a=x0;x0=x1;x1=a;}
        // draw line body
        if (dx==0) dy=0; else dy=dy/dx; 
        ry=y0; 
        for (x=x0; x<=x1; x++) {
            y=(int) ry; f=ry-y; 
            amf= (int)(255.0 * f); 
            am = 255-amf; 
            if ((pattern) && (patternMap[pattern][x & 15]) == '.') {
                // skip this point
            } else {
                SetPixelAA(x,y-1,am  / 2, decay);
                SetPixelAA(x,  y,amf / 2 + am, decay);
                SetPixelAA(x,y+1,amf + am / 2, decay);
                SetPixelAA(x,y+2,amf / 2, decay);
            }
            ry=ry+dy;
        }
    }
}

// Helper function for tek
int CONSOLE::Tek4010(int command, int data)
// if command = 0 -> clear screen
//              1 -> toggle GIN mode
//              2 -> return true if GIN mode active
//              3 -> send GIN position
{
    if (command == 0) {
        // clear the screen
        ClearScreen_GrOverlay();
        params.tek4010.gr_x_pos = 0;  // on tek real screen, coord 0,0 is lower left corner. Chars hare draw considering gr pos at lower left of char
        params.tek4010.gr_y_pos = 21; // on windows GUI, coord 0,0 is upper left corner. Chars hare draw considering gr pos at upper left of char
        params.tek4010.margin=0; 
        params.tek4010.mode = 0; // alpha mode
        params.tek4010.ByPassMode=0; 
        params.tek4010.CharSize=0; // use normal font 
        params.tek4010.Pattern=0; // use solid continuous vectors
        params.tek4010.last.crosshair_draw=0; 
        params.tek4010.last.cursor_draw=0; 
    } else if (command==1) {
        // toggle GIN mode
        if (params.tek4010.mode == 1) {
            params.tek4010.mode = 0; // return to alpha mode
        } else {
            params.tek4010.mode=1; // set GIN mode
        }
    } else if (command==2) {
        // return true if GIN mode active
        return (params.tek4010.mode == 1) ? 1:0; 
    } else if (command==3) {
        // send GIN position
        int status, HiX, HiY, LoX, LoY, y;                 
        status = 0x31 + (params.tek4010.margin ? 2:0)  // bit1=1 -> margin 1
                      + (params.tek4010.mode<2 ? 4:0); // bit2=1 -> alpha mode, =0 -> vector or point mode
        y = 780-1-params.tek4010.GIN_y; 

        if ((params.tek4010.GIN_x==0) && (params.tek4010.GIN_y==0)) {
            // special case: if GIN pos at 0,0 send all spaces
            // needed by GrafTalk: ERASE commands sends an ESC<ENQ> so GIN pos 
            // is received as a command typed on '.' program prompt
            y=0; 
        }
        HiX    = 0x20 + ((params.tek4010.GIN_x >> 5) & 31); 
        LoX    = 0x20 + ((params.tek4010.GIN_x) & 31); 
        HiY    = 0x20 + ((y >> 5) & 31); 
        LoY    = 0x20 + (y & 31); 
		if(log) {
            char sMsg[80];
            sprintf_s(sMsg, "\nSend GIN position x=%d, y=%d \n", 
            params.tek4010.GIN_x, params.tek4010.GIN_y);
            log->OutLog(sMsg);
        }
        // send the bytes back to program
        // original TEK4010 doc says that GIN mode sends back to program 
        // the status byte. Also <CR>, <CR><LF>, <CR><EOT> can be selected
        // (dip switches on terminal PCB cards) as terminator.

        // RG-512 RetroGraphics doc for AMD3A also says that the status 
        // bytes is sent to program, and the terminator is allways <CR>

        // BUT: DDXTEK driver does not expect status byte, nor <CR> terminator
        //      DDVRET (for DEC VT100+Retorgraphics, with is renamed to VT640) does
        //      not expect status byte but does expects <CR> terminator

        // PressKey(status); // do not send the status byte
        PressKey(HiX);
        PressKey(LoX);
        PressKey(HiY);
        PressKey(LoY);
        if (params.RG512.enabled) {
            PressKey(13); // DDVRET driver expects <CR> terninated
        } else {
            // DDXTEK driver expects no termination, just the data bytes
        }
		if(log) {
            log->OutLog("\nEnd of GIN pos \n");
        }
    }
    return 0; 
}



extern CPM* cpm;
#define ReadMemory16(m)        ((cpm->z80->memory[(m) & 0xFFFF]) + 256*(cpm->z80->memory[((m)+1) & 0xFFFF]))
#define WriteMemory16(m, d)    {cpm->z80->memory[(m) & 0xFFFF] = ((d) & 0xFF); cpm->z80->memory[((m)+1) & 0xFFFF] = ((d) >> 8); }
#define GetInPoint(addr,x,y)   {x=ReadMemory16(addr); addr += 2; \
                                y=ReadMemory16(addr); addr += 2; \
                                y=780-1-y; } // coords returned are 0..1023,0..779, (0,0) is upper left corner

void CONSOLE::GetMousePosInGIN()
{
    // get mouse position
    POINT p; 
	GetCursorPos(&p);
	ScreenToClient(hMain, &p);
	if ((p.x < 1) || (p.x >= screen_x_dots-1) ||
        (p.y < 1) || (p.y >= screen_y_dots-1)) {
        // mouse outside client area
        p.x=p.y=0; 
    }
    // convert mouse coords to device coords 0..1023, 0..779 home at lower left corner
    params.tek4010.GIN_x=p.x*1024 / screen_x_dots; 
    params.tek4010.GIN_y=p.y*780  / screen_y_dots; 
}

// Simulate GSX function

void CONSOLE::GSX_CALL(int ParamBlockAddr) 
{
    extern int GSX_mouse_read; 
    extern int GSX_color; 
    static int LogID = 0; // ID for log entries, just to keep track of then in log files

    static int BWColor = GSX_color;  // set to 1 to select internal GSX drive in color (=0 to select B/W)
    static int DrawMode; // 0=normal, 1=erase, 2=invert
    static int TextMode; // 0=normal, 1=Opaque char background
    static double TextScale;
    static int TextColor;
    static int LineColor;
    static int MarkerColor;
    static int MarkerType;
    static int MarkerHeight;
    static int FillColor; 
    static int FillMode; // 0=solid color, 1=pattern, 2=more patterns
    static int FillIndex; // 0=solid color, 1..6=pattern index number. Applies when FillMode > 0
    static int InputMode; // 2=Sample mode

    // trap BDOS call
    uint16 CONTRL = ReadMemory16(ParamBlockAddr + 0);
    uint16 INTIN  = ReadMemory16(ParamBlockAddr + 2);
    uint16 PTSIN  = ReadMemory16(ParamBlockAddr + 4);
    uint16 INTOUT = ReadMemory16(ParamBlockAddr + 6);
    uint16 PTSOUT = ReadMemory16(ParamBlockAddr + 8);
    uint16 func   = ReadMemory16(CONTRL + 0);
    uint16 NPTSIN  = ReadMemory16(CONTRL + 2); // number of input points
    uint16 NPTSOUT = CONTRL + 4; // addr of to store number of output points
    uint16 NINTIN  = ReadMemory16(CONTRL + 6); // number of input ints
    uint16 NINTOUT = CONTRL + 8; // addr of to store number of output ints
    uint16 special= ReadMemory16(CONTRL + 10);
    int n, addr, x,y,x0,y0,attrib; 

    WriteMemory16(NINTOUT,0); // init num of output values
    WriteMemory16(NPTSOUT,0); // init num of output points

    // set the cell size of a char. Note that this is NOT the font_x_dots, font_y_dots
    // the font_x/y_dots is used on Tek4010 processing (with a screen 74 x 35 chars)
    // for GSX, we use cell size size based on a 80 columns chars
    // it is calculated on each GSX call, so font size can be changed at any moment
    int cell_x_dots = ((1024+screen_x_size/2)/screen_x_size); // the cell size is the advance postion thaking into account that in 1024 horiz pixels fits 80 chars
    int cell_y_dots = ((font_y_dots + 1) * 780 / screen_y_dots) + 1;    

    if (func == 1) {
        // Open WorkStation

        // set color/SW
        BWColor = GSX_color; 
        TextScale =1.0;

        WriteMemory16(NINTOUT,45); // num of output values
        WriteMemory16(NPTSOUT,6); // num of output points

        // initial settings from input values
        n = ReadMemory16(INTIN+0); // device to open -> ignored, allways open internal GSX driver
        n = ReadMemory16(INTIN+2); // Line Style -> ignored, only one line style simulated
        LineColor=ReadMemory16(INTIN+4); 
        MarkerType=ReadMemory16(INTIN+6); 
        MarkerColor=ReadMemory16(INTIN+8); 
        n=ReadMemory16(INTIN+10); // text style -> ignored, only one text style simulated
        TextColor=ReadMemory16(INTIN+12); 
        FillMode=ReadMemory16(INTIN+14); // fill style 
        FillIndex=ReadMemory16(INTIN+16); // fill index 
        FillColor=ReadMemory16(INTIN+18); // fill color

        // init GSX state
        DrawMode=0; // normal draw mode
        TextMode=0; // Transparent background for text
        MarkerHeight=14; // default size
        InputMode=0; 

        addr=INTOUT;
        WriteMemory16(addr, 1024-1); addr+=2; // width of GSX screen
        WriteMemory16(addr,  780-1); addr+=2; // height of GSX screen
        WriteMemory16(addr,    1); addr+=2; // device NOT capable of continuous scalling
        WriteMemory16(addr,  198); addr+=2; // Width of a pixel, in thousandths of a millimetre.
        WriteMemory16(addr,  195); addr+=2; // Height of a pixel, in thousandths of a millimetre.
        WriteMemory16(addr,    1); addr+=2; // Number of character sizes, 0 for continuous sizing.
        WriteMemory16(addr,    1); addr+=2; // Number of line styles.
        WriteMemory16(addr,    1); addr+=2; // Number of line widths.
        WriteMemory16(addr,    5); addr+=2; // Number of marker styles.
        WriteMemory16(addr,    1); addr+=2; // Number of marker sizes.
        WriteMemory16(addr,    1); addr+=2; // Number of fonts. 
        WriteMemory16(addr,    6); addr+=2; // Number of fill patterns.
        WriteMemory16(addr,    6); addr+=2; // Number of fill hatch styles.
        WriteMemory16(addr,    BWColor ? 8:2); addr+=2; // Number of colors displayable at once.
        WriteMemory16(addr,    1); addr+=2; // Number of General Drawing Primitives(GDPs)
        WriteMemory16(addr, 1); addr+=2; // 1=bar (=filled area) available
        for (int i=1; i<10; i++) { WriteMemory16(addr, 0xFFFF); addr+=2; }
        WriteMemory16(addr, 3); addr+=2; // 3=filled area attributes 
        for (int i=1; i<10; i++) { WriteMemory16(addr, 0xFFFF); addr+=2; }
        WriteMemory16(addr,    BWColor ? 1:0); addr+=2; // 0 for black/white, 1 for color.
        WriteMemory16(addr,    0); addr+=2; // 0 if text rotation is not possible, 1 if it is.
        WriteMemory16(addr,    0); addr+=2; // 0 if filled areas are not possible, 1 if they are.
        WriteMemory16(addr,    0); addr+=2; // 0 if cannot read cell array, 1 if can.
        WriteMemory16(addr,    2); addr+=2; // Number of colors => Black and white
        WriteMemory16(addr,    1); addr+=2; // Number of locator devices (mice, tablets, lightpens)
        WriteMemory16(addr,    0); addr+=2; // Number of valuator devices
        WriteMemory16(addr,    0); addr+=2; // Number of choice devices
        WriteMemory16(addr,    1); addr+=2; // Number of string devices
        WriteMemory16(addr,    2); addr+=2; // Workstation type: 2 => Input and output

        addr=PTSOUT;
        WriteMemory16(addr,    0); addr+=2; // 
        WriteMemory16(addr,   (int) (cell_y_dots)); addr+=2; // Minimum character height in device coordinates
        WriteMemory16(addr,    0); addr+=2; // 
        WriteMemory16(addr,   (int) (cell_y_dots * TEK_BIG_FONT)); addr+=2; // maximum character height
        WriteMemory16(addr,    1); addr+=2; // minimum line width
        WriteMemory16(addr,    0); addr+=2; // 
        WriteMemory16(addr,    1); addr+=2; // max line width
        WriteMemory16(addr,    0); addr+=2; // 
        WriteMemory16(addr,    0); addr+=2; // 
        WriteMemory16(addr,   MarkerHeight); addr+=2; // minimum marker height
        WriteMemory16(addr,    0); addr+=2; // 
        WriteMemory16(addr,   MarkerHeight); addr+=2; // maximum marker height
        // init GrOverlay
        ExecCtrlSeqAction(CON_CUR_OFF,0,0,0);
        GSX_mouse_read=0;
        params.GrOverlay.enabled=1; 
        RequestRefreshScreen(1); // enabled gr screen -> full refresh to bring up any graphic

        if (params.GSX_driver_wellcome==0) {
            params.GSX_driver_wellcome=1; 
            PutString("---------------------------------------------------\r\n");
	        PutString("CPM Player GSX Driver                   Version 1.0\r\n");
	        PutString("Copyright (c) 2024 by Roberto Sancho               \r\n");
	        PutString("---------------------------------------------------\r\n");
        } 
        if (log) {
            char sMsg[100];
            sprintf_s(sMsg, "\n[GSX %d: Open WorkStation] \n", LogID++);
            log->OutLog(sMsg);
            if (cpm->log) cpm->log->OutLog(sMsg); 
        }
    } else if (func == 2) {
        // Close WorkStation
        ExecCtrlSeqAction(CON_CUR_ON,0,0,0);
        if (log) {
            char sMsg[100];
            sprintf_s(sMsg, "\n[GSX %d: Close WorkStation] \n", LogID++);
            log->OutLog(sMsg);
            if (cpm->log) cpm->log->OutLog(sMsg); 
        }
    } else if (func==3) { 
        // Clear Picture 
        ClearScreen_GrOverlay(); // just clear the graphic overlay (will call to RequestRefreshScreen(1))
        ExecCtrlSeqAction(CON_CLS, 0,0,0);
        if (log) {
            char sMsg[100];
            sprintf_s(sMsg, "\n[GSX %d: Clear Picture] \n", LogID++);
            log->OutLog(sMsg);
            if (cpm->log) cpm->log->OutLog(sMsg); 
        }
    } else if (func==4) { 
        // Output Graphics 
        // do nothing. Graphic overlay allways visible
        if (log) {
            char sMsg[100];
            sprintf_s(sMsg, "\n[GSX %d: Output Graphics: not implemented] \n", LogID++);
            log->OutLog(sMsg);
            if (cpm->log) cpm->log->OutLog(sMsg); 
        }
    } else if (func==5) { 
        // Escape 
        if (special==1) { // Get text screen size in characters
            WriteMemory16(NINTOUT,2); // num of output values
            addr=INTOUT;
            WriteMemory16(addr, screen_y_size); addr+=2; // num of addresable lines
            WriteMemory16(addr, screen_x_size); addr+=2; // num of columns lines
            if (log) {
                char sMsg[100];
                sprintf_s(sMsg, "\n[GSX %d: Escape: Enter graphic mode] \n", LogID++);
                log->OutLog(sMsg);
                if (cpm->log) cpm->log->OutLog(sMsg); 
            }
        } else if (special==2) { // Enter graphics mode
            // shows graphic overlay
            params.GrOverlay.enabled=1; 
            RequestRefreshScreen(1); // enabled gr screen -> full refresh to bring up any graphic
            if (log) {
                char sMsg[100];
                sprintf_s(sMsg, "\n[GSX %d: Escape: Enter graphic mode] \n", LogID++);
                log->OutLog(sMsg);
                if (cpm->log) cpm->log->OutLog(sMsg); 
            }
        } else if (special==3) { // Enter text mode 
            // hides graphic overlay
            params.GrOverlay.enabled=0; 
            RequestRefreshScreen(1); // disables gr screen -> full refresh to wipe out any graphic over the text chars
            if (log) {
                char sMsg[100];
                sprintf_s(sMsg, "\n[GSX %d: Escape: Enter text mode] \n", LogID++);
                log->OutLog(sMsg);
                if (cpm->log) cpm->log->OutLog(sMsg); 
            }
        } else if (special==4) { // Text cursor up
            ExecCtrlSeqAction(CON_UP,0,0,0);
            if (log) {
                char sMsg[100];
                sprintf_s(sMsg, "\n[GSX %d: Escape: Up] \n", LogID++);
                log->OutLog(sMsg);
                if (cpm->log) cpm->log->OutLog(sMsg); 
            }
        } else if (special==5) { // Text cursor down
            ExecCtrlSeqAction(CON_DOWN,0,0,0);
            if (log) {
                char sMsg[100];
                sprintf_s(sMsg, "\n[GSX %d: Escape: Down] \n", LogID++);
                log->OutLog(sMsg);
                if (cpm->log) cpm->log->OutLog(sMsg); 
            }
        } else if (special==6) { // Text cursor left
            ExecCtrlSeqAction(CON_LEFT,0,0,0);
            if (log) {
                char sMsg[100];
                sprintf_s(sMsg, "\n[GSX %d: Escape: Left] \n", LogID++);
                log->OutLog(sMsg);
                if (cpm->log) cpm->log->OutLog(sMsg); 
            }
        } else if (special==7) { // "Text cursor right
            ExecCtrlSeqAction(CON_RIGHT,0,0,0);
            if (log) {
                char sMsg[100];
                sprintf_s(sMsg, "\n[GSX %d: Escape: Home] \n", LogID++);
                log->OutLog(sMsg);
                if (cpm->log) cpm->log->OutLog(sMsg); 
            }
        } else if (special==8) { // Text cursor home
            ExecCtrlSeqAction(CON_HOME,0,0,0);
            if (log) {
                char sMsg[100];
                sprintf_s(sMsg, "\n[GSX %d: Escape: Home] \n", LogID++);
                log->OutLog(sMsg);
                if (cpm->log) cpm->log->OutLog(sMsg); 
            }
        } else if (special==9) { // Clear from text cursor to end of screen
            ExecCtrlSeqAction(CON_EOS,0,0,0);
            if (log) {
                char sMsg[100];
                sprintf_s(sMsg, "\n[GSX %d: Escape: Clear EOS] \n", LogID++);
                log->OutLog(sMsg);
                if (cpm->log) cpm->log->OutLog(sMsg); 
            }
        } else if (special==10) { // Clear from text cursor to end of line
            ExecCtrlSeqAction(CON_EOL,0,0,0);
            if (log) {
                char sMsg[100];
                sprintf_s(sMsg, "\n[GSX %d: Escape: Clear EOL] \n", LogID++);
                log->OutLog(sMsg);
                if (cpm->log) cpm->log->OutLog(sMsg); 
            }
        } else if (special==11) { // Move text cursor to coordinates 
            int row=ReadMemory16(INTIN+0); // row number
            int col=ReadMemory16(INTIN+2); // column number
            ExecCtrlSeqAction(CON_POS_XY,0,col-1,row-1);
            if (log) {
                char sMsg[100];
                sprintf_s(sMsg, "\n[GSX %d: Escape: Move text cursor to coordinates: x=%d, y=%d] \n", 
                    LogID++, col-1, row-1);
                log->OutLog(sMsg);
                if (cpm->log) cpm->log->OutLog(sMsg); 
            }
        } else if (special==12) { // Print to the text screen
            char c;
            n = NINTIN; 
            addr = INTIN; 
            while (n--) {
                c = (char) ReadMemory16(addr); addr+=2; 
                PutChar(c, (n==0) ? 1:0); 
            }
        } else if (special==13) { // Select reverse video
            ExecCtrlSeqAction(CON_REVERSE_ON,0,0,0);
            if (log) {
                char sMsg[100];
                sprintf_s(sMsg, "\n[GSX %d: Escape: Select reverse video] \n", LogID++);
                log->OutLog(sMsg);
                if (cpm->log) cpm->log->OutLog(sMsg); 
            }
        } else if (special==14) { // Cancel reverse video
            ExecCtrlSeqAction(CON_REVERSE_OFF,0,0,0);
            if (log) {
                char sMsg[100];
                sprintf_s(sMsg, "\n[GSX %d: Escape: Cancel reverse video] \n", LogID++);
                log->OutLog(sMsg);
                if (cpm->log) cpm->log->OutLog(sMsg); 
            }
        } else if (special==15) { // Return the coordinates of the text cursor
            WriteMemory16(NINTOUT,2); // num of output values
            addr=INTOUT;
            WriteMemory16(addr, 1+params.current_y_pos); addr+=2; // first row = 1
            WriteMemory16(addr, 1+params.current_x_pos); addr+=2; // first colun = 1           
            if (log) {
                char sMsg[100];
                sprintf_s(sMsg, "\n[GSX %d: Escape: Return the coordinates of the text cursor: x=%d, y=%d] \n", 
                    LogID++, params.current_x_pos, params.current_y_pos);
                log->OutLog(sMsg);
                if (cpm->log) cpm->log->OutLog(sMsg); 
            }
        } else if (special==16) { // Return tablet status
            WriteMemory16(NINTOUT,1); // num of output values
            addr=INTOUT;
            WriteMemory16(addr, 0); addr+=2; // no tablet attached 
            if (log) {
                char sMsg[100];
                sprintf_s(sMsg, "\n[GSX %d: Escape: Return tablet status: Not Implemented] \n", LogID++);
                log->OutLog(sMsg);
                if (cpm->log) cpm->log->OutLog(sMsg); 
            }
        } else if (special==17) { // Generate hardcopy
            // not implemented
            if (log) {
                char sMsg[100];
                sprintf_s(sMsg, "\n[GSX %d: Escape: Generate hardcopy: Not Implemented] \n", LogID++);
                log->OutLog(sMsg);
                if (cpm->log) cpm->log->OutLog(sMsg); 
            }
        } else if (special==18) { // Place graphic cursor/mouse pointer at coord 
            // not implemented
            if (log) {
                char sMsg[100];
                sprintf_s(sMsg, "\n[GSX %d: Escape: Place graphic cursor/mouse pointer at coord: Not Implemented] \n", LogID++);
                log->OutLog(sMsg);
                if (cpm->log) cpm->log->OutLog(sMsg); 
            }
        } else if (special==19) { // Remove the graphic cursor
            // not implemented
            if (log) {
                char sMsg[100];
                sprintf_s(sMsg, "\n[GSX %d: Escape: Remove the graphic cursor: Not Implemented] \n", LogID++);
                log->OutLog(sMsg);
                if (cpm->log) cpm->log->OutLog(sMsg); 
            }
        } else {
            if (log) {
                char sMsg[100];
                sprintf_s(sMsg, "\n[GSX %d: Escape: Unknown escape code %d] \n", LogID++, special);
                log->OutLog(sMsg);
                if (cpm->log) cpm->log->OutLog(sMsg); 
            }
        }
    } else if (func==6) { 
        // Draw a polyline 
        attrib = (DrawMode == 1) ? 16:0 + 
                 (DrawMode == 2) ? 32:0;
        if (BWColor) {
            attrib |= 128 + (LineColor << 8); // GSX in color mode
        } else if (LineColor==0) {
            // if B/W and drawing in color 0 -> Draw normal mode becomes erase mode, erase/xor mode mde becomes noop
            if (DrawMode==0) attrib |= 16; else attrib = 0xFFFF; 
        }
        // attrib = bit 4      = 16 -> erase 
        //          bit 5      = 32 -> xor for RG512 points
        //          bit 7      = 128 -> draw using color
        //          bits 8..10 = GSX color 0..7
        if (log) {
            char sMsg[100];
            sprintf_s(sMsg, "\n[GSX %d: Draw a polyline: attrib=%04x] \n", 
                LogID++,attrib);
            log->OutLog(sMsg);
            if (cpm->log) cpm->log->OutLog(sMsg); 
        }
        addr = PTSIN; 
        if (attrib == 0xFFFF) {
            // do not draw
        } else if (NPTSIN == 1) {
            // only one point -> draw a point
            GetInPoint(addr,x,y); 
            // the calling prog should use GSX coords (range x=0..32767, y=0..32767 home at lower left) 
            // calling BDS 115 calls GSX.SYS. Hexe, coords are to device driver coords (0..1023, 0..779 home at lower left)
            // these coords made available to driver in PTSIN array
            // here GetInPoint read the coords and convert to (0..1023, 0..779 home at UPPER left)
            DrawPoint_GrOverlay(x,y,attrib,1024,780); 
            if (log) {
                char sMsg[100];
                sprintf_s(sMsg, "[GSX %d: point (x=%d, y=%d)] \n", 
                    LogID-1,x,y);
                log->OutLog(sMsg);
                if (cpm->log) cpm->log->OutLog(sMsg); 
            }
        } else if (NPTSIN > 1) {
            // get initial point
            n=NPTSIN; 
            GetInPoint(addr,x0,y0); 
            while (--n) {
                // draw line to next point on PSTIN array
                GetInPoint(addr,x,y); 
                if ((x0==x) && (y0==y)) {
                    DrawPoint_GrOverlay(x,y,attrib,1024,780); 
                } else {
                    DrawVector_GrOverlay(x0,y0,x,y,attrib,1024,780); 
                    x0=x; y0=y; 
                }
                if (log) {
                    char sMsg[100];
                    sprintf_s(sMsg, "[GSX %d: line (x0=%d, y0=%d)-(x1=%d, y1=%d)] \n", 
                        LogID-1,x0,y0,x,y);
                    log->OutLog(sMsg);
                    if (cpm->log) cpm->log->OutLog(sMsg); 
                }
            }
        }
    } else if (func==7) { 
        // Plot a group of markers 
        attrib = (DrawMode == 1) ? 16:0 + 
                 (DrawMode == 2) ? 32:0;
        if (BWColor) {
            attrib |= 128 + (MarkerColor << 8); // GSX in color mode
        } else if (MarkerColor==0) {
            // if B/W and drawing in color 0 -> Draw normal mode becomes erase mode, erase/xor mode mde becomes noop
            if (DrawMode==0) attrib |= 16; else attrib = 0xFFFF; 
        }
        if (log) {
            char sMsg[100];
            sprintf_s(sMsg, "\n[GSX %d: Draw Marker: type %d, Height %d, attrib=%04x] \n", 
                   LogID++,MarkerType,MarkerHeight,attrib);
            log->OutLog(sMsg);
            if (cpm->log) cpm->log->OutLog(sMsg); 
        }
        int len=MarkerHeight/2; 
        addr = PTSIN; 
        n=NPTSIN; 
        if (attrib == 0xFFFF) n=0;
        while (n--) {
           GetInPoint(addr,x,y); 
           if (MarkerType == 5) {
                // draw a cross marker
                DrawVector_GrOverlay(x-len,y-len,x+len,y+len,attrib,1024,780); 
                DrawVector_GrOverlay(x-len,y+len,x+len,y-len,attrib,1024,780); 
           } else if (MarkerType == 4) {
                // draw a triangle marker
                DrawVector_GrOverlay(x-len,y+len,x+len,y+len,attrib,1024,780); 
                DrawVector_GrOverlay(x+len,y+len,x,y-len,attrib,1024,780); 
                DrawVector_GrOverlay(x,y-len,x-len,y+len,attrib,1024,780); 
           } else if (MarkerType == 3) {
                // draw a star marker
                DrawVector_GrOverlay(x-len,y-len,x+len,y+len,attrib,1024,780); 
                DrawVector_GrOverlay(x-len,y+len,x+len,y-len,attrib,1024,780); 
                DrawVector_GrOverlay(x-len,y,    x+len,y,    attrib,1024,780); 
                DrawVector_GrOverlay(x,    y-len,x,    y+len,attrib,1024,780); 
           } else if (MarkerType == 2) {
                // draw a plus marker
                DrawVector_GrOverlay(x-len,y,x+len,y,attrib,1024,780); 
                DrawVector_GrOverlay(x,y+len,x,y-len,attrib,1024,780); 
           } else {
                // draw a boxed marker
                DrawVector_GrOverlay(x-len,y-len,x+len,y-len,attrib,1024,780); 
                DrawVector_GrOverlay(x+len,y-len,x+len,y+len,attrib,1024,780); 
                DrawVector_GrOverlay(x+len,y+len,x-len,y+len,attrib,1024,780); 
                DrawVector_GrOverlay(x-len,y+len,x-len,y-len,attrib,1024,780); 
           }
           if (log) {
                char sMsg[100];
                sprintf_s(sMsg, "[GSX %d: Marker at (x1=%d, y1=%d)] \n", 
                    LogID-1,x,y);
                log->OutLog(sMsg);
                if (cpm->log) cpm->log->OutLog(sMsg); 
            }
        }
    } else if (func==8) { 
        // Draw Text 
        attrib = (DrawMode == 1) ? 16:0 +   // erasemode
                 (DrawMode == 2) ? 32:0 +   // xormode
                 (TextMode == 1) ? 8:0;     // opaque char background
        if (BWColor) {
            attrib |= 128 + (TextColor << 8); // GSX in color mode
        } else if (TextColor==0) {
            // if B/W and drawing in color 0 -> Draw normal mode becomes erase mode, erase/xor mode mde becomes noop
            if (DrawMode==0) attrib |= 16; else attrib = 0xFFFF; 
        }
        if (TextScale == TEK_SMALL_FONT) {
            attrib |= 1; 
        } else if (TextScale == TEK_BIG_FONT) {
            attrib |= 2; 
        }
        // attrib = bit 0..1   = 1 -> use small charset for tek4010 = 2 -> use big
        //          bit 3      = 8 -> charset Opaque background     
        char c; 
        addr = PTSIN; 
        GetInPoint(addr,x0,y0); 
        if (log) {
            char sMsg[100];
            sprintf_s(sMsg, "\n[GSX %d: Draw Text: at (x=%d, y=%d), attrib=%04x] \n", 
                   LogID++,x0,y0,attrib);
            log->OutLog(sMsg);
            if (cpm->log) cpm->log->OutLog(sMsg); 
        }
        n = NINTIN; x=x0; 
        if (attrib == 0xFFFF) n=0;
        addr = INTIN; 
        int x_step = (int) (cell_x_dots * TextScale + 0.5); // horizontar separation between chars
        if (TextScale < 1) x_step++;
        while (n--) {
            c = (char) ReadMemory16(addr); addr+=2; 
            // put printed char in screen.txt log
            if(screen_log) screen_log->OutLogByte(c);
            if(log) log->OutLogOneChar(c);
            // check the expect string against printed char code
            char sChIn[2]; sChIn[0]=c; sChIn[1]=0; 
            ExpectString(3, sChIn); 
            // terminate string print on any non-printable char
            if (c < 32) break; 
            y=y0-(780/24); if (y<0) y=0; // coord indicates lower left corner of char
            DrawChar_GrOverlay(x,y,x_step+2, c,attrib,1024,780);
            x+=x_step; // advance position taking into account that in 1024 horiz pixels fits 80 chars
        }
    } else if (func==9) { 
        // Draw a filled polygon -> just draw polygon outline
        attrib = (DrawMode == 1) ? 16:0 + 
                 (DrawMode == 2) ? 32:0;
        if (BWColor) {
            attrib |= 128 + (FillColor << 8); // GSX in color mode
        } else if (FillColor==0) {
            // if B/W and drawing in color 0 -> Draw normal mode becomes erase mode, erase/xor mode mde becomes noop
            if (DrawMode==0) attrib |= 16; else attrib = 0xFFFF; 
        }
        if (log) {
            char sMsg[100];
            sprintf_s(sMsg, "\n[GSX %d: Filled Polygon outline, attrib=%04x] \n", 
                   LogID++,attrib);
            log->OutLog(sMsg);
            if (cpm->log) cpm->log->OutLog(sMsg); 
        }
        addr = PTSIN; 
        if (attrib==0xFFFF) {
            // do not draw
        } else if (NPTSIN > 2) {
            // get initial point
            n=NPTSIN; 
            GetInPoint(addr,x0,y0); 
            while (--n) {
                // draw line to next point on PSTIN array
                GetInPoint(addr,x,y); 
                DrawVector_GrOverlay(x0,y0,x,y,attrib,1024,780); 
                if (log) {
                    char sMsg[100];
                    sprintf_s(sMsg, "[GSX %d: line (x0=%d, y0=%d)-(x1=%d, y1=%d)] \n", 
                        LogID-1,x0,y0,x,y);
                    log->OutLog(sMsg);
                    if (cpm->log) cpm->log->OutLog(sMsg); 
                }
                x0=x; y0=y; 
            }
            // close the polygon joining the starting point
            addr = PTSIN; 
            GetInPoint(addr,x,y); 
            DrawVector_GrOverlay(x0,y0,x,y,attrib,1024,780); 
            if (log) {
                char sMsg[100];
                sprintf_s(sMsg, "[GSX %d: line (x0=%d, y0=%d)-(x1=%d, y1=%d)] \n", 
                    LogID-1,x0,y0,x,y);
                log->OutLog(sMsg);
                if (cpm->log) cpm->log->OutLog(sMsg); 
            }
        }
    } else if (func==10) { 
        // Output color index array
        // not implemented
        if (log) {
            char sMsg[100];
            sprintf_s(sMsg, "\n[GSX %d: Output color index array: Not implemented] \n", LogID++);
            log->OutLog(sMsg);
            if (cpm->log) cpm->log->OutLog(sMsg); 
        }
    } else if (func==11) { 
        // General Drawing Primitive (GDP)
        // only Fill Area is implemented
        attrib = (DrawMode == 1) ? 16:0 + // erase mode
                 (DrawMode == 2) ? 32:0;  // xor mode
        if (BWColor) {
            attrib |= 128 + (FillColor << 8); // GSX in color mode
        } else if (FillColor==0) {
            // if B/W and drawing in color 0 -> Draw normal mode becomes erase mode, erase/xor mode mde becomes noop
            if (DrawMode==0) attrib |= 16; else attrib = 0xFFFF; 
        }
        if (attrib == 0xFFFF) {
            // do not draw
            if (log) {
                char sMsg[100];
                sprintf_s(sMsg, "\n[GSX %d: General Drawing Primitive %d: do not draw] \n", LogID++, special);
                log->OutLog(sMsg);
                if (cpm->log) cpm->log->OutLog(sMsg); 
            }
        } else if (special==1) { // FillArea
            addr = PTSIN; 
            GetInPoint(addr,x0,y0); // get oposite corners of area
            GetInPoint(addr,x,y); 
            // submit Fill/Erase/Xor Area command to queue
            if (FillMode==0) { // 0=transparent, 1=solid, 2=Pattern, 3=Hatch.
                // transparent bar -> draw the box outline
                if ((TextMode==1) && (DrawMode==0)) { 
                    // use opaque background -> erase background before setting the outline
                    FillArea_GrOverlay(x0,y0,x,y, attrib | 16, 1024,780);
                }
                DrawVector_GrOverlay(x0,y0,x,y0, attrib, 1024,780);
                DrawVector_GrOverlay(x,y0,x,y, attrib, 1024,780);
                DrawVector_GrOverlay(x,y,x0,y, attrib, 1024,780);
                DrawVector_GrOverlay(x0,y,x0,y0, attrib, 1024,780);
            } else if (FillMode==1) { 
                // no changes to attrib -> pattern=0 -> solid color
                FillArea_GrOverlay(x0,y0,x,y, attrib, 1024,780);
            } else {
                if ((TextMode==1) && (DrawMode==0)) { 
                    // use opaque background -> erase background before setting pattern
                    FillArea_GrOverlay(x0,y0,x,y, attrib | 16, 1024,780);
                }
                n = FillIndex & 7; if (n==0) n=1; // set pattern 1..6
                if (FillMode == 2) n += 6; // pattern 1..6 are for FillMode=3, patterns 7.. are for fillmode=2
                attrib |= n;
                FillArea_GrOverlay(x0,y0,x,y, attrib, 1024,780);
            }
            // patterns = bits 0..3  = pattern 0=solid color, 1..=pattern 1..
            //            bit 4      = 16 -> erase area
            //            bit 5      = 32 -> xor area
            //            bit 7      = 128 -> draw using color
            //            bits 8..10 = GSX fill color 0..7
            if (log) {
                char sMsg[100];
                sprintf_s(sMsg, "[GSX %d: General Drawing Primitive: FillArea (x0=%d, y0=%d)-(x1=%d, y1=%d), attrib=%04x] \n", 
                    LogID++,x0,y0,x,y,attrib);
                log->OutLog(sMsg);
                if (cpm->log) cpm->log->OutLog(sMsg); 
            }
        } else {
            if (log) {
                char sMsg[100];
                sprintf_s(sMsg, "[GSX %d: General Drawing Primitive: Unknow function %d] \n", 
                    LogID++,special);
                log->OutLog(sMsg);
                if (cpm->log) cpm->log->OutLog(sMsg); 
            }
        }
    } else if (func==12) { 
        // Set text size function 
        n=ReadMemory16(PTSIN); // 0
        n=ReadMemory16(PTSIN+2); // desired char height
        // DrDraw selects the smallest available font -> we don't use Tek small font
        if (n > cell_y_dots) {
            TextScale = TEK_BIG_FONT; 
        } else if ((n>0) && (n < cell_y_dots / 2)) {
            TextScale = TEK_SMALL_FONT; 
        } else {
            TextScale = 1.0; 
        }
        WriteMemory16(NPTSOUT,2);
        x=(int) (cell_x_dots * TextScale); 
        y=(int) (cell_y_dots * TextScale);
        // return 2 points: (width,height) of a W, (width,height) of a cell
        addr=PTSOUT; 
        WriteMemory16(addr, x*85/100); addr+=2; 
        WriteMemory16(addr, y*85/100); addr+=2; 
        WriteMemory16(addr, x); addr+=2; 
        WriteMemory16(addr, y); addr+=2; 
        if (log) {
            char sMsg[200];
            sprintf_s(sMsg, "[GSX %d: Set text size function: return (width=%d, height=%d) of a W, (width=%d, height=%d) of a cell] \n", 
                LogID++,x*85/100,y*85/100,x,y);
            log->OutLog(sMsg);
            if (cpm->log) cpm->log->OutLog(sMsg); 
        }
    } else if (func==13) { 
        // Set text direction 
        // not implemented
        if (log) {
            char sMsg[100];
            sprintf_s(sMsg, "\n[GSX %d: Set text direction: Not implemented] \n", LogID++);
            log->OutLog(sMsg);
            if (cpm->log) cpm->log->OutLog(sMsg); 
        }
    } else if (func==14) { 
        // Set color index (palette registers) 
        // not implemented
        if (log) {
            char sMsg[100];
            sprintf_s(sMsg, "\n[GSX %d: Set color index: Not implemented] \n", LogID++);
            log->OutLog(sMsg);
            if (cpm->log) cpm->log->OutLog(sMsg); 
        }
    } else if (func==15) { 
        // Set line style 
        // not implemented
        if (log) {
            char sMsg[100];
            sprintf_s(sMsg, "\n[GSX %d: Set line style: Not implemented] \n", LogID++);
            log->OutLog(sMsg);
            if (cpm->log) cpm->log->OutLog(sMsg); 
        }
    } else if (func==16) { 
        // Set line width 
        // not implemented
        if (log) {
            char sMsg[100];
            sprintf_s(sMsg, "\n[GSX %d: Set line width: Not implemented] \n", LogID++);
            log->OutLog(sMsg);
            if (cpm->log) cpm->log->OutLog(sMsg); 
        }
    } else if (func==17) { 
        // Set line color 
        n=LineColor=ReadMemory16(INTIN); 
        WriteMemory16(INTOUT, n); 
        if (log) {
            char sMsg[100];
            sprintf_s(sMsg, "\n[GSX %d: Set line color: color=%d] \n", LogID++,n);
            log->OutLog(sMsg);
            if (cpm->log) cpm->log->OutLog(sMsg); 
        }
    } else if (func==18) { 
        // Set marker type 
        n=MarkerType=ReadMemory16(INTIN); 
        WriteMemory16(INTOUT, n); 
        if (log) {
            char sMsg[100];
            sprintf_s(sMsg, "\n[GSX %d: Set marker type: MarkerType=%d] \n", LogID++,n);
            log->OutLog(sMsg);
            if (cpm->log) cpm->log->OutLog(sMsg); 
        }
    } else if (func==19) { 
        // Set marker height 
        n=MarkerHeight=ReadMemory16(INTIN); 
        WriteMemory16(INTOUT, n); 
        if (log) {
            char sMsg[100];
            sprintf_s(sMsg, "\n[GSX %d: Set marker height: height=%d] \n", LogID++,n);
            log->OutLog(sMsg);
            if (cpm->log) cpm->log->OutLog(sMsg); 
        }
    } else if (func==20) { 
        // Set marker color 
        n=MarkerColor=ReadMemory16(INTIN); 
        WriteMemory16(INTOUT, n); 
        if (log) {
            char sMsg[100];
            sprintf_s(sMsg, "\n[GSX %d: Set marker color: color=%d] \n", LogID++,n);
            log->OutLog(sMsg);
            if (cpm->log) cpm->log->OutLog(sMsg); 
        }
    } else if (func==21) { 
        // Set text font 
        // not implemented
        if (log) {
            char sMsg[100];
            sprintf_s(sMsg, "\n[GSX %d: Set line width: Not implemented] \n", LogID++);
            log->OutLog(sMsg);
            if (cpm->log) cpm->log->OutLog(sMsg); 
        }
    } else if (func==22) { 
        // Set text color 
        n=TextColor=ReadMemory16(INTIN); 
        WriteMemory16(INTOUT, n); 
        if (log) {
            char sMsg[100];
            sprintf_s(sMsg, "\n[GSX %d: Set text color: color=%d] \n", LogID++,n);
            log->OutLog(sMsg);
            if (cpm->log) cpm->log->OutLog(sMsg); 
        }
    } else if (func==23) { 
        // Set fill style 
        n=FillMode=ReadMemory16(INTIN); 
        WriteMemory16(INTOUT, n); 
        if (log) {
            char sMsg[100];
            sprintf_s(sMsg, "\n[GSX %d: Set fill style: %d] \n", LogID++, n);
            log->OutLog(sMsg);
            if (cpm->log) cpm->log->OutLog(sMsg); 
        }
    } else if (func==24) { 
        // Set fill index 
        n=FillIndex=ReadMemory16(INTIN); 
        WriteMemory16(INTOUT, n); 
        if (log) {
            char sMsg[100];
            sprintf_s(sMsg, "\n[GSX %d: Set fill index: %d] \n", LogID++, n);
            log->OutLog(sMsg);
            if (cpm->log) cpm->log->OutLog(sMsg); 
        }
    } else if (func==25) { 
        // Set fill color 
        n=FillColor=ReadMemory16(INTIN); 
        WriteMemory16(INTOUT, n); 
        if (log) {
            char sMsg[100];
            sprintf_s(sMsg, "\n[GSX %d: Set fill color: color=%d] \n", LogID++,n);
            log->OutLog(sMsg);
            if (cpm->log) cpm->log->OutLog(sMsg); 
        }
    } else if (func==26) { 
        // Inquire color representation (read palette)
        // not implemented
        if (log) {
            char sMsg[100];
            sprintf_s(sMsg, "\n[GSX %d: Inquire color representation: Not implemented] \n", LogID++);
            log->OutLog(sMsg);
            if (cpm->log) cpm->log->OutLog(sMsg); 
        }
    } else if (func==27) { 
        // Inquire cell array
        // not implemented
        if (log) {
            char sMsg[100];
            sprintf_s(sMsg, "\n[GSX %d: Inquire cell array: Not implemented] \n", LogID++);
            log->OutLog(sMsg);
            if (cpm->log) cpm->log->OutLog(sMsg); 
        }
    } else if (func==28) { 
        // Read locator 
        // wait for mouse click or keypress
        // return PTSOUT=mouse coordinates when key/button pressed;
        //        INTOUT=key pressed, or mouse button + $20 (terminator)
        char c, terminator; 
        // Mouse imput in request mode: return on mour button click/key pressed
        // read key from keyboard (blocking read);
        // left mouse click will return 32 (button 1 code)
        // enter key will return 32 (button 2 code)
        if (InputMode==2) { 
            // Mouse input in sample mode. read current mouse state without blocking 
            n=GetKeyStatus(0); 
            if (n) { 
                // there are a key pressed (can be a mouse button clicked (that generates a keypress))
                terminator = GetKey();
            } else {
                // no key pressed (nor mouse button clicked)
                terminator = 0; 
            }
        } else {
            // set mouse cross hair to notify the user the applic is waiting for mouse keypress
            HCURSOR hCur = LoadCursor(NULL, IDC_CROSS); 

            SetCursor(hCur); 
            SetClassLongPtr(hMain, GCLP_HCURSOR, (LONG_PTR) hCur);
            // set read mode, so Main thres can process the events WM_CHAR and WM_LMOUSECLICK acording to this
            GSX_mouse_read=1; c=0;
          	for(;;) {
                // update GIN position so if user press Alt-I he will see the current mouse pos
                GetMousePosInGIN();
                if (params.terminated) break;
                if (cpm->terminate_cpm_requested) break; 
		        c = GetKeyStatus(1);
		        if (c > 0) break;
		        Sleep(40); // wait for a key press
	        }
		    terminator = c;
            GSX_mouse_read=0; 
            // restore normal mouse
            hCur = LoadCursor(NULL, IDC_ARROW); 
            SetCursor(hCur); 
            SetClassLongPtr(hMain, GCLP_HCURSOR, (LONG_PTR) hCur);
        }
        // get mouse position
        // we check if there is a mouse click sent with
        x=y=0;
        if (terminator) {
            // there is a terminator key, check is xsub is feeding a mouse pos with
            // ;sent #btn #x #y   --> btn=32..34 for button 1..3 pressed, x=1..80 y=1..25
            x= cpm->return_xsub_pending_char(); // get x,y coord of mouse click. maps to screen
            y= cpm->return_xsub_pending_char(); // 1,1 is top left corner; 80,25 is lower right corner, depending on columns/rows of ascii screen
        } 
        if ((x>0) && (y>0)) { 
            // there are 2 chars for mouse position!. Process them as position in text screen as row/col
            // convert x,y to device coords: 0..1023,0..779 home at lower left corner
            x=(x-1)*1024 / screen_x_size; if (x>=1024) x=1024-1; 
            y=(y-1)*780 / screen_y_size; if (y>=780) y=780-1; 
            params.tek4010.GIN_x=x;
            params.tek4010.GIN_y=y;
        } else {
            // read mouse position
            GetMousePosInGIN(); 
        }
        // output mouse read values
        // return PTSOUT=mouse coordinates when key/button pressed;
        //        INTOUT=key pressed, or mouse button + $20 (terminator)
        WriteMemory16(NINTOUT, 1); 
        WriteMemory16(INTOUT, terminator); 
        WriteMemory16(NPTSOUT, 1); 
        addr=PTSOUT; 
        WriteMemory16(addr, params.tek4010.GIN_x); addr+=2; 
        WriteMemory16(addr, 779-params.tek4010.GIN_y); addr+=2; 
        if (log) {
            char sMsg[100];
            sprintf_s(sMsg, "\n[GSX %d: read locator: terminator=%d, x=%d, y=%d] \n", 
                LogID++, terminator, params.tek4010.GIN_x, params.tek4010.GIN_y);
            log->OutLog(sMsg);
            if (cpm->log) cpm->log->OutLog(sMsg); 
        }
    } else if (func==29) { 
        // Read valuator 
        // not implemented
        if (log) {
            char sMsg[100];
            sprintf_s(sMsg, "\n[GSX %d: Read valuator: Not implemented] \n", LogID++);
            log->OutLog(sMsg);
            if (cpm->log) cpm->log->OutLog(sMsg); 
        }
    } else if (func==30) { 
        // Read choice 
        // not implemented
        if (log) {
            char sMsg[100];
            sprintf_s(sMsg, "\n[GSX %d: Read choice: Not implemented] \n", LogID++);
            log->OutLog(sMsg);
            if (cpm->log) cpm->log->OutLog(sMsg); 
        }
    } else if (func==31) { 
        // Read string from keyboard
        // not implemented
        if (log) {
            char sMsg[100];
            sprintf_s(sMsg, "\n[GSX %d: Read string: Not implemented] \n", LogID++);
            log->OutLog(sMsg);
            if (cpm->log) cpm->log->OutLog(sMsg); 
        }
    } else if (func==32) { 
        // Set writing Mode 
        n = ReadMemory16(INTIN); // 1=replace (draw text erasing char background = OPAQUE GDI mode=
                                 // 2=overstrike (draw text without erasing char background = TRANSPARENT GDI mode)
                                 // 3=complement (XOR mode)
                                 // 4=erase mode
        if (n==3) {
            // XOR mode
            TextMode=0; // transparent text background
            DrawMode=2; // 0= normal, 1=erase, 2=xor
        } else if (n==4) {
            // Erase Mode
            TextMode=1; // opaque text background
            DrawMode=1; // 0= normal, 1=erase, 2=xor
        } else if (n==2) {
            // overstrike
            TextMode=0; // transparent text background
            DrawMode=0; // 0= normal, 1=erase, 2=xor
        } else {
            TextMode=1; // 1=Opaque char background
            DrawMode=0; // 0= normal, 1=erase, 2=xor
        }
        WriteMemory16(INTOUT, n); 
        if (log) {
            char sMsg[100];
            sprintf_s(sMsg, "\n[GSX %d: Set writing Mode: Mode=%d] \n", LogID++, n);
            log->OutLog(sMsg);
            if (cpm->log) cpm->log->OutLog(sMsg); 
        }
    } else if (func==33) { 
        // Set input mode 
        n = ReadMemory16(INTIN); 
        if (n==1) { // mouse
            InputMode = ReadMemory16(INTIN); // 1=request, 2=sample
        }
        WriteMemory16(INTOUT, n); 
        if (log) {
            char sMsg[100];
            sprintf_s(sMsg, "\n[GSX %d: Set input Mode: device=%d, Mode=%d] \n", LogID++, n, InputMode);
            log->OutLog(sMsg);
            if (cpm->log) cpm->log->OutLog(sMsg); 
        }
    } else {
        if (log) {
            char sMsg[100];
            sprintf_s(sMsg, "\n[GSX %d: unknow GSX function %d] \n", LogID++, func);
            log->OutLog(sMsg);
            if (cpm->log) cpm->log->OutLog(sMsg); 
        }
    }
}


bool CPM::gsx_BDOS(uint16 CallerPC, int RegDE)
{
    console->GSX_CALL(RegDE); 
    if (0) {
        // trace GSX calls. After each GSX call PAUSE is automatically set. 
        // Press Alt-P to resumen z80 cpu execution
        console->paused=1; 
        return 0; 
    }
    return 1; 
}

void CPM::gsx_log(uint16 CallerPC, uint16 RegDE)
{
    if (!log) return; 
    
    char string[256];
    char sIntIn[100] = {0};
    char sPtsIn[100] = {0};
    char sIntOut[100] = {0};
    char sPtsOut[100] = {0};
    int i,x,y; 
    char c; 
    int ret; 

    extern CPM* cpm;
    static uint16 ParamBlockAddr; 

    if ((CallerPC == 0) && (RegDE == 0)) {
        // returning from GSX call. ParamBlockAddr already set 
        ret=1; 
    } else {
        ParamBlockAddr=RegDE; 
    	sprintf_s(string, "BDOS Call 115 GSX Function (DE=$%04x, Caller PC=$%04x)\n", ParamBlockAddr, CallerPC);
	    log->OutLog(string);
        ret=0; 
    }

    uint16 CONTRL = ReadMemory16(ParamBlockAddr + 0);
    uint16 INTIN  = ReadMemory16(ParamBlockAddr + 2);
    uint16 PTSIN  = ReadMemory16(ParamBlockAddr + 4);
    uint16 INTOUT = ReadMemory16(ParamBlockAddr + 6);
    uint16 PTSOUT = ReadMemory16(ParamBlockAddr + 8);
    uint16 func   = ReadMemory16(CONTRL + 0);
    uint16 NPTSIN = ReadMemory16(CONTRL + 2); if (NPTSIN > 40) NPTSIN=10; 
    uint16 NPTSOUT= ReadMemory16(CONTRL + 4); if (NPTSOUT > 40) NPTSOUT=10; 
    uint16 NINTIN = ReadMemory16(CONTRL + 6); if (NINTIN > 40) NINTIN=10; 
    uint16 NINTOUT= ReadMemory16(CONTRL + 8); if (NINTOUT > 40) NINTOUT=10; 
    uint16 special= ReadMemory16(CONTRL + 10);
    if (ret==0) {
	    sprintf_s(string, "      $%04x: PARAMB: CONTLR=$%04x, INTIN=$%04x, PTSIN=$%04x, INTOUT=$%04x, PTSOUT=$%04x \n", 
            ParamBlockAddr, CONTRL, INTIN, PTSIN, INTOUT, PTSOUT);
    	log->OutLog(string);
        sprintf_s(string, "      $%04x: CONTLR: func=$%04x, \n"
                          "                     #PTSIN=$%04x, #PTSOUT=$%04x, #INTIN=$%04x, #INTOUT=$%04x, \n"
                          "                     special=$%04x \n", 
            CONTRL, func, NPTSIN, NPTSOUT, NINTIN, NINTOUT, special);
	    log->OutLog(string);
    }

    // load input array data 
    uint16 INTINdata[100] = {0}; 
    int16 PTSINdata[100] = {0}; 
    for (i=0; i<99; i++) {
        if (i >= NINTIN) break; 
        INTINdata[i]=ReadMemory16(INTIN + i*2);
    }
    for (i=0; i<99; i++) {
        if (i >= NPTSIN*2) break; 
        PTSINdata[i]=((int16) (ReadMemory16(PTSIN + i*2))); 
    }
    // load output array data 
    uint16 INTOUTdata[100] = {0}; 
    int16 PTSOUTdata[100] = {0}; 
    for (i=0; i<99; i++) {
        if (i >= NINTOUT) break; 
        INTOUTdata[i]=ReadMemory16(INTOUT + i*2);
    }
    for (i=0; i<99; i++) {
        if (i >= NPTSOUT*2) break; 
        PTSOUTdata[i]=((int16) (ReadMemory16(PTSOUT + i*2))); 
    }

    if (func==1) { 
        sprintf_s(string, "   Open WorkStation function %d %s \n", func, ret ? "(return)":"");
        log->OutLog(string);
        if (ret==0) {
            sprintf_s(string, "      $%04x: INTIN:  device_number = %d \n", INTIN + 0*2, INTINdata[0]); log->OutLog(string);
            sprintf_s(string, "      $%04x:         line_style = %d \n",    INTIN + 1*2, INTINdata[1]); log->OutLog(string);
            sprintf_s(string, "      $%04x:         line_color = %d \n",   INTIN + 2*2, INTINdata[2]); log->OutLog(string);
            sprintf_s(string, "      $%04x:         marker_style = %d \n",  INTIN + 3*2, INTINdata[3]); log->OutLog(string);
            sprintf_s(string, "      $%04x:         marker_color = %d \n", INTIN + 4*2, INTINdata[4]); log->OutLog(string);
            sprintf_s(string, "      $%04x:         text_style = %d \n",    INTIN + 5*2, INTINdata[5]); log->OutLog(string);
            sprintf_s(string, "      $%04x:         text_color = %d \n",   INTIN + 6*2, INTINdata[6]); log->OutLog(string);
            sprintf_s(string, "      $%04x:         fill_style = %d \n",    INTIN + 7*2, INTINdata[7]); log->OutLog(string);
            sprintf_s(string, "      $%04x:         fill_index = %d \n",    INTIN + 8*2, INTINdata[8]); log->OutLog(string);
            sprintf_s(string, "      $%04x:         fill_color = %d \n",   INTIN + 9*2, INTINdata[9]); log->OutLog(string);
        } else {
            sprintf_s(string, "      $%04x: INTOUT: Screen width (device coordinates) = %d \n", INTOUT + 0*2, INTOUTdata[0]); log->OutLog(string);
            sprintf_s(string, "      $%04x:         Screen height (device coordinates) = %d \n", INTOUT + 1*2, INTOUTdata[1]); log->OutLog(string);
            sprintf_s(string, "      $%04x:         device is fixed scaling (CRT) = %d \n", INTOUT + 2*2, INTOUTdata[2]); log->OutLog(string);
            sprintf_s(string, "      $%04x:         pixel width (umeters) = %d \n", INTOUT + 3*2, INTOUTdata[3]); log->OutLog(string);
            sprintf_s(string, "      $%04x:         pixel height (umeters) = %d \n", INTOUT + 4*2, INTOUTdata[4]); log->OutLog(string);
            sprintf_s(string, "      $%04x:         Num of character sizes = %d \n", INTOUT + 5*2, INTOUTdata[5]); log->OutLog(string);
            sprintf_s(string, "      $%04x:         Num of line styles = %d \n", INTOUT + 6*2, INTOUTdata[6]); log->OutLog(string);
            sprintf_s(string, "      $%04x:         Num of line widths = %d \n", INTOUT + 7*2, INTOUTdata[7]); log->OutLog(string);
            sprintf_s(string, "      $%04x:         Num of marker styles = %d \n", INTOUT + 8*2, INTOUTdata[8]); log->OutLog(string);
            sprintf_s(string, "      $%04x:         Num of marker sizes = %d \n", INTOUT + 9*2, INTOUTdata[9]); log->OutLog(string);
            sprintf_s(string, "      $%04x:         Num of fonts = %d \n", INTOUT + 10*2, INTOUTdata[10]); log->OutLog(string);
            sprintf_s(string, "      $%04x:         Num of patterns = %d \n", INTOUT + 11*2, INTOUTdata[11]); log->OutLog(string);
            sprintf_s(string, "      $%04x:         Num of hatch styles = %d \n", INTOUT + 12*2, INTOUTdata[12]); log->OutLog(string);
            sprintf_s(string, "      $%04x:         Num of colors = %d \n", INTOUT + 13*2, INTOUTdata[13]); log->OutLog(string);
            sprintf_s(string, "      $%04x:         Num of General Drawing Primitives = %d \n", INTOUT + 14*2, INTOUTdata[14]); log->OutLog(string);
            sprintf_s(string, "      $%04x:         General Drawing Primitives numbers: ", INTOUT + 15*2); log->OutLog(string);
            for (i=0; i<20; i++) {
                c = memory[(INTOUT + 15*2 + i) & 0xFFFF]; 
                sprintf_s(string, "$%02x ", (uint8) c); 
                log->OutLog(string); 
            }
            log->OutLog("\n");
            sprintf_s(string, "      $%04x:         General Drawing Primitives attributes: ", INTOUT + 20+15*2); log->OutLog(string);
            for (i=0; i<20; i++) {
                c = memory[(INTOUT + 20+15*2 + i) & 0xFFFF]; 
                sprintf_s(string, "$%02x ", (uint8) c); 
                log->OutLog(string); 
            }
            log->OutLog("\n");
            sprintf_s(string, "      $%04x:         color = %d \n", INTOUT + 0+40+15*2, INTOUTdata[0+40+15*2]); log->OutLog(string);
            sprintf_s(string, "      $%04x:         can rotate text = %d \n", INTOUT + 1+40+15*2, INTOUTdata[1+40+15*2]); log->OutLog(string);
            sprintf_s(string, "      $%04x:         can fill areas = %d \n", INTOUT + 2+40+15*2, INTOUTdata[2+40+15*2]); log->OutLog(string);
            sprintf_s(string, "      $%04x:         can read cell array = %d \n", INTOUT + 3+40+15*2, INTOUTdata[3+40+15*2]); log->OutLog(string);
            sprintf_s(string, "      $%04x:         Number of colors = %d \n", INTOUT + 4+40+15*2, INTOUTdata[4+40+15*2]); log->OutLog(string);
            sprintf_s(string, "      $%04x:         Number of locator devices = %d \n", INTOUT + 5+40+15*2, INTOUTdata[5+40+15*2]); log->OutLog(string);
            sprintf_s(string, "      $%04x:         Number of valuator devices = %d \n", INTOUT + 6+40+15*2, INTOUTdata[6+40+15*2]); log->OutLog(string);
            sprintf_s(string, "      $%04x:         Number of choice devices = %d \n", INTOUT + 7+40+15*2, INTOUTdata[7+40+15*2]); log->OutLog(string);
            sprintf_s(string, "      $%04x:         Number of string devices = %d \n", INTOUT + 7+40+15*2, INTOUTdata[8+40+15*2]); log->OutLog(string);
            sprintf_s(string, "      $%04x:         Workstation type = %d \n", INTOUT + 8+40+15*2, INTOUTdata[9+40+15*2]); log->OutLog(string);

            sprintf_s(string, "      $%04x: PTSOUT: dummy = %d \n",                                     PTSOUT + 0*2, PTSOUTdata[0]); log->OutLog(string);
            sprintf_s(string, "      $%04x:         min character height (device coordinates) = %d \n", PTSOUT + 1*2, PTSOUTdata[1]); log->OutLog(string);
            sprintf_s(string, "      $%04x:         dummy = %d \n",                                     PTSOUT + 2*2, PTSOUTdata[2]); log->OutLog(string);
            sprintf_s(string, "      $%04x:         max character height (device coordinates) = %d \n", PTSOUT + 3*2, PTSOUTdata[3]); log->OutLog(string);
            sprintf_s(string, "      $%04x:         min lin width (device coordinates) = %d \n",        PTSOUT + 4*2, PTSOUTdata[4]); log->OutLog(string);
            sprintf_s(string, "      $%04x:         dummy = %d \n",                                     PTSOUT + 5*2, PTSOUTdata[5]); log->OutLog(string);
            sprintf_s(string, "      $%04x:         max lin width (device coordinates) = %d \n",        PTSOUT + 6*2, PTSOUTdata[6]); log->OutLog(string);
            sprintf_s(string, "      $%04x:         dummy = %d \n",                                     PTSOUT + 7*2, PTSOUTdata[7]); log->OutLog(string);
            sprintf_s(string, "      $%04x:         dummy = %d \n",                                     PTSOUT + 8*2, PTSOUTdata[8]); log->OutLog(string);
            sprintf_s(string, "      $%04x:         min marker height (device coordinates) = %d \n",    PTSOUT + 9*2, PTSOUTdata[9]); log->OutLog(string);
            sprintf_s(string, "      $%04x:         dummy = %d \n",                                     PTSOUT +10*2, PTSOUTdata[10]); log->OutLog(string);
            sprintf_s(string, "      $%04x:         max marker height (device coordinates) = %d \n",    PTSOUT +11*2, PTSOUTdata[11]); log->OutLog(string);
        }
    } else if (func==2) { 
        sprintf_s(string, "   Close WorkStation function %d %s \n", func, ret ? "(return)":"");
        log->OutLog(string);
    } else if (func==3) { 
        sprintf_s(string, "   Clear Picture function %d %s \n", func, ret ? "(return)":"");
        log->OutLog(string);
    } else if (func==4) { 
        sprintf_s(string, "   Output Graphics function %d %s \n", func, ret ? "(return)":"");
        log->OutLog(string);
    } else if (func==5) { 
        sprintf_s(string, "   Escape (special = %d) %s \n", special, ret ? "(return)":"");
        log->OutLog(string);
        if (ret==0) {
            int sv_NINTIN=NINTIN; NINTIN=0; NPTSIN=0; 
            if (special==1) strcpy_s(string, "Get text screen size in characters"); else 
            if (special==2) strcpy_s(string, "Enter graphics mode"); else 
            if (special==3) strcpy_s(string, "Enter text mode"); else 
            if (special==4) strcpy_s(string, "Text cursor up"); else 
            if (special==5) strcpy_s(string, "Text cursor down"); else 
            if (special==6) strcpy_s(string, "Text cursor left"); else 
            if (special==7) strcpy_s(string, "Text cursor right"); else 
            if (special==8) strcpy_s(string, "Text cursor home"); else 
            if (special==9) strcpy_s(string, "Clear from text cursor to end of screen"); else 
            if (special==10) strcpy_s(string, "Clear from text cursor to end of line"); else 
            if (special==11) { strcpy_s(string, "Move text cursor to coordinates "); 
                               NINTIN=2;
                               strcpy_s(sIntIn, "cursor coords"); } else 
            if (special==12) { strcpy_s(string, "Print to the text screen"); 
                               NINTIN=sv_NINTIN; 
                               strcpy_s(sIntIn, "string to print"); } else 
            if (special==13) strcpy_s(string, "Select reverse video"); else 
            if (special==14) strcpy_s(string, "Cancel reverse video"); else 
            if (special==15) strcpy_s(string, "Return the coordinates of the text cursor"); else 
            if (special==16) strcpy_s(string, "Is a tablet (or mouse) available?"); else 
            if (special==17) strcpy_s(string, "Dump screen to the printer"); else 
            if (special==18) { strcpy_s(string, "Place graphic cursor/mouse pointer at coord "); 
                               NPTSIN=2;
                               strcpy_s(sPtsIn, "coords x,y"); } else 
            if (special==19) strcpy_s(string, "Remove the graphic cursor"); else strcpy_s(string, "Unknown Escape code"); 
            log->OutLog("   ");
            log->OutLog(string);
            log->OutLog("\r\n");
            goto PrtIn; 
        } else {
            if (special==1)  strcpy_s(sIntOut, "text screen height and width"); else 
            if (special==15) strcpy_s(sIntOut, "current text cursor position "); else 
            if (special==16) strcpy_s(sIntOut, "Is a tablet (or mouse) available?");  
            goto PrtOut; 
        }
    } else if (func==6) { 
        sprintf_s(string, "   Draw a polyline function %d %s \n", func, ret ? "(return)":"");
        log->OutLog(string);
        if (ret==0) {
            NINTIN=0;
            goto PrtIn; 
        }
    } else if (func==7) { 
        sprintf_s(string, "   Plot a group of markers function %d %s \n", func, ret ? "(return)":"");
        log->OutLog(string);
        if (ret==0) {
            NINTIN=0;
            goto PrtIn; 
        }
    } else if (func==8) { 
        sprintf_s(string, "   Draw Text function %d %s \n", func, ret ? "(return)":"");
        log->OutLog(string);
        strcpy_s(sIntIn, "string to draw (#INTIN = number of chars)");
        if (ret==0) {
            NPTSIN=1;
            goto PrtIn; 
        }
    } else if (func==9) { 
        sprintf_s(string, "   Draw a filled polygon function %d %s \n", func, ret ? "(return)":"");
        log->OutLog(string);
        if (ret==0) {
            NINTIN=0;
            goto PrtIn; 
        }
    } else if (func==11) { 
        sprintf_s(string, "   General Drawing Primitive function %d %s \n", func, ret ? "(return)":"");
        log->OutLog(string);
        if (ret==0) {
            if (special==1) {
                NINTIN=0; NPTSIN=2;
                sprintf_s(string, "      Filled bar (PTSIN = opposite corners) \n"); 
            } else if (special == 2) {
                NINTIN=2; NPTSIN=4;
                sprintf_s(string, "      Arc (INTIN = start angle, end angle; PTSIN = centre, start point, end point, radius) \n"); 
            } else if (special == 3) {
                NINTIN=2; NPTSIN=4;
                sprintf_s(string, "      Pie slice (INTIN = start angle, end angle; PTSIN = centre, start point, end point, radius) \n"); 
            } else if (special == 4) {
                NINTIN=0; NPTSIN=3;
                sprintf_s(string, "      Filled circle (PTSIN = centre, start point, end point, radius) \n"); 
            } else if (special == 5) {
                NPTSIN=1;
                sprintf_s(string, "      Draw Text (INTIN = string, end angle; PTSIN = position) \n"); 
            } else {
                sprintf_s(string, "      Unknown Primitive ID in special");
            }
            log->OutLog(string);
            goto PrtIn; 
        }
    } else if (func==12) { 
        sprintf_s(string, "   Set text size function %d %s \n", func, ret ? "(return)":"");
        log->OutLog(string);
        if (ret==0) {
            NINTIN=0;
            NPTSIN=1;
            strcpy_s(sPtsIn, "heigh"); 
            goto PrtIn; 
        } else {
            strcpy_s(sPtsOut, "(width,height) of a W, (width,height) of a cell");
            goto PrtOut; 
        }
    } else if (func==13) { 
        sprintf_s(string, "   Set text direction %d %s \n", func, ret ? "(return)":"");
        log->OutLog(string);
        if (ret==0) {
            NINTIN=3;
            NPTSIN=0;
            strcpy_s(sPtsIn, "Angle to turn, 100 cos (angle), 100 sin (angle)"); 
            goto PrtIn; 
        }
    } else if (func==14) { 
        sprintf_s(string, "   Set color index (palette registers) function %d %s \n", func, ret ? "(return)":"");
        log->OutLog(string);
        if (ret==0) {
            NINTIN=4;
            NPTSIN=0;
            strcpy_s(sPtsIn, "Col Number, red, green, blue"); 
            goto PrtIn; 
        }
    } else if (func==15) { 
        sprintf_s(string, "   Set line style function %d %s \n", func, ret ? "(return)":"");
        log->OutLog(string);
        if (ret==0) { NINTIN=1; NPTSIN=0; goto PrtIn; }
    } else if (func==16) { 
        sprintf_s(string, "   Set line width function %d %s \n", func, ret ? "(return)":"");
        log->OutLog(string);
        if (ret==0) { NINTIN=0; NPTSIN=1; goto PrtIn; }
    } else if (func==17) { 
        sprintf_s(string, "   Set line color function %d %s \n", func, ret ? "(return)":"");
        log->OutLog(string);
        if (ret==0) { NINTIN=1; NPTSIN=0; goto PrtIn; }
    } else if (func==18) { 
        sprintf_s(string, "   Set marker type function %d %s \n", func, ret ? "(return)":"");
        log->OutLog(string);
        if (ret==0) { NINTIN=1; NPTSIN=0; goto PrtIn; }
    } else if (func==19) { 
        sprintf_s(string, "   Set marker height function %d %s \n", func, ret ? "(return)":"");
        log->OutLog(string);
        if (ret==0) { NINTIN=0; NPTSIN=1; goto PrtIn; }
    } else if (func==20) { 
        sprintf_s(string, "   Set marker color function %d %s \n", func, ret ? "(return)":"");
        log->OutLog(string);
        if (ret==0) { NINTIN=1; NPTSIN=0; goto PrtIn; }
    } else if (func==21) { 
        sprintf_s(string, "   Set text font function %d %s \n", func, ret ? "(return)":"");
        log->OutLog(string);
        if (ret==0) { NINTIN=1; NPTSIN=0; goto PrtIn; }
    } else if (func==22) { 
        sprintf_s(string, "   Set text color function %d %s \n", func, ret ? "(return)":"");
        log->OutLog(string);
        if (ret==0) { NINTIN=1; NPTSIN=0; goto PrtIn; }
    } else if (func==23) { 
        sprintf_s(string, "   Set fill style function %d %s \n", func, ret ? "(return)":"");
        log->OutLog(string);
        if (ret==0) {
            NINTIN=1; NPTSIN=0; 
            strcpy_s(sIntIn, "0=transparent, 1=solid, 2=Pattern, 3=Hatch"); 
            goto PrtIn; 
        }
    } else if (func==24) { 
        sprintf_s(string, "   Set fill index function %d %s \n", func, ret ? "(return)":"");
        log->OutLog(string);
        if (ret==0) {
            NINTIN=1; NPTSIN=0; 
            strcpy_s(sIntIn, "used only for fill styles 2=Pattern and 3=Hatch"); 
            goto PrtIn; 
        }
    } else if (func==25) { 
        sprintf_s(string, "   Set fill color function %d %s \n", func, ret ? "(return)":"");
        log->OutLog(string);
        if (ret==0) {
            NINTIN=1; NPTSIN=0; 
            goto PrtIn; 
        }
    } else if (func==28) { 
        sprintf_s(string, "   Read locator function %d %s \n", func, ret ? "(return)":"");
        log->OutLog(string);
        if (ret==0) {
            NINTIN=1; if (NPTSIN>0) NPTSIN=1; 
            strcpy_s(sIntIn, "locator number"); 
            strcpy_s(sPtsIn, "initial coordinates"); 
            goto PrtIn; 
        } else {
            strcpy_s(sIntOut, "terminator (key pressed, or mouse button + 32)"); 
            strcpy_s(sPtsOut, "coordinates where botton pressed"); 
            goto PrtOut; 
        }
    } else if (func==29) { 
        sprintf_s(string, "   Read valuator function %d %s \n", func, ret ? "(return)":"");
        log->OutLog(string);
        if (ret==0) {
            if (NINTIN>1) NINTIN=2; 
            NPTSIN=0; 
            strcpy_s(sIntIn, "valuator number, initial value"); 
            goto PrtIn; 
        } else {
            strcpy_s(sIntOut, "final value, terminator (key pressed, or mouse button + 32)"); 
            goto PrtOut; 
        }
    } else if (func==30) { 
        sprintf_s(string, "   Read choice function %d %s \n", func, ret ? "(return)":"");
        log->OutLog(string);
        if (ret==0) {
            NINTIN=1; NPTSIN=0; 
            strcpy_s(sIntIn, "choice number (1=function keys on keyboard)"); 
            goto PrtIn; 
        } else {
            strcpy_s(sIntOut, "#intout=0 if nothing happened, =1 if choice, =2 if if non-choice key"); 
            goto PrtOut; 
        }
    } else if (func==31) { 
        sprintf_s(string, "   Read string function %d %s \n", func, ret ? "(return)":"");
        log->OutLog(string);
        if (ret==0) {
            NINTIN=3; NPTSIN=(INTINdata[2] ? 1:0); 
            strcpy_s(sIntIn, "device num, max len, 1 to echo"); 
            if (INTINdata[2]) strcpy_s(sPtsIn, "coords to echo the string"); 
            goto PrtIn; 
        } else {
            strcpy_s(sIntOut, "#intout=len of string read"); 
            goto PrtOut; 
        }
    } else if (func==32) { 
        sprintf_s(string, "   Set writing Mode function %d %s \n", func, ret ? "(return)":"");
        log->OutLog(string);
        if (ret==0) {
            NINTIN=1; NPTSIN=0; 
            strcpy_s(sIntIn, "1=Replace, 2=Transparent, 3=XOR, 4=Erase"); 
            goto PrtIn; 
        }
    } else if (func==33) { 
        sprintf_s(string, "   Set input mode function %d %s \n", func, ret ? "(return)":"");
        log->OutLog(string);
        if (ret==0) {
            NINTIN=2; NPTSIN=0; 
            strcpy_s(sIntIn, "device type (1=locator, 2=valuator, 3=choice, 4=string), mode (1=Request, 2=Sample)"); 
            goto PrtIn; 
        }
    } else {
        sprintf_s(string, "   Unknown GSX function %d %s \n", func, ret ? "(return)":"");
        log->OutLog(string);
        if (ret==0) {
           PrtIn:
            if (NINTIN) {
                sprintf_s(string,         "      #INTIN=%d ", NINTIN, sIntIn); log->OutLog(string);
                if (sIntIn[0]) { sprintf_s(string, "(%s)", sIntIn); log->OutLog(string); } log->OutLog("\n");
                sprintf_s(string,     "      $%04x: INTIN: ", INTIN); log->OutLog(string);
                for (i=0; i<NINTIN; i++) {
                    sprintf_s(string, "$%04x ", INTINdata[i]); log->OutLog(string);
                }
                log->OutLog("\n                    \""); 
                for (i=0; i<NINTIN*2; i++) {
                    c = memory[(INTIN + i) & 0xFFFF]; if (c<32) c=' '; 
                    sprintf_s(string, "%c", c); 
                    log->OutLog(string); 
                }
                log->OutLog("\"\n"); 
            }
            if (NPTSIN) {
                sprintf_s(string,         "      #NPTSIN=%d ", NPTSIN); log->OutLog(string);
                if (sPtsIn[0]) { sprintf_s(string, "(%s)", sPtsIn); log->OutLog(string); } log->OutLog("\n");
                sprintf_s(string,     "      $%04x: PTSIN: ", PTSIN); log->OutLog(string);
                for (i=0; i<NPTSIN*2; i++) {
                    sprintf_s(string, "$%04x ", ((uint16) (PTSINdata[i]))); log->OutLog(string);
                }
                log->OutLog("\n                    "); 
                for (i=0; i<NPTSIN; i++) {
                    x=PTSINdata[i*2]; 
                    y=PTSINdata[i*2+1]; 
                    // GSX coord are in range x=0..32767, y=0..32767. Home=(0,0)=lower left corner
                    // change to screen coords 0..1023, 0..780-1, Home=(0,0)=upper left corner
                    x=x/32; y=780-1-(y*780)/(32*1024); 
                    sprintf_s(string, "(%d,%d) ", x, y); log->OutLog(string);
                }
                log->OutLog("\n"); 
            }
        } else {
          PrtOut:
            if (NINTOUT) {
                sprintf_s(string,         "      #INTOUT=%d ", NINTOUT); log->OutLog(string);
                if (sIntOut[0]) { sprintf_s(string, "(%s)", sIntOut); log->OutLog(string); } log->OutLog("\n");
                sprintf_s(string,     "      $%04x: INTOUT: ", INTOUT); log->OutLog(string);
                for (i=0; i<NINTOUT; i++) {
                    sprintf_s(string, "$%04x ", INTOUTdata[i]); log->OutLog(string);
                }
                log->OutLog("\n                    \""); 
                for (i=0; i<NINTOUT*2; i++) {
                    c = memory[(INTOUT + i) & 0xFFFF]; if (c<32) c=' '; 
                    sprintf_s(string, "%c", c); 
                    log->OutLog(string); 
                }
                log->OutLog("\"\n"); 
            }
            if (NPTSOUT) {
                sprintf_s(string,         "      #NPTSOUT=%d ", NPTSOUT); log->OutLog(string);
                if (sPtsOut[0]) { sprintf_s(string, "(%s)", sPtsOut); log->OutLog(string); } log->OutLog("\n");
                sprintf_s(string,     "      $%04x: PTSOUT: ", PTSOUT); log->OutLog(string);
                for (i=0; i<NPTSOUT*2; i++) {
                    sprintf_s(string, "$%04x ", ((uint16) (PTSOUTdata[i]))); log->OutLog(string);
                }
                log->OutLog("\n                    "); 
                for (i=0; i<NPTSOUT; i++) {
                    x=PTSOUTdata[i*2]; 
                    y=PTSOUTdata[i*2+1]; 
                    x=x/32; y=780-1-(y*780)/(32*1024); 
                    sprintf_s(string, "(%d,%d) ", x, y); log->OutLog(string);
                }
                log->OutLog("\n"); 
            }
        }
    }
}

