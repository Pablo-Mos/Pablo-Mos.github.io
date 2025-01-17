#ifndef hw03lib_H
#define hw03lib_H

// common typedefs
typedef unsigned short u16;

// common macros
#define OFFSET(col,row,rowlen) ((row)*(rowlen)+(col))

// ================================= DISPLAY ==================================

// display control register
#define REG_DISPCTL (*(volatile unsigned short *)0x4000000)
#define MODE3 3
#define BG2_ENABLE (1<<10)

// display status registers
#define SCANLINECOUNTER (*(volatile unsigned short *)0x4000006)

// display constants
#define SCREENHEIGHT 160
#define SCREENWIDTH 240

// video buffer
extern volatile unsigned short *videoBuffer;

// color
#define COLOR(r,g,b) ((r) | (g)<<5 | (b)<<10)
#define BLACK 0
#define GRAY COLOR(20, 20, 20)
#define WHITE COLOR(31,31,31)
#define RED COLOR(31,0,0)
#define GREEN COLOR(0,31,0)
#define BLUE COLOR(0,0,31)
#define CYAN COLOR(0,31,31)
#define MAGENTA COLOR(31,0,31)
#define YELLOW COLOR(31,31,0)
#define ORANGE COLOR(31,10,0)
#define PINK COLOR(31,10,16)
#define BROWN COLOR(22,11,6)
#define DARKBLUE COLOR(0,5,31)
#define DARKERBLUE COLOR(0,0,10)
#define LIGHTBLUE COLOR(0,19,31)
#define LIGHTERBLUE COLOR(0,25,31)
#define DARKGREEN COLOR(0,20,0)

// mode 3 drawing functions
void setPixel(int col, int row, unsigned short color);
void drawRect(int col, int row, int width, int height, unsigned short color);
void drawCircle(int row, int col, int radius, unsigned short color);
void fillScreen(unsigned short color);
// miscellaneous drawing functions
void waitForVBlank();


// ================================== INPUT ===================================

// button register
#define BUTTONS (*(volatile unsigned short *)0x04000130)

// button masks
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

// variables for button macros
extern unsigned short oldButtons;
extern unsigned short buttons;

// button macros
#define BUTTON_HELD(key) (~BUTTONS & (key))
#define BUTTON_PRESSED(key)((!(~oldButtons & key)) && (~buttons & (key)))

// ============================== MISCELLANEOUS ===============================

// miscellaneous functions
int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);

#endif