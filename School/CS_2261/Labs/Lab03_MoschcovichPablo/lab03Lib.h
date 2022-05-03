#ifndef LAB_03_LIB_H
#define LAB_03_LIB_H

// Common Typedefs
typedef unsigned short u16;

// Common Macros
#define OFFSET(col,row,rowlen) ((row)*(rowlen)+(col))

// ================================= DISPLAY ==================================

// Display Control Register
#define REG_DISPCTL (*(volatile unsigned short *)0x4000000)
#define MODE3 3
#define BG2_ENABLE (1<<10)

// Display Status Registers
#define SCANLINECOUNTER (*(volatile unsigned short *)0x4000006)

// Display Constants
#define SCREENHEIGHT 160
#define SCREENWIDTH 240

// Video Buffer
extern volatile unsigned short *videoBuffer;

// Color
#define COLOR(r,g,b) ((r) | (g)<<5 | (b)<<10)
#define BLACK 0
#define DARKGREY COLOR(5,5,5)
#define GREY COLOR(15,15,15)
#define LIGHTGREY COLOR(25,25,25)
#define WHITE COLOR(31,31,31)
#define RED COLOR(31,0,0)
#define GREEN COLOR(0,31,0)
#define LIGHTGREEN COLOR(24,31,24)
#define BLUE COLOR(0,0,31)
#define LIGHTBLUE COLOR(24,24,31)
#define CYAN COLOR(0,31,31)
#define MAGENTA COLOR(31,0,31)
#define LIGHTPINK COLOR(31,24,29)
#define LIGHTPURPLE COLOR(29,24,31)
#define YELLOW COLOR(31,31,0)
#define LIGHTYELLOW COLOR(31, 31, 24)

// Mode 3 Drawing Functions
void setPixel(int col, int row, unsigned short color);
void drawRect(int col, int row, int width, int height, unsigned short color);
void fillScreen(unsigned short color);

// Miscellaneous Drawing Functions
void waitForVBlank();

// ================================== INPUT ===================================

// Button Register
#define BUTTONS (*(volatile unsigned short *)0x04000130)

// Button Masks
#define BUTTON_A		(1<<0)
#define BUTTON_B		(1<<1)
#define BUTTON_SELECT	(1<<2)
#define BUTTON_START	(1<<3)
#define BUTTON_RIGHT	(1<<4)
#define BUTTON_LEFT		(1<<5)
#define BUTTON_UP		(1<<6)
#define BUTTON_DOWN		(1<<7)
#define BUTTON_R		(1<<8)
#define BUTTON_L		(1<<9)

// Variables for Button Macros
extern unsigned short oldButtons;
extern unsigned short buttons;

// Button Macros
#define BUTTON_HELD(key) (~(BUTTONS) & (key))
#define BUTTON_PRESSED(key) ((!(~(oldButtons) & (key))) && (~(buttons) & (key)))

// ============================== MISCELLANEOUS ===============================

// Miscellaneous Functions
int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);

#endif