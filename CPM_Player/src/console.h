
#include <windows.h>
#include <limits.h>
#include "log.h"
#include "common.h"
#include "CPM_Player.h"

#define CONS_X_MAX 132 
#define CONS_Y_MAX 48

#define CONS_TABS 4 // TAB

//Osborne 1 graphic characters
static const char* font_osborne[4*4] = {
   "xxxx xx.. ..xx ..xx ..xx xxxx .... .... ",
   "x..x xx.. ..xx ..xx ..xx xxxx .... .... ",
   "x..x xx.. xx.. xxxx ..xx ..xx xx.. ..xx ",
   "xxxx xx.. xx.. xxxx ..xx ..xx xx.. ..xx ",
   //                   12    13
   //                  cross circle
   "x... .... ...x .xx. .xx. .xx. xx.. .... ",
   "xx.. .xxx ..xx .xx. xxxx xxxx xx.. xxxx ",
   "xxx. .xxx .xxx .xx. xxxx xxxx ..xx xxxx ",
   "xxxx .xx. xxxx .xx. .xx. .xx. ..xx .xx. ",

   ".... xxxx xx.. x.xx ..xx xxxx xxxx xxxx ",
   "xxx. xxxx xx.. x.xx ..xx .xxx xxxx xxxx ",
   "xxx. xx.. .... xxx. .... ..xx xxxx .... ",
   ".xx. xx.. .... xx.x .... ...x xxxx .... ",

   ".... xxxx xx.. .... .xx. x.xx .xx. .xx. ",
   ".... xxx. xx.. xxxx .xxx x.xx xxxx xxx. ",
   "xxxx xx.. xxxx xxxx .xxx xxx. xxxx xxx. ",
   "xxxx x... xxxx .... .... x..x .... .... "};

//IMSAI VIO graphic characters
static const char* font_vio[5*13] = {
   "..... xxxxx x.... xxxxx ....x ..x.. ..... ..x.. ",
   ".xxx. xxxx. xx... .xxxx ...xx ..x.. ..... ..x.. ",
   ".xxx. xxx.. xxx.. ..xxx ..xxx xxxxx xxxxx xxxxx ",
   ".xxx. xx... xxxx. ...xx .xxxx ..... ..x.. ..x.. ",
   "..... x.... xxxxx ....x xxxxx ..... ..x.. ..x.. ",

   "..x.. ..x.. ..... ..... ..... ..x.. ..x.. ..x.. ",
   "..x.. ..x.. ..... ..... ..... ..x.. ..x.. ..x.. ",
   "xxx.. ..xxx xxx.. ..xxx xxxxx ..x.. xxx.. ..xxx ",
   "..x.. ..x.. ..x.. ..x.. ..... ..x.. ..... ..... ",
   "..x.. ..x.. ..x.. ..x.. ..... ..x.. ..... ..... ",

   "..... ..... ..... ..... xxxxx xxxxx xxxxx xxxxx ",
   "..... ..... ..... xxxxx ..... xxxxx xxxxx xxxxx ",
   "..... ..... xxxxx xxxxx ..... ..... xxxxx xxxxx ",
   "..... xxxxx xxxxx xxxxx ..... ..... ..... xxxxx ",
   "xxxxx xxxxx xxxxx xxxxx ..... ..... ..... ..... ",

   "x.... xx... xxx.. ....x ...xx ..xxx ...xx xx... ",
   "x.... xx... xxx.. ....x ...xx ..xxx .xx.. ..xx. ",
   "x.... xx... xxx.. ....x ...xx ..xxx x.... ....x ",
   "x.... xx... xxx.. ....x ...xx ..xxx .xx.. ..xx. ",
   "x.... xx... xxx.. ....x ...xx ..xxx ...xx xx... ",

   //7f   //c0
   "x.x.x xxxxx ..x.. ..... ..x.. ..... ..x.. ..... ",
   ".x.x. ..... ..x.. ..... ..x.. ..... ..x.. ..... ",
   "x.x.x ..... ..x.. ..xxx ..xxx ..x.. ..x.. ..xxx ",
   ".x.x. ..... ..... ..... ..... ..x.. ..x.. ..x.. ",
   "x.x.x xxxxx ..... ..... ..... ..x.. ..x.. ..x.. ",

   "..x.. ..... ..x.. ..... ..x.. ..... ..x.. ..... ",
   "..x.. ..... ..x.. ..... ..x.. ..... ..x.. ..... ",
   "..xxx xxx.. xxx.. xxxxx xxxxx xxx.. xxx.. xxxxx ",
   "..x.. ..... ..... ..... ..... ..x.. ..x.. ..x.. ",
   "..x.. ..... ..... ..... ..... ..x.. ..x.. ..x.. ",

   "..x.. ....x ..x.x ....x ..x.x ....x ..x.x ....x ",
   "..x.. ...x. ..xx. ...x. ..xx. ...x. ..xx. ...x. ",
   "xxxxx ..x.. ..x.. ..xxx ..xxx ..x.. ..x.. ..xxx ",
   "..x.. ..... ..... ..... ..... ..x.. ..x.. ..x.. ",
   "..x.. ..... ..... ..... ..... ..x.. ..x.. ..x.. ",

   "..x.x ....x ..x.x ....x ..x.x ....x ..x.x ....x ",
   "..xx. ...x. ..xx. ...x. ..xx. ...x. ..xx. ...x. ",
   "..xxx xxx.. xxx.. xxxxx xxxxx xxx.. xxx.. xxxxx ",
   "..x.. ..... ..... ..... ..... ..x.. ..x.. ..x.. ",
   "..x.. ..... ..... ..... ..... ..x.. ..x.. ..x.. ",

   "..x.x ..... ..x.. ..... ..x.. ..... ..x.. ..... ",
   "..xx. ..... ..x.. ..... ..x.. ..... ..x.. ..... ",
   "xxxxx ..x.. ..x.. ..xxx ..xxx ..x.. ..x.. ..xxx ",
   "..x.. .x... .x... .x... .x... .xx.. .xx.. .xx.. ",
   "..x.. x.... x.... x.... x.... x.x.. x.x.. x.x.. ",

   "..x.. ..... ..x.. ..... ..x.. ..... ..x.. ..... ",
   "..x.. ..... ..x.. ..... ..x.. ..... ..x.. ..... ",
   "..xxx xxx.. xxx.. xxxxx xxxxx xxx.. xxx.. xxxxx ",
   ".xx.. .x... .x... .x... .x... .xx.. .xx.. .xx.. ",
   "x.x.. x.... x.... x.... x.... x.x.. x.x.. x.x.. ",

   "..x.. ....x ..x.x ....x ..x.x ....x ..x.x ....x ",
   "..x.. ...x. ..xx. ...x. ..xx. ...x. ..xx. ...x. ",
   "xxxxx ..x.. ..x.. ..xxx ..xxx ..x.. ..x.. ..xxx ",
   ".xx.. .x... .x... .x... .x... .xx.. .xx.. .xx.. ",
   "x.x.. x.... x.... x.... x.... x.x.. x.x.. x.x.. ",

   "..x.x ....x ..x.x ....x ..x.x ....x ..x.x ....x ",
   "..xx. ...x. ..xx. ...x. ..xx. ...x. ..xx. ...x. ",
   "..xxx xxx.. xxx.. xxxxx xxxxx xxx.. xxx.. xxxxx ",
   ".xx.. .x... .x... .x... .x... .xx.. .xx.. .xx.. ",
   "x.x.. x.... x.... x.... x.... x.x.. x.x.. x.x.. ",

   "..x.x ..... ..... ..... ..... ..... ..... ..... ",
   "..xx. ..... ..... ..... ..... ..... ..... ..... ",
   "xxxxx ..... ..... ..... ..... ..... ..... ..... ",
   ".xx.. ..... ..... ..... ..... ..... ..... ..... ",
   "x.x.. ..... ..... ..... ..... ..... ..... ..... "};

//H19 graphic characters
static const char* font_H19[5*5] = {
   // dec 94
   "..... xxxxx ..x.. ..... ..x.. ..... ..x.. ..x.. ",
   "..x.. .xxxx ..x.. ..... ..x.. ..... ..x.. ..x.. ",
   ".xxx. ..xxx ..x.. xxxxx xxxxx xxx.. xxx.. ..xxx ",
   "..x.. ...xx ..x.. ..... ..x.. ..x.. ..... ..... ",
   "..... ....x ..x.. ..... ..x.. ..x.. ..... ..... ",
   // dec 102
   "..... ..x.. .x... x.x.x ..x.. ..x.. ..... ..... ",
   "..... .xxx. ..x.. .x.x. ..... x.x.x ..... ..... ",
   "..xxx ..x.. xxxx. x.x.x .xxx. .xxx. ..xxx xxx.. ",
   "..x.. ..... ..x.. .x.x. ..... ..x.. ..xxx xxx.. ",
   "..x.. .xxx. .x... x.x.x ..x.. ..... ..xxx xxx.. ",
   // dec 110
   "xxx.. ..xxx xxxxx ..xxx xxxxx ..... ..x.. ..x.. ",
   "xxx.. ..xxx xxxxx ..xxx xxxx. ..... ..x.. ..x.. ",
   "xxx.. ..xxx xxxxx ..xxx xxx.. xxxxx xxx.. xxxxx ",
   "..... ..... ..... ..xxx xx... ..x.. ..x.. ..... ",
   "..... ..... ..... ..xxx x.... ..x.. ..x.. ..... ",
    // dec 118
   "x.... x...x ....x x.... xxxxx ..... x.... ....x ",
   "x.... .x.x. ...x. .x... ..... ..... x.... ....x ",
   "xxxxx ..x.. ..x.. ..x.. ..... ..... x.... ....x ",
   "x.... .x.x. .x... ...x. ..... ..... x.... ....x ",
   "x.... x...x x.... ....x ..... xxxxx x.... ....x ",

   ".xxx. ..... ..... ..... ..... ..... ..... ..... ",
   "xxx.. ..... ..... ..... ..... ..... ..... ..... ",
   "xxx.. ..... ..... ..... ..... ..... ..... ..... ",
   ".xx.. ..... ..... ..... ..... ..... ..... ..... ",
   "..x.. ..... ..... ..... ..... ..... ..... ..... "};

class CONSOLE
{	
private:
	HWND hMain;
	HDC hdcDIB;     // DIB for text screen
	HDC hdcDIBgr;   // DIB for graphical overlay
	HDC hdcDIBgr2;  // DIB to compose text and graphical overlay
	HBITMAP hBMP;
	HBITMAP hBMPgr;
	HBITMAP hBMPgr2;
	LPBYTE lpBuf;
	LPDWORD lpBMP;
	LPDWORD lpBMPgr;
	LPDWORD lpBMPgr2;
	LPBITMAPINFO lpDIB;
	HFONT hFont;
	HFONT hFont_underline;
	HFONT hFont_small;
	HFONT hFont_big;
	int screen_x_dots, screen_y_dots;
	int font_x_dots, font_y_dots;
	int cursor_type;
	bool console_echo;
	bool upper_case_only;
	
	int terminal_type;
    int terminal_subtype; 
    int terminal_max_cps; 
	char TermCtrlSeq[MAX_CTRL_SEQ+1][MAX_CRTL_SEQ_LEN];
	int TermCtrlSeqAction[MAX_CTRL_SEQ+1];
	int TermCtrlSeqActionParam[MAX_CTRL_SEQ+1];
    char TermCtrlSeqReply[MAX_TERM_REPLIES][MAX_TERM_REPLIES_LEN];

	int display_cps_ips;
	int display_disk_io;
	
	void DrawCharScreen(BYTE char_plane, BYTE color_plane, BYTE attrib_plane, RECT& rect, int x_pos, int y_pos);
	void ScrollScreen(int nLines);		
	void DeleteLines(int nLines);
	void InsertLines(int nLines);
	void PlotPixel(int x, int y, int bSet);
	void PlotPixelLine(int x0, int y0, int x1, int y1, int bSet);
	
	BYTE buffer[256]; // buffer to build up terminal escape sequences 
	int buffer_ptr;   // point to the next char free in previous buffer
	int screen_x_size, screen_y_size;
    int has_status_line; // terminal has extra status line (typically at line 25)
	BYTE current_attrib, current_color;

	int ReadEscSeq(uint8 codes[], int params[]);
	
	typedef struct {
		CONSOLE* console;
		BOOL terminated;
		char buffer[512];
		// VRAM
		BYTE char_plane[CONS_Y_MAX][CONS_X_MAX]; // console main text buffer
		BYTE attrib_plane[CONS_Y_MAX][CONS_X_MAX];
		BYTE color_plane[CONS_Y_MAX][CONS_X_MAX];
		struct { //alternate page for console text buffer
			BYTE char_plane[CONS_Y_MAX][CONS_X_MAX];
			BYTE attrib_plane[CONS_Y_MAX][CONS_X_MAX];
			BYTE color_plane[CONS_Y_MAX][CONS_X_MAX];
		} alt_page;
		struct { // 2 pages of memory to build the console screen
			BYTE char_plane[CONS_Y_MAX][CONS_X_MAX];
			BYTE attrib_plane[CONS_Y_MAX][CONS_X_MAX];
			BYTE color_plane[CONS_Y_MAX][CONS_X_MAX];
		} VDC[2];
		int VDCpage; // current page for update the screen
		int current_x_pos, current_y_pos;
		int save_current_x_pos, save_current_y_pos, save_current_attrib; 
		int cursor_visible; 
        int inverted_screen; // =1 -> inverted screen. Used by WaveMate Terminal-125
		int graphic_mode; // =H19_gr_mode, =2 for DEC VT100 semigraphics, =Osborne_gr_mode
        int vio_mode; // command mode byte for IMSAI VIO videocard
        int vt100_charset[2]; // =VT100_gr_mode -> this charset uses semigraphics
        int vt100_current_charset; // =0 or 1 for G0 or G1
        int discard_at_eol; //=1 -> char in col 79 gets overprinted instead of doing a <CR><LF>
        int GSX_driver_wellcome; //=1 -> GSX driver has printed the wellcome message
        struct {
            int enabled; //=1 -> Digital Engeniering Retrographics RG-512 enabled
            int TekMode; //=1 -> RG-512 working as TEK 4010, =0 -> working as ascii terminal
            int DrawMode; //=0 -> normal write mode, =1 erase mode, =2 xor mode
            int MouseCursor; // =0 -> normal arrow =1 -> GIN cross
        } RG512; 
        struct {
            int enabled; 
            int antialiased; 
            int nVectors;
            struct {
                int type, attrib; 
                int x0,y0,x1,y1;
            } vect[MAX_VECT];
        } GrOverlay; // graphics overlay to be refreshed on screen

        int locked_lines[CONS_Y_MAX];
        int visible_page; 
        int request_full_redraw; 
        struct {
            int on; // on/off bit. =0 -> dazzler image not dislayed on console
            int framebuffer_addr; // starting addr of picture
            int resolution_x4;    // =1 -> resolution: 64x64 or 128x128, color and intensity given by dazzler.color
                                  // =0 -> resolution: 32x32 or 64x64, color and intensity from frambuffer mem nibble 
            int framebuffer_2k;   // =1 -> framebuffer length is 2K, =0 -> framebuffer is 512 bytes
            int color_mode; // =1 -> color mode; =0 bw (dazzler.color/ram nibbly value = while intensity)
            int color; // =HBGR: bit3=H -> high intensity, bit2=Blue, bit1=green, bit0=red
            struct {
                int mode; 
                int framebuffer[2048];
            } last;
            int tnow_frame_start;  // millisecond counter for scanline/end of frame sensing on reading port 0x0E
            struct {
                int JoySensed; // =1 if program is reading the joy state 
                int buttons;   // bit0 = joy push button 1 pressed (sw1) .. bit3 = button 4
                int x_pos;     // 0=centered, -128=left, 127=right
                int y_pos;     // 0=centered, 127=up, -128=down
            } joy[2];
            int JoyMode; // =0 -> autodetect joy, joy increment ok keypress +/-32. =-1 -> joy disabled, >0 joy present, this increment on keypress
        } dazzler; 

        struct {
          int mode; // 0=alpha, 1=gin, 2=graph vector, 3=graph point, 4=incremental plot mode
          int gr_x_pos, gr_y_pos; // graphic cursor position. All coords are 1024x780, (0,0) on upper left corner
          int margin; // margin 0 or margin 1
          int recv_x, recv_y; // last received coord
          int GIN_x, GIN_y; // last GIN cross hair pos
          int Hi; // where to store hi byte received. 0-> y, 1->x;
          int HiX, HiY, LoY; // the received parts of address
          int DarkMode; // =1 on entering graph mode so first vector is not draw (allow to position gr cursor at its desired draw start coord)
          int ByPassMode; // =1 to do not process chars sent by program
          int CharSize; // =1 -> use small charset, = 2 -> use big charset
          int Pattern; // =0 -> solid vector, =1 -> dotted line, =2 -> dot-dashed, =3 -> short dashed, =4 -> lng dashed
          int beam; // beam On/off for incremental plot mode
          struct {
              int cursor_draw;  // =1 -> the alpha cursor has been drawn on rect
              RECT cursor_rect; // the cursor rect in GUI Windows coordinates
              int crosshair_draw; // =1 -> the GIN cross hair has been drawn on xhair_pt coords
              POINT xhair_pt; // the crosshair pos in GUI Windows coordinates
          } last; // data for updating the alpha cursor
          struct {
              int draw_cursor_flag; // should draw cursor in WM_PAINT
              int draw_AltI_info_col; // colum where Alt-I info starts on ascii text screen
          } refresh; 
        } tek4010;
	} PARAMS, *PPARAMS;
	PARAMS params;

    // history buffer for console screen (to display already scrolled lines 
    // with mouse wheel)
    BYTE history_char_plane[MAX_SCREEN_HISTORY][CONS_X_MAX];
	BYTE history_attrib_plane[MAX_SCREEN_HISTORY][CONS_X_MAX];
	BYTE history_color_plane[MAX_SCREEN_HISTORY][CONS_X_MAX];
    int nhist, history_buffer_wrap, history_buffer_visible; 

	BOOL blink_status;
	int RefreshScreen_event_pending;

	int CPS_count; // CPS: chars sent to terminal per second
	int CPS;
	int CPS_last_count;
	DWORD CPS_last_ms;
	int IPS;
	long long IPS_last_count;

	BYTE key_buffer[256];
	int key_r_ptr, key_w_ptr;

    char Expect_String[255]; 
    int Expect_Matched; 


    CRITICAL_SECTION KbdCriticalSection;

    void FillArea(int x0, int y0, int x1, int y1, COLORREF fore_col, 
                  int HasColor, int EraseMode, int XORMode, int pattern);
    void SetPixelAA(int x, int y, int ammount, int decay);
    void AntiAliased_Point(int x0, int y0, int decay);
    void AntiAliased_Line(int x0, int y0, int x1, int y1, int pattern, int decay);
    void GetMousePosInGIN(); 

public:
	CONSOLE();
	~CONSOLE();

	// Win32
	void GetWindowSize(LOGFONT *lplf, int columns, int lines, 
                       int additional_status_line, 
                       int* window_width, int* window_height);
	void Initialize(HWND hwnd, LOGFONT *lplf);
	void Release();
	void Blt(HDC hdc, int x, int y, int width, int height);
	void ClearScreen(BOOL update_flag);
	void RefreshScreen(void); // called only from WM_TIMER event
	void RefreshScreen_VDC(); // called only from RefreshScreen()
    void RequestRefreshScreen(int Request_fullredraw); // can be called from anywhere

	char CustomTerminalName[128];
	int SetMode(char cMode, int vMode);
	void SetCtrlSeq(char *aCustomTerm, char * aTermCtrlSeq, int aTermCtrlSeqAction[], int aTermCtrlSeqActionParam[], char * aTermCtrlSeqReply);
	void GetScreenChars(BYTE *scr, int scrlen);
	void PutChar(BYTE code, BOOL update_flag);
	void PutString(char string[]);
	void OpenNewLine(); 
	void Blink();
	void ExecCtrlSeqAction(int c, int d, BYTE p1, BYTE p2);
	
	void Terminate();
	void Reset();
	
	int GetChar();
	void GetString(char dest[], int length, BOOL& console_terminated, BOOL CtrlC_allowed);
	void PressKey(BYTE code);
	void ResetKeyBuffer();
	int GetKey();
	int GetKeyStatus(int RemoveWaitingKey);
    void PasteToKeyboard(char * s); 

	int mem_mapped_terminal_type;
	int mem_mapped_terminal_subtype;
	BYTE MappedVideoMem(int x_pos, int y_pos, int mode, BYTE data);
	LOG* log;
	LOG* screen_log;
	LOG* printer_log;

	long long IPS_count; // IPS: counter updated from cpm.cpp to calculate Z80 instructions per second
	int MaxIPS; 
	int paused; // flag to pause the z80 cpu
	int disk_io_activity;

	BYTE Osborne_CharGenerator[1024*16];
	int Osborne_use_CharGenerator;

	int KeyboardRawMode;
	void InitGetStringHistory();
    void ShowScreenHistoryBuffer(int nDelta); 
    int ExpectString(int Mode, char * sExpect); 

    int DazzlerCard(int action, int addr, int data); 
    void DrawDazzlerImage(int c0, int l1, 
                          int cols_covered_by_dazzler_image, int lines_covered_by_dazzler_image,
                          RECT& rect);

    void AddToDrawList_GrOverlay(int type, int x0, int y0, int x1, int y1, int attrib);
    void DrawVector_GrOverlay(int x0, int y0, int x1, int y1, int pattern, int wx, int wy);
    void DrawPoint_GrOverlay(int x0, int y0, int pattern, int wx, int wy);
    void DrawChar_GrOverlay(int x0, int y0, int w, char c, int pattern, int wx, int wy);
    void FillArea_GrOverlay(int x0, int y0, int x1, int y1, int pattern, int wx, int wy);
    void ClearScreen_GrOverlay();
    int  DrawImage_GrOverlay(int mode, RECT * rect); 

    void Term125_FictionalHiresVectorEngine(int addr, int data);
    int Tek4010(int command, int data);
    void gsx_BDOS(int regDE, int Mode);
    void GSX_CALL(int ParamBlockAddr); 
};

int GetTimeMS(); // return milliseconds elapsed since powerup with precision timer
