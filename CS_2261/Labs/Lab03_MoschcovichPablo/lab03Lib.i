# 1 "lab03Lib.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "lab03Lib.c"
# 1 "lab03Lib.h" 1




typedef unsigned short u16;
# 25 "lab03Lib.h"
extern volatile unsigned short *videoBuffer;
# 47 "lab03Lib.h"
void setPixel(int col, int row, unsigned short color);
void drawRect(int col, int row, int width, int height, unsigned short color);
void fillScreen(unsigned short color);


void waitForVBlank();
# 72 "lab03Lib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 82 "lab03Lib.h"
int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);
# 2 "lab03Lib.c" 2

volatile unsigned short *videoBuffer = (unsigned short *)0x6000000;

void setPixel(int col, int row, unsigned short color) {
    videoBuffer[((row)*(240)+(col))] = color;
}

void drawRect(int col, int row, int width, int height, unsigned short color) {
    for (int i = 0; i < height; i++) {
        for (int j = 0; j < width; j++) {
            setPixel(col + j, row + i, color);
        }
    }
}

void fillScreen(unsigned short color) {
    for (int i = 0; i < 240 * 160; i++) {
        videoBuffer[i] = color;
    }
}

void waitForVBlank() {
    while ((*(volatile unsigned short *)0x4000006) > 160);
    while ((*(volatile unsigned short *)0x4000006) < 160);
}

int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB) {
    return
    rowA + heightA >= rowB
    && rowA <= rowB + heightB
    && colA + widthA >= colB
    && colA <= colB + widthB;
}
