# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
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
# 2 "main.c" 2
# 1 "kitty.h" 1




typedef struct {
 int* bitmap;
 unsigned short furColor;
} KITTY;

extern KITTY kitties[5];
extern int kittyBitmaps[5];


void initializeKitties();
void drawKitty(KITTY* kitty_ptr, int index);
# 3 "main.c" 2


KITTY kitties[5];
u16 buttons;
u16 oldButtons;


void initialize();
void updateGame();
void reverseKitties();

void swapKitties(KITTY *a, KITTY *b);

int main() {

    initialize();

    while(1) {

        oldButtons = buttons;
        buttons = (*(volatile unsigned short *)0x04000130);


        updateGame();
        waitForVBlank();
        for (int i = 0; i < 5; i++) {
            drawKitty(&kitties[i], i);
        }
    }
}


void initialize() {
    (*(volatile unsigned short *)0x4000000) = 3 | (1<<10);
    initializeKitties();
}

void updateGame() {
    if (((!(~(oldButtons) & ((1<<3)))) && (~(buttons) & ((1<<3))))) {
        reverseKitties();
    }
}

void reverseKitties() {

    int i = 0;
    int j = 5 - 1;
    while (j > i) {
        swapKitties(&kitties[j], &kitties[i]);
        i++;
        j--;
    }
}


void swapKitties(KITTY *a, KITTY *b){
    KITTY t = *a;
    *a = *b;
    *b = t;
}
