#pragma once

#include "../res/resource.h"

#define CPM_Player_version    "v4.0"

#define MAX_PASTE               8192        // paste max 8K text 
#define RECENT_MAX              5           // max number of recent files history in File menu
#define MAX_PCKEYS              30          // max number of terminal keys that can be redefined
#define MAX_PCKEYS_LEN          16          // max number of chars that a keyboard key can generate
#define HIST_MAX                10          // command line/input line history = 10 last entries
#define MAX_LOG_LINES           500*1000    // max num of lines in log files
#define MAX_SCREEN_HISTORY      200         // number of lines in terminal screen buffer history
#define MAX_CTRL_SEQ            64          // max number of control escape sequences defined for the terminal emulation
#define MAX_CRTL_SEQ_LEN        16          // max chars per control escape sequences 
#define MAX_TERM_REPLIES        8           // max number of terminal replies that can be defined
#define MAX_TERM_REPLIES_LEN    64          // max lenght of each reply
#define MAX_IPS              10*1000*1000   // max controlled emulated cpu speed = 10 M instr per second- More than this the emulated cou goes as fast as host can
#define MIN_IPS                 1000        // min controlled emulated cpu speed = 1000 instr per second
#define CURSOR_BLINK_RATE_MS    300         // blink cursor each 300 millisecs
#define MAX_RECENT_FOLDER_LEN   40          // if folder in recent menu is longer, truncated with '...'
#define MAX_VECT                1000        // max number of vectors that can be draw in 1000/FPS mseconds
#define TEK_DECAY               10          // number of frames needed for Tek4010 antialiased vectors to decay from white to green
#define TEK_BIG_FONT            1.3         // the big font is TEK_BIG_FONT times bigger than the normal font
#define TEK_SMALL_FONT          0.5         // the small font is TEK_SMALL_FONT times smaller than the normal font

#define FPS                     30          // refresh screen at this frames per second rate

#define CRT_VT100           0    // default ANSI/VT100/VT52/H19 (H19 has 2x2 pixels semigraphics chars), prints on screen at 1500 chars per second (CPS) rate
#define CRT_KAYPRO          1    // Kaypro screen: text + semigraphics for 160 x 100 resolution (2x4 pixels per char). has an status line (line 25). Memory mapped
#define CRT_OSBORNE         3    // Osborne screen: text + redefinible semigraphics. Memory mapped
#define CRT_OTHER           4    // other text terminal
#define CRT_VIO             5    // IMSAI VIO-1 S100 Video Card: text 80x24 + graphics 160 x 72  (2x3 pixels semigraphics chars). Memory mapped
#define CRT_DAZZLER         6    // Cromemco Dazzler Video Card: 16 color graphics 128 x 128 in main mem framebuffer. Memory mapped
#define CRT_TERM125         7    // WaveMate Terminal-125 TV Video Card: text 64x32 + graphics 128 x 96  (2x3 pixels semigraphics chars). Memory mapped
#define CRT_TEK4010         8    // Tektronix 4010 DVST terminal

#define CRT_OSBORNE_EXEC    100  // Osborne executive subtype: text + redefinible semigraphics 
#define VT100_ANSI          101  // using ANSI, not VT100,VT52 or Z19/H19
#define VT100_H19           102  // using H19, not VT100,VT52 or ANSI

#define H19_gr_mode         201  // showing H19 semigraphc chars
#define Osborne_gr_mode     202  // showing Osborne semigraphics chars
#define VT100_gr_mode       203  // showing special chars. & line set


#define IS_CCP              1    // run CCP command processor
#define IS_COM              2    // run regular .COM executable z80 CP/M file
#define IS_SUB              3    // run .SUB submit file 
#define IS_BAS              4    // run .BAS msbasic file

#define K_Left          (230+1)  // ascii code for non-ascii keyboard keys
#define K_Right         (230+2)   
#define K_Up            (230+3)   
#define K_Down          (230+4)   
#define K_Ins           (230+5)   
#define K_Del           (230+6)   
#define K_Home          (230+7)   
#define K_End           (230+8)   
#define K_PgUp          (230+9)   
#define K_PgDn          (230+10)   
#define K_F1            (230+11)   
#define K_F2            (230+12)   
#define K_F3            (230+13)   
#define K_F4            (230+14)   
#define K_F5            (230+15)   
#define K_F6            (230+16)   
#define K_F7            (230+17)   
#define K_F8            (230+18)   
#define K_F9            (230+19)   

#define CON_CR			        1 
#define CON_RIGHT	    	    2
#define CON_DOWN		        3
#define CON_UP	    		    4
#define CON_EOS 		    	5
#define CON_EOL	    		    6
#define CON_CLS	        		7
#define CON_HOME	        	8
#define CON_POS_YX		        9
#define CON_POS_XY		        11
#define CON_REVERSE_ON		    13
#define CON_REVERSE_OFF		    14
#define CON_BRIGHT_ON		    15
#define CON_BRIGHT_OFF		    16
#define CON_BLINK_ON		    17
#define CON_BLINK_OFF		    18
#define CON_UNDER_ON		    19
#define CON_UNDER_OFF		    20
#define CON_CUR_ON		        21
#define CON_CUR_OFF		        22
#define CON_INS_LIN 		        23
#define CON_DEL_LIN	    	        24
#define CON_EEL			            25
#define CON_RESET_ATTR		        26
#define CON_REVERSE_TOGGLE	        27
#define CON_LEFT    		        28
#define CON_CRLF	    	        29
#define CON_CUR_SAVE	    	    30
#define CON_CUR_RESTORE		        31
#define CON_BACKSPACE		        33
#define CON_REPLY   		        34
#define CON_INS_CHR	    	        35
#define CON_DEL_CHR		            36
#define CON_SET_ATTR		        37
#define CON_SET_LIN_LOCK	        38
#define CON_RESET_LIN_LOCK	        39 
#define CON_RESET_ALL_LIN_LOCKS	    40 
#define CON_SET_TOP_LIN_LOCK	    41 
#define CON_WRITE_STATUS_LINE_MSG   42
#define CON_END_STATUS_LINE_MSG     43
#define CON_CLEAR_STATUS_LINE       44
#define CON_REVERSE_LF              45
#define CON_LF                      46
#define CON_SCROLL                  47
#define CON_PAGE                    48
#define CON_CUR_REPORT              49
#define CON_EBL			            50
#define CON_NOP			            32
