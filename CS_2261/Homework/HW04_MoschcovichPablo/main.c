#include <stdlib.h>
#include <stdio.h>
#include "HW04Lib.h"
#include "text.h"
#include "game.h"
#include "bg.h"

// prototypes
void initialize();

// state prototypes
void goToStart();
void goToGame();
void goToPause();
void goToWin();
void goToLose();

void start();
void game();
void pause();
void win();
void lose();

void soundStuff();
// game states
enum {START, GAME, PAUSE, WIN, LOSE};
int state;
int dim;

// buttons
unsigned short buttons;
unsigned short oldButtons;

// random seed
int seed;

// determine win/loss
extern int gameState;

// text buffer
char buffer[41];

int main() {
    initialize();
    soundStuff();

    while (1) {
        oldButtons = buttons;
        buttons = BUTTONS;

        switch(state) {
            case START:
                start();
                break;
            case GAME:
                game();
                break;
            case PAUSE:
                pause();
                break;
            case WIN:
                win();
                break;
            case LOSE:
                lose();
                break;    
        }
    }
}

// set up GBA
void initialize() {

    REG_DISPCTL = MODE4 | BG2_ENABLE | DISP_BACKBUFFER;

    goToStart();
}

// set up start state
void goToStart() {
    unsigned short colors[NUMCOLORS] = {BLACK, BLUE, GREEN, RED, WHITE, GRAY};

    DMANow(3, &bgPal, PALETTE, 256);
    drawFullscreenImage4(bgBitmap);

    for (int i = 0; i < NUMCOLORS; i++) {
        PALETTE[256-NUMCOLORS+i] = colors[i];
    }

    waitForVBlank();
    flipPage();

    state = START;
    dim = 0;
    seed = 0;
}

// run start state for each frame
void start() {
    seed++;
    waitForVBlank();

    if (BUTTON_PRESSED(BUTTON_START)) {
        srand(seed);
        goToGame();
        initGame();
    }
}

// set up game state
void goToGame() {        
    state = GAME;
}

// runs game state for each frame
void game() {
    updateGame();
    drawGame();

    // text if enemies are still present
    if (enemiesRemaining > 0) {
        sprintf(buffer, "Evil Fish Remaining: %d", enemiesRemaining);
        drawString4(8, 145, buffer, WHITEID);
    }

    //  enemies are all destroyed
    if (enemiesRemaining == 0) {
        sprintf(buffer, "Go to Shore!");
        drawString4(8, 145, buffer, WHITEID);
    }

    waitForVBlank();
    flipPage();

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }
    if (gameState == 1) {
        goToWin();
    }
    if (gameState == -1) {
        goToLose();
    }
}

// set up pause state
void goToPause() {
    fillScreen4(GRAYID);
    drawRect4(5,5,SCREENWIDTH-10,SCREENHEIGHT-10,BLACKID);
    drawRect4(10,10,SCREENWIDTH-20,SCREENHEIGHT-20,GRAYID);
    drawString4(110,40,"Pause", BLACKID);
    drawString4(60,70,"press START to resume", BLACKID);
    drawString4(55,90,"press SELECT to restart", BLACKID);
    waitForVBlank();
    flipPage();

    state = PAUSE;
}

// run pause state each frame
void pause() {
    waitForVBlank();

    if (BUTTON_PRESSED(BUTTON_START))
        goToGame();
    else if (BUTTON_PRESSED(BUTTON_SELECT))
        goToStart();
}

// set up win state
void goToWin() {
    fillScreen4(GREENID);
    drawRect4(5,5,SCREENWIDTH-10,SCREENHEIGHT-10,BLACKID);
    drawRect4(10,10,SCREENWIDTH-20,SCREENHEIGHT-20,GREENID);
    drawString4(95,60,"You WON!", BLACKID);
    drawString4(45,90,"press START to play again", BLACKID);
    waitForVBlank();
    flipPage();
    state = WIN;
}

// run win state for each frame
void win() {
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START))
        goToStart();
}

// set up lose state
void goToLose() {
    fillScreen4(REDID);
    drawRect4(5,5,SCREENWIDTH-10,SCREENHEIGHT-10,BLACKID);
    drawRect4(10,10,SCREENWIDTH-20,SCREENHEIGHT-20,REDID);
    drawString4(95,60,"You Lost", BLACKID);
    drawString4(45,90,"press START to play again", BLACKID);
    waitForVBlank();
    flipPage();
    state = LOSE;
}

// run lose state for each frame
void lose() {
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START))
        goToStart();
}

// Enable sound master controls 
void soundStuff(){
    REG_SOUNDCNT_X = SND_ENABLED;
    REG_SOUNDCNT_L = DMG_VOL_LEFT(5) |
                   DMG_VOL_RIGHT(5) |
                   DMG_SND1_LEFT |
                   DMG_SND1_RIGHT |
                   DMG_SND2_LEFT |
                   DMG_SND2_RIGHT |
                   DMG_SND3_LEFT |
                   DMG_SND3_RIGHT |
                   DMG_SND4_LEFT |
                   DMG_SND4_RIGHT;
    REG_SOUNDCNT_H = DMG_MASTER_VOL(2);
}