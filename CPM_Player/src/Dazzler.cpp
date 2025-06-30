#include "stdafx.h"

#include <windows.h>
#include <stdio.h>
#include <math.h>
#include "cpm.h"
#include "z80.h"
#include "console.h"
#include "..\res\resource.h"

extern CPM* cpm;

int CONSOLE::DazzlerCard(int action, int addr, int data)
// helper functions for Dazzler emulation
// if action = 1 -> write into frame buffer, return 1 if addr belongs to mem region used as dazzler framebufer
//             2 -> simulate OUT, 0E/0F: write to dazzler control ports 0E and 0F
//             3 -> simulate IN 0E, reading from dazzler port laddr scan lines/frame counter
//             4 -> simulate IN 18..1C read D7+AI/O card with 2 analog Joysticks
//             5 -> set joy state (called from main thread in response to WM_CHAR messages to set joy state read by DazzlerCard(4,...))
//             6 -> if addr==0: returns 1 is joy should be sensed; if addr==1 sets JoyState with value in data
{
    if (action == 1) {
       // write into frame buffer
       if (params.dazzler.on==0) return 0; // dazzler board is not active
       // return 1 if addr belongs to mem region used as dazzler framebufer
       if (addr < params.dazzler.framebuffer_addr) return 0; // addr not into current used framebuffer for dazzler image
       int len = (params.dazzler.framebuffer_2k) ? 2048:512; // framebuffer length
       if (addr >= params.dazzler.framebuffer_addr + len) return 0; // addr not into current used framebuffer for dazzler image
       return 1; // notify addr into framebuffer to caller
       // console->RequestRefreshScreen(false); done by the caller: cpm::Writememory
    } else if (action == 2) {
        // OUT to dazzler port addr
        if (addr == 0x0e) {
            // bit7 = on/off
            // bits6..0 set the starting address of a picture address A15..A9
            if ((data & 128) ==0) {
                // turn off the card
                params.dazzler.on=0; 
            } else if (params.dazzler.on==0) {
                // turn on the dazzler card
                params.dazzler.on=1;
                params.dazzler.last.mode=-1; // setting last mode = -1 forces a redraw of full dazzler screen
            }
            // set the starting address of dazzler picture in main mem
            params.dazzler.framebuffer_addr=(data & 127) * 512; 
        } else if (addr == 0x0f) {
            // define the mode 
            params.dazzler.resolution_x4  = (data & 64) ? 1:0;   // =1 -> resolution: 64x64 or 128x128, color and intensity given by dazzler.color
                                                                 // =0 -> resolution: 32x32 or 64x64, color and intensity from frambuffer mem nibble 
            params.dazzler.framebuffer_2k = (data & 32) ? 1:0;   // =1 -> framebuffer length is 2K, =0 -> framebuffer is 512 bytes
            params.dazzler.color_mode     = (data & 16) ? 1:0;   // =1 -> color mode; =0 bw (dazzler.color/ram nibbly value = while intensity)
            params.dazzler.color          = (data & 15);         // =HBGR: bit3=H -> high intensity, bit2=Blue, bit1=green, bit0=red
        }
        // console->RequestRefreshScreen(false); done by the caller: cpm::WriteIO
    } else if (action == 3) {
        // IN from dazzler port laddr scan lines/frame counter
        if (params.dazzler.on==0) return 0; // dazzler board is not active
        if (addr == 0x0e) {
            // toggle bit7 (odd/even scan line being drawn on TV set)
            int tnow=GetTimeMS(); 
            data = (tnow & 1) ? 128:0;  // bit7 toggles each millisecond
            // D6 is low 4 msec between frames (at 24fps -> frame each 42 msec)
            int msec=tnow-params.dazzler.tnow_frame_start; 
            if ((msec < 0) || (msec > 42)) {
                // start new frame 
                params.dazzler.tnow_frame_start=tnow; 
                data=data | 64; 
            }else if (msec < 37) {
                // frame not finished -> bit6 = 1
                data=data | 64; 
            } else {
                // frame finished -> bit6 = 0;
            }
            data |= 0x3f; // bit0..bit5 not used -> read as 1
            return data; 
        }
    } else if (action == 4) {
        // IN for D7+AI/O card with 2 analog Joysticks
        if (terminal_type != CRT_DAZZLER) return 0; // dazzler board is not active
        if (addr == 0x18) {
            // joy1 buttons: bits0-3 sw1=bit0..sw4=bit3
            // joy2          bits4-7 sw1=bit4..sw7=bit3
            data = (params.dazzler.joy[0].buttons & 0xF) | ((params.dazzler.joy[1].buttons & 0xF) << 4);
            data = ~data; // joy button are inverted: relesaed -> returns bit=1, pressed returns bit=0
            params.dazzler.joy[0].JoySensed=1; 
            return data; 
        } else if (addr == 0x19) {
            // joy1 x-axis 0->centered, >0->left, <0->right
            data = params.dazzler.joy[0].x_pos; 
            params.dazzler.joy[0].JoySensed=1; 
            goto joydata; 
        } else if (addr == 0x1a) {
            // joy1 y-axis 0->centered, >0->up, <0->down
            data = params.dazzler.joy[0].y_pos; 
            params.dazzler.joy[0].JoySensed=1; 
            goto joydata; 
        } else if (addr == 0x1b) {
            // joy2 x-axis
            data = params.dazzler.joy[1].x_pos; 
            params.dazzler.joy[1].JoySensed=1; 
            goto joydata; 
        } else if (addr == 0x1c) {
            // joy2 y-axis
            data = params.dazzler.joy[1].y_pos; 
            params.dazzler.joy[1].JoySensed=1; 
          joydata:
            if (data <= -128) data = -127;
            if (data >=  128) data =  127;
            if (abs(data) < 40) data=0; 
            return data; 
        }
    } else if (action == 5) {
        // set joy state
        if (terminal_type != CRT_DAZZLER) return 0; // dazzler board is not active
        int njoy = addr; if ((njoy<0)||(njoy>1)) return 0; //safety
        char set = ((data >> 8) & 0xFF); // what we have to set: B, X or Y
        int JoyIncr = 32; // joy osition increment/decrement on each PC keybord key press
        if (params.dazzler.JoyMode > 0) JoyIncr = params.dazzler.JoyMode; // set the defined increment, if any
        if (set=='B') {
            int button = data & 0x7; // if button = 1..4, button_pressed holds its new state
            int button_pressed = (data & 8) ? 1:0;
            int bits = params.dazzler.joy[njoy].buttons;
            int mask = 1 << (button-1); 
            if (button_pressed) { 
                bits |= mask; // set the button bit
            } else {
                bits &= (~mask); // reset the button bit
            }
            params.dazzler.joy[njoy].buttons=bits; 
            return 0;
        } else if (set=='X') {
            int direction = (data & 64) ? 1 : (data & 128) ? -1 : 0; 
            data = params.dazzler.joy[njoy].x_pos; 
            if (direction < 0) data += -JoyIncr; else
            if (direction > 0) data += JoyIncr; 
            if (data > 128) data = 128; if (data < -128) data = -128; 
            params.dazzler.joy[njoy].x_pos=data; 
            return 0;
        } else if (set=='Y') {
            int direction = (data & 64) ? 1 : (data & 128) ? -1 : 0; 
            data = params.dazzler.joy[njoy].y_pos; 
            if (direction < 0) data += -JoyIncr; else
            if (direction > 0) data += JoyIncr; 
            if (data > 128) data = 128; if (data < -128) data = -128; 
            params.dazzler.joy[njoy].y_pos=data; 
            return 0;
        }        
    } else if (action == 6) {
        if (addr==0) {
            // return 1 of joy should be sensed
            if (params.dazzler.JoyMode<0) {
                // joy disabled
                return 0;
            } else if (params.dazzler.JoyMode>=0) {
                // joy enabled -> should be sensed
                return 1; 
            }
        } else if (addr==1) {
            // set JoyMode value
            params.dazzler.JoyMode=data; 
        }
    }
    return 0; 
}

void CONSOLE::DrawDazzlerImage(int c0, int l1, 
                               int cols_covered_by_dazzler_image, int lines_covered_by_dazzler_image,
                               RECT& rect)
// draw dazzler image on GDI
// c0 is first hidden colum under dazzler screen
// l1 is first line visible below dazzler screen
{
    int ad,xx,yy,data,bit,resol; 

    int xc0 = (font_x_dots) * c0;
	int yl1 = (font_y_dots) * l1;
    int xc1 = xc0 + (font_x_dots) * cols_covered_by_dazzler_image;
	int yl0 = yl1 - (font_y_dots) * lines_covered_by_dazzler_image;

    RECT rct;
	rct.left   = xc0;
	rct.top    = yl0;
	rct.right  = xc1;
	rct.bottom = yl1;
    // rct is the full image 

    int framebuffer_len = params.dazzler.framebuffer_2k ? 2048:512; 

    int r,g,b,c; 
    RECT re;
	COLORREF col; // color table for dazzler pixels
    HBRUSH bru[16];
    for (int n=0; n<16; n++) {
        if (params.dazzler.color_mode) {
            if ((n==0) || (n==8)) {
                r=g=b=30; // black and HiBlack are the same
            } else {
                // color
                r=30 + (n&1 ? 120:0) + (n&8 ? 80:0); 
                g=30 + (n&2 ? 120:0) + (n&8 ? 80:0); 
                b=30 + (n&4 ? 120:0) + (n&8 ? 80:0); 
            }
        } else {
            // black and white image
            r=g=b=30 + (200*n)/15; 
        }
        col = RGB(r,g,b);
        bru[n] = CreateSolidBrush(col);
    }

    if (params.dazzler.resolution_x4) {
        // monocrome, 128x128 (if frambuffer_2k=1) or 64x64 resolution
        resol = (params.dazzler.framebuffer_2k) ? 128:64; 
        for (ad=0; ad<framebuffer_len; ad++) {
            data = cpm->z80->memory[ad + params.dazzler.framebuffer_addr];
            // check if framebuff changed
            if (data == params.dazzler.last.framebuffer[ad]) {
                continue; // no changes -> skip this framebuffer byte
            } else {
                params.dazzler.last.framebuffer[ad] = data; 
            }
            // draw pixels from data according to current mode
            for (bit=0; bit<8; bit++) {
                xx=((ad & 512) ? 64 : 0) + (ad & 15) * 4 + (bit & 1) + ((bit & 4) ? 2:0);
                yy=((ad & 511) / 16) * 2 + ((ad & 1024) ? 64:0) + ((bit & 2) ? 1:0);
                if (data & 1) {
                    // pixel set -> use color in 0x0F port
                    c = params.dazzler.color;                 
                } else {
                    c = 0; // pixel off -> black color
                }
                data=data >> 1; 
                // set the rectable to draw in GDI
                re.top   =rct.top + (yy * (rct.bottom-rct.top)) / resol; 
                re.bottom=rct.top + ((yy+1) * (rct.bottom-rct.top)) / resol; 
                re.left  =rct.left + (xx * (rct.right-rct.left)) / resol; 
                re.right =rct.left + ((xx+1) * (rct.right-rct.left)) / resol; 
                // draw the pixel rectangle at last
                FillRect(hdcDIB, &re, bru[c]);
                // update the modifed Window GDI area to be redraw
	            rect.left = (re.left < rect.left) ? re.left : rect.left;
	            rect.top = (re.top < rect.top) ? re.top : rect.top;
	            rect.right = (re.right > rect.right) ? re.right : rect.right;
	            rect.bottom = (re.bottom > rect.bottom) ? re.bottom : rect.bottom;
            }
        }
    } else {
        // 16 colors per pixel, 64x64 (if frambuffer_2k=1) or 32x32 resolution
        resol = (params.dazzler.framebuffer_2k) ? 64:32; 
        for (ad=0; ad<framebuffer_len; ad++) {
            data = cpm->z80->memory[ad + params.dazzler.framebuffer_addr];
            // check if framebuff changed
            if (data == params.dazzler.last.framebuffer[ad]) {
                continue; // no changes -> skip this framebuffer byte
            } else {
                params.dazzler.last.framebuffer[ad] = data; 
            }
            // draw pixels from data according to current mode
            for (bit=0; bit<2; bit++) {
                xx=((ad & 512) ? 32 : 0) + (ad & 15) * 2 + (bit & 1);
                yy=((ad & 511) / 16) + ((ad & 1024) ? 32:0);
                c = data & 15; data = data >> 4; 
                // set the rectable to draw in GDI
                re.top   =rct.top + (yy * (rct.bottom-rct.top)) / resol; 
                re.bottom=rct.top + ((yy+1) * (rct.bottom-rct.top)) / resol; 
                re.left  =rct.left + (xx * (rct.right-rct.left)) / resol; 
                re.right= rct.left + ((xx+1) * (rct.right-rct.left)) / resol; 
                // draw the pixel rectangle at last
                FillRect(hdcDIB, &re, bru[c]);
                // update the modifed Window GDI area to be redraw
    	        rect.left = (re.left < rect.left) ? re.left : rect.left;
	            rect.top = (re.top < rect.top) ? re.top : rect.top;
    	        rect.right = (re.right > rect.right) ? re.right : rect.right;
	            rect.bottom = (re.bottom > rect.bottom) ? re.bottom : rect.bottom;
            }
        }
    }
    for (int n=0; n<16; n++) DeleteObject(bru[n]);
    // save last framebuffer data draw on screen
}
