# 1 "hw02lib.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "hw02lib.c"
# 1 "hw02lib.h" 1




typedef unsigned short u16;
# 25 "hw02lib.h"
extern volatile unsigned short *videoBuffer;
# 43 "hw02lib.h"
void setPixel(int col, int row, unsigned short color);
void drawRect(int col, int row, int width, int height, unsigned short color);
void drawCircle(int row, int col, int radius, unsigned short color);
void fillScreen(unsigned short color);

void waitForVBlank();
# 69 "hw02lib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 79 "hw02lib.h"
int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);

typedef struct {
 int row;
 int col;
 int oldRow;
 int oldCol;
} BALL;

typedef struct {
 int row;
 int col;
    int oldRow;
 int oldCol;
} FOOD;
# 2 "hw02lib.c" 2

volatile unsigned short *videoBuffer = (unsigned short *)0x6000000;

void setPixel(int col, int row, unsigned short color) {
    videoBuffer[((row)*(240)+(col))] = color;
}

void drawRect(int col, int row, int width, int height, unsigned short color) {
    for(int i=0; i<height; i++) {
        for(int j=0; j<width; j++){
            setPixel(col+j, row+i, color);
        }
    }
}

void drawCircle(int row, int col, int radius, unsigned short color) {
    for (int y = -radius; y <= radius; y++) {
        for (int x = -radius; x <= radius; x++) {
            if (x*x + y*y <= radius * radius) {
                setPixel(row + x, col + y, color);
            }
        }
    }
}



void fillScreen(unsigned short color) {
    for(int i=0; i<=38400; i++) {
        (*(u16*)(0x06000000+(2*i))) = color;
    }
}

void waitForVBlank() {
    while ((*(volatile unsigned short *)0x4000006) > 160);
    while ((*(volatile unsigned short *)0x4000006) < 160);
}

int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB) {
    if ((((rowA + heightA - 1) > rowB) && (rowA < (rowB + heightB - 1))) && (((colA + widthA - 1) > colB) && (colA < (colB + widthB - 1)))) {
        return 1;
    } else {
        return 0;
    }
}
