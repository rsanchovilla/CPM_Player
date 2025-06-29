h62300
s 00119/00000/00000
d D 1.1 83/03/18 11:43:28 bog 1 0
c date and time created 83/03/18 11:43:28 by bog
e
u
4
U
t
T
I 1
#define OPCODE 1                         /*opcode index */
#define VERTICES_IN 2                    /*number of points input*/
#define INTEGER_IN_LENGTH 4              /*length of input integers*/
/**/
/* opcode definitions*/
/**/
#define OPEN_WORKSTATION 1               /*open workstation identifier*/
#define CLOSE_WORKSTATION 2              /*close workstation identifier*/
#define CLEAR_WORKSTATION 3              /*clear workstation identifier */
#define UPDATE_WORKSTATION 4             /*update workstation identifier */
#define ESCAPE 5                         /*graphic escape */
#define LINE 6                       /*polyline opcode identifier */
#define MARKER 7                     /*polymarker opcode identifier */
#define TEXT 8                          /*text opcode identifier */
#define FILL_AREA 9                     /*fill area opcode identifier */
#define CELL_ARRAY 10                   /*cell array identifier */
#define GDP 11                          /*generalized drawing primitive  */
#define CHAR_HEIGHT 12          /*text size identifier */
#define CHAR_UP_VECTOR 13       /*character up vector */
#define COLOR_REPRESENTATION 14    /*map index to color opcode identifier */
#define LINE_TYPE 15         /*ASSI polyline linetype opcode */
#define LINE_WIDTH 16       /* set polyline width */
#define LINE_COLOR 17     /*ASSI polyline color opcode */
#define MARKER_TYPE 18           /*ASSI polymarker markertype opcode */
#define MARKER_SCALE 19          /*set polymarker scale facter */
#define MARKER_COLOR 20   /*ASSI polymarker color opcode */
#define TEXT_FONT 21                 /*ASSI text font opcode */
#define TEXT_COLOR 22         /*ASSI text color opcode */
#define FILL_INTERIOR_STYLE 23      /*ASSI fillarea interior style opcode */
#define FILL_STYLE_INDEX 24          /*ASSI fillarea style index opcode */
#define FILL_COLOR_INDEX 25         /*ASSI fillarea color index opcode */
#define INQ_COLOR_REPRESENTATION 26 /*Inquire on color values */
#define INQ_CELL_ARRAY 27            /*request pixel array */
#define INPUT_LOCATOR 28               /*locator opcode */
#define INPUT_VALUATOR 29              /*valuator opcode */
#define INPUT_CHOICE 30                /*choice opcode */
#define INPUT_STRING 31                /*string opcode */
#define SET_WRITING_MODE 32            /*set writing mode opcode */
#define SET_INPUT_MODE 33              /*set input mode opcode */
/* */
/* ESCAPE function ids */
/* */
#define INQ_ADDRESSABLE_CELLS 1 
#define ENTER_GRAPHICS_MODE 2 
#define EXIT_GRAPHICS_MODE 3 
#define CURSOR_UP 4 
#define CURSOR_DOWN 5 
#define CURSOR_RIGHT 6 
#define CURSOR_LEFT 7 
#define HOME_CURSOR 8 
#define ERASEEOS 9 
#define ERASEEOL 10 
#define DIRECT_CURSOR_ADDRESS 11 
#define OUTPUT_CURSOR_ADDRESSABLE_TEXT 12 
#define REV_ON 13 
#define REV_OFF 14 
#define INQ_CURRENT_CURSOR_ADDRESS 15 
#define INQ_TABLET_STATUS 16 
/* */
/* GKS defines */
/* */
#define GKCL 0                         /* GKS state closed */
#define GKOP 1                         /* GKS state open */
#define WSOP 2                           /* GKS state workstation open */
#define WSAC 3                         /* GKS state workstation active */
#define SGOP 4                           /* GKS state segment open */
/* */
#define OUTPUT 0                         /* workstation type output */
#define INPUT 1                          /* workstation type input */
#define OUTIN 2                          /* workstation type output/input */
#define DISS 3                           /* workstation type segment storage */
#define GKSMO 4                          /* GKS metafile output */
#define GKSMI 5                          /* GKS metafile input */
/* */
#define GKSLEV 0                         /* GKS level is 0a (0-9) */
#define NRMMAX 1                       /* maximum normalizations for level 0a */
/*  */
#define REQUEST 0                        /* input modes */
#define SAMPLE 1 
#define EVENT 2 
/*  */
#define BAR 1                           /* GDP defines */
#define ARC 2 
#define PIE_SLICE 3 
#define CIRCLE 4 
#define PRINT_GRAPHIC_CHARACTERS 5 
/* */
#define SET 0                            /* flags for inquiries */
#define REALIZED 1 
#define PREDEFINED 2 
#define INACTIVE 0 
#define ACTIVE 1 
#define NOTPENDING 0 
#define PENDING 1 
#define BUNDLED 0 
#define INDIVIDUAL 1 
#define MONOCHROME 0 
#define COLOR 1 
#define METERS 0 
#define OTHER 1 
#define NONE 0 
#define OK 1 
/* */
#define X_VALUE 1                        /*the x value of an array */
#define Y_VALUE 2                        /*the y value of an array */
#define Z_VALUE 3                        /*the z value of an array */
#define LEFT 1                           /*the left edge of a boundary */
#define RIGHT 2                          /*the right edge of a boundary */
#define BOTTOM 3                         /*the bottom edge of a boundary */
#define TOP 4                            /*the top edge of a boundary */
#define FRONT 5                          /*the front edge of a boundary */
#define BACK 6                           /*the back edge of a boundary */
#define LINE_VISIBLE 0                   /*line is visible */
#define LEFT_EDGE_CODE 8                 /*left edge clipping code */
#define RIGHT_EDGE_CODE 4                /*right edge clipping code */
#define BOTTOM_EDGE_CODE 2               /*bottom edge clipping code */
#define TOP_EDGE_CODE 1                  /*top edge clipping code */
#define STRING_PRECISION 1               /*text string precision */
#define CHARACTER_PRECISION 2            /*text character precision */
E 1
