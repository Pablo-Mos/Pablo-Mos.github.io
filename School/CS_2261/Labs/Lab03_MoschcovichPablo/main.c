#include "lab03Lib.h"
#include "kitty.h"

// variables
KITTY kitties[KITTYCOUNT];
u16 buttons;
u16 oldButtons;

// prototypes
void initialize();
void updateGame();
void reverseKitties();
// TODO 3.1: add the function prototype for the swap method you wrote
void swapKitties(KITTY *a, KITTY *b);

int main() {
    // first, set up
    initialize();

    while(1) {
        // update buttons
        oldButtons = buttons;
        buttons = BUTTONS;

        // mode 3 "workflow": updateGame, waitForVBlank, drawGame
        updateGame();
        waitForVBlank();
        for (int i = 0; i < KITTYCOUNT; i++) {
            drawKitty(&kitties[i], i);
        }
    }
}

// sets up GBA
void initialize() {
    REG_DISPCTL = MODE3 | BG2_ENABLE;
    initializeKitties();
}

void updateGame() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        reverseKitties();
    }
}

void reverseKitties() {
    // TODO 3.2: implement this method, calling a helper method called swap; ensure you do an in-place array reversal
    int i = 0;
    int j = KITTYCOUNT - 1;
    while (j > i) {
        swapKitties(&kitties[j], &kitties[i]);
        i++;
        j--;
    }
}

// TODO 3.0: implement swap for two kitties
void swapKitties(KITTY *a, KITTY *b){
    KITTY t = *a;
    *a = *b;
    *b = t;
}