#include <stdlib.h>
#include "lab04Lib.h"
#include "game.h"
#include "text.h"

// Prototypes
void initialize();

// State Prototypes
// TODO 1.2: Add your state and state transition function prototypes here
void goToStart(), goToGame(), goToPause(), goToWin(), goToLose();
void startState(), gameState(), pauseState(), winState(), loseState();

// States
enum {START, GAME, PAUSE, WIN, LOSE};
int state;


// Button Variables
unsigned short buttons;
unsigned short oldButtons;

// Random Seed
int seed;

int main() {

    initialize();

    while(1) {

        // Update button variables
        oldButtons = buttons;
        buttons = BUTTONS;
                
        // State Machine
        // TODO 1.0: Make the state machine here 
        switch(state) {
            case(START):
                startState();
                break;
            case(GAME):
                gameState();
                break;
            case(PAUSE):
                pauseState();
                break;
            case(WIN):
                winState();
                break;
            case(LOSE):
                loseState();
                break;
        }
    }
}

// Sets up GBA
void initialize() {

    REG_DISPCTL = MODE3 | BG2_ENABLE;

    // TODO 1.3: Call your goToStart function here
    goToStart();
}

// TODO 1.1: Make your state and state transition functions
void goToStart() {
    fillScreen(PINK);
    drawString(50,50,"press SELECT to play",BLACK);
    state = START;
}
void startState() {
    seed += 1;
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToGame();
        srand(seed);
        initGame();
    }
}

void goToGame() {
    fillScreen(BLACK);
    state = GAME;
}

void gameState() {
    updateGame();
    waitForVBlank();
    drawGame();
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToPause();
    }
    if (ballsRemaining==0) {
        goToWin();
    }
    if (BUTTON_PRESSED(BUTTON_A)) {
        goToLose();
    }
}

void goToPause() {
    fillScreen(BLUE);
    drawString(50,50,"paused",BLACK);
    state = PAUSE;
}

void pauseState() { 
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToGame();
    }
}

void goToWin() {
    fillScreen(GREEN);
    drawString(50,50,"you win!",BLACK);
    state = WIN;
}

void winState() {
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }
}

void goToLose() {
    fillScreen(RED);
    drawString(50,50,"you lose!",BLACK);
    state = LOSE;
}

void loseState() {
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }
}
// TODO 2.1: Add drawString calls for each state transition function inside your state machine    



