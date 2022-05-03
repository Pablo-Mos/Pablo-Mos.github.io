
#include <stdlib.h>
#include "hw03lib.h"
#include "text.h"
#include "game.h"

// prototypes
void initialize();

void goToStart();
void start();
void goToGame();
void game();
void goToPause();
void pause();
void goToWin();
void win();
void goToLose();
void lose();

// States
enum {START, GAME, PAUSE, WIN, LOSE};
int state;

int dead;
int seed;
int dif = 10;

// buttons
unsigned short buttons;
unsigned short oldButtons;

//declarations
int rand();
// char buffer[41];

int main() {
	initialize();
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

void initialize() {
	REG_DISPCTL = MODE3 | BG2_ENABLE;
	goToStart();
}

void goToStart() {
    fillScreen(DARKBLUE);
    drawRect(38,25,164,34,BLACK);
    drawRect(40,27,160,30,LIGHTBLUE);
    drawString(47,37,"Welcome to WAVE CRASHER!",BLACK);
    drawString(65,80,"choose a difficulty",LIGHTBLUE);
    drawString(55,90,"& press START to begin",LIGHTBLUE);
    //displays correct difficulty
    if(dif == 10){
        drawString(45,120,"Easy",WHITE);
        drawString(100,120,"Medium",BLACK);
        drawString(170,120,"Hard",BLACK);
    }
    else if(dif == 5){
        drawString(45,120,"Easy",BLACK);
        drawString(100,120,"Medium",WHITE);
        drawString(170,120,"Hard",BLACK);
    }
    else{
        drawString(45,120,"Easy",BLACK);
        drawString(100,120,"Medium",BLACK);
        drawString(170,120,"Hard",WHITE);
    }
    drawRect(0,0,SCREENWIDTH,4,BLACK);
    drawRect(0,0,4,SCREENHEIGHT,BLACK);
    drawRect(0,SCREENHEIGHT-4,SCREENWIDTH,4,BLACK);
    drawRect(SCREENWIDTH-4,0,4,SCREENHEIGHT,BLACK);
    drawRect(0,0,SCREENWIDTH,2,LIGHTBLUE);
    drawRect(0,0,2,SCREENHEIGHT,LIGHTBLUE);
    drawRect(0,SCREENHEIGHT-2,SCREENWIDTH,2,LIGHTBLUE);
    drawRect(SCREENWIDTH-2,0,2,SCREENHEIGHT,LIGHTBLUE);
    state = START;
    dead = 0;
    pts = 0;
    seed = 0;
}
void start() {
    seed++;
    waitForVBlank();

    if (BUTTON_PRESSED(BUTTON_START)) {
        srand(seed);
        goToGame();
        initGame();
    }
    //move between difficulties
    if(BUTTON_PRESSED(BUTTON_RIGHT) && dif == 10){
        drawString(45,120,"Easy",BLACK);
        drawString(100,120,"Medium",WHITE);
        dif-=5;
    }
    else if(BUTTON_PRESSED(BUTTON_RIGHT) && dif == 5){
        drawString(100,120,"Medium",BLACK);
        drawString(170,120,"Hard",WHITE);
        dif-=5;
    }
    else if(BUTTON_PRESSED(BUTTON_RIGHT) && dif == 0){
        drawString(45,120,"Easy",WHITE);
        drawString(170,120,"Hard",BLACK);
        dif=10;
    }
    if(BUTTON_PRESSED(BUTTON_LEFT) && dif == 5){
        drawString(45,120,"Easy",WHITE);
        drawString(100,120,"Medium",BLACK);
        dif+=5;
    }
    else if(BUTTON_PRESSED(BUTTON_LEFT) && dif == 0){
        drawString(100,120,"Medium",WHITE);
        drawString(170,120,"Hard",BLACK);
        dif+=5;
    }
    else if(BUTTON_PRESSED(BUTTON_LEFT) && dif == 10){
        drawString(45,120,"Easy",BLACK);
        drawString(170,120,"Hard",WHITE);
        dif=0;
    }
}

void goToGame() {
    fillScreen(DARKERBLUE);
    state = GAME;
}
void game() {
    updateGame();
    waitForVBlank();
    drawGame();
    
    if (BUTTON_PRESSED(BUTTON_START))
        goToPause();
    else if (pts==FOODCOUNT-dif)
        goToWin();
    else if (dead)
        goToLose();
}

void goToPause() {
    fillScreen(GRAY);
    drawString(110,40,"Pause",BLACK);
    drawString(60,70,"press START to resume",BLACK);
    drawString(55,90,"press SELECT to restart",BLACK);
    state = PAUSE;
}
void pause() {
    waitForVBlank();

    if (BUTTON_PRESSED(BUTTON_START))
        goToGame();
    else if (BUTTON_PRESSED(BUTTON_SELECT))
        goToStart();
}

void goToWin() {
    fillScreen(GREEN);
    drawString(95,60,"You WON!",BLACK);
    drawString(45,90,"press START to play again",BLACK);
    state = WIN;
}
void win() {
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START))
        goToStart();
}

void goToLose() {
    fillScreen(RED);
    drawString(95,60,"You Lost",BLACK);
    drawString(45,90,"press START to play again",BLACK);
    state = LOSE;
}

void lose() {
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START))
        goToStart();
}