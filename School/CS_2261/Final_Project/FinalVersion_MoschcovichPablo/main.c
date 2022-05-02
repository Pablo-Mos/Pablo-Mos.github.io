#include <stdlib.h>
#include <stdio.h>
#include "mode0.h"
#include "game.h"
#include "startScreen.h"
#include "gameScreen.h"
#include "gameScreen2.h"
#include "instructionsScreen.h"
#include "pauseScreen.h"
#include "winScreen.h"
#include "loseScreen.h"
#include "spritesheet.h"
#include "collisionMap.h"
#include "startSong.h"
#include "gameSong.h"
#include "loseSong.h"
#include "winSong.h"
#include "sound.h"
#include "clickSound.h"

// Prototypes.
void initialize();

// State Prototypes.
void goToStart();
void start();
void goToInstructions();
void instructions();
void goToGame();
void game();
void goToPause();
void pause();
void goToWin();
void win();
void goToLose();
void lose();

// States.
enum
{
    START,
    INSTRUCTIONS,
    GAME,
    PAUSE,
    WIN,
    LOSE
};
int state;
int seed;
int won;
int lives;
int hasCheat;
int pts;
int hitFrames;
int currWeapon;
int numWeapons;
int numBullets;
int screenBlock;
int screenBlock2;
int time_m;
int time_s;
int timer;
int timerAniCounter;
int timerCurFrame;

// Button Variables.
unsigned short buttons;
unsigned short oldButtons;

int hOff = 0;
int hOff2 = 0;
int vOff = 0;

// Shadow OAM.
OBJ_ATTR shadowOAM[128];

int main()
{
    setupSounds();
    setupInterrupts();

    initialize();

    while (1)
    {
        // Update button variables.
        oldButtons = buttons;
        buttons = BUTTONS;

        // State Machine.
        switch (state)
        {
        case START:
            start();
            break;
        case INSTRUCTIONS:
            instructions();
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

// Sets up GBA.
void initialize()
{
    playSoundA(startSong_data, startSong_length, 1);

    screenBlock = 28;
    screenBlock2 = 24;
    buttons = BUTTONS;
    oldButtons = 0;
    goToStart();
}

// Sets up the start state.
void goToStart()
{
    REG_BG1CNT = BG_8BPP | BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31);
    REG_DISPCTL = MODE0 | BG1_ENABLE;

    DMANow(3, startScreenPal, PALETTE, 256);
    DMANow(3, startScreenTiles, &CHARBLOCK[0], startScreenTilesLen / 2);
    DMANow(3, startScreenMap, &SCREENBLOCK[31], startScreenMapLen / 2);

    buttons = BUTTONS;
    state = START;
    seed = 0;
    lives = 3;
    pts = 0;
    won = 0;
    hasCheat = 0;
}

// Runs every frame of the start state.
void start()
{
    seed++;
    if (BUTTON_PRESSED(BUTTON_START))
    {
        srand(seed);
        screenBlock = 28;
        screenBlock2 = 24;
        goToGame();
        // sound
        stopSound();
        playSoundB(clickSound_data, clickSound_length, 0);
        playSoundA(gameSong_data, gameSong_length, 1);
        //
        initGame();
        // restart timer when go to start screen (won't actually count until game state initialized)
        REG_TM2CNT = TIMER_OFF;
        REG_TM3CNT = TIMER_OFF;
        time_m = 3;
        time_s = 0;
        REG_TM2CNT = TM_FREQ_1024 | TIMER_ON | TM_IRQ;
        REG_TM3CNT = TM_FREQ_1024 | TIMER_ON | TM_IRQ;
    }
    if (BUTTON_PRESSED(BUTTON_SELECT))
    {
        playSoundB(clickSound_data, clickSound_length, 0);
        goToInstructions();
    }
    if (BUTTON_PRESSED(BUTTON_UP))
    {
        hasCheat = 1;
    }
}

// Sets up the game state.
void goToInstructions()
{
    REG_DISPCTL = MODE0 | BG1_ENABLE;

    DMANow(3, instructionsScreenPal, PALETTE, 256);
    DMANow(3, instructionsScreenTiles, &CHARBLOCK[0], instructionsScreenTilesLen / 2);
    DMANow(3, instructionsScreenMap, &SCREENBLOCK[31], instructionsScreenMapLen / 2);
    // hideSprites();
    waitForVBlank();
    state = INSTRUCTIONS;
}

// Runs every frame of the instructions state.
void instructions()
{
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_SELECT))
    {
        goToStart();
        playSoundB(clickSound_data, clickSound_length, 0);
    }
}

// Sets up the game state.
void goToGame()
{
    // resume timer
    REG_TM0CNT = TM_FREQ_1024 | TIMER_ON | TM_IRQ;
    REG_TM1CNT = TM_FREQ_1024 | TIMER_ON | TM_IRQ;

    REG_BG2CNT = BG_4BPP | BG_SIZE_WIDE | BG_CHARBLOCK(0) | BG_SCREENBLOCK(screenBlock);
    REG_BG0CNT = BG_4BPP | BG_SIZE_WIDE | BG_CHARBLOCK(1) | BG_SCREENBLOCK(screenBlock2);

    REG_BG0VOFF = vOff;
    REG_BG0HOFF = hOff;
    REG_BG2VOFF = vOff;
    REG_BG2HOFF = hOff2 / 2;

    REG_DISPCTL = MODE0 | BG0_ENABLE | BG2_ENABLE | SPRITE_ENABLE;

    DMANow(3, gameScreenPal, PALETTE, 256);
    DMANow(3, gameScreenTiles, &CHARBLOCK[0], gameScreenTilesLen / 2);
    DMANow(3, gameScreenMap, &SCREENBLOCK[28], gameScreenMapLen / 2);
    // DMANow(3, gameScreenPal, PALETTE, 256);
    DMANow(3, gameScreen2Tiles, &CHARBLOCK[1], gameScreen2TilesLen / 2);
    DMANow(3, gameScreen2Map, &SCREENBLOCK[24], gameScreen2MapLen / 2);
    DMANow(3, spritesheetPal, SPRITEPALETTE, 256);
    DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen / 2);
    hideSprites();
    waitForVBlank();
    state = GAME;
}

// Runs every frame of the game state.
void game()
{
    if (hOff > 256 && screenBlock2 < 26)
    {
        screenBlock2++;
        hOff -= 256;
        REG_BG0CNT = BG_CHARBLOCK(1) | BG_SCREENBLOCK(screenBlock2) | BG_SIZE_WIDE | BG_4BPP;
    }
    else if (hOff < 0 && screenBlock2 > 24)
    {
        screenBlock2--;
        hOff += 256;
        REG_BG0CNT = BG_CHARBLOCK(1) | BG_SCREENBLOCK(screenBlock2) | BG_SIZE_WIDE | BG_4BPP;
    }
    if (hOff2 > 256 && screenBlock < 30)
    {
        screenBlock++;
        hOff2 -= 256;
        REG_BG2CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(screenBlock) | BG_SIZE_WIDE | BG_4BPP;
    }
    else if (hOff2 < 0 && screenBlock > 28)
    {
        screenBlock--;
        hOff2 += 256;
        REG_BG2CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(screenBlock) | BG_SIZE_WIDE | BG_4BPP;
    }
    ///////
    REG_BG0VOFF = vOff;
    REG_BG0HOFF = hOff;
    REG_BG2VOFF = vOff;
    REG_BG2HOFF = hOff2 / 2;

    showLives();
    showTime();
    updateGame();
    showScore();
    showAmmo();
    showWeapons();
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128 * 4);

    if (BUTTON_PRESSED(BUTTON_START))
    {
        goToPause();
        pauseSound();
        playSoundB(clickSound_data, clickSound_length, 0);
    }
    if (won)
    {
        goToWin();
    }
    if (lives <= 0 || (time_m == 0 && time_s == 0))
    {
        goToLose();
    }
}

// Sets up the pause state.
void goToPause()
{
    REG_TM0CNT = TIMER_OFF;
    REG_TM1CNT = TIMER_OFF;

    REG_BG1CNT = BG_8BPP | BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31);
    REG_DISPCTL = MODE0 | BG1_ENABLE;
    DMANow(3, pauseScreenPal, PALETTE, 256);
    DMANow(3, pauseScreenTiles, &CHARBLOCK[0], pauseScreenTilesLen / 2);
    DMANow(3, pauseScreenMap, &SCREENBLOCK[31], pauseScreenMapLen / 2);
    // hideSprites();
    DMANow(3, shadowOAM, OAM, 128 * 4);
    waitForVBlank();
    state = PAUSE;
}

// Runs every frame of the pause state.
void pause()
{
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START))
    {
        goToGame();
        unpauseSound();
        playSoundB(clickSound_data, clickSound_length, 0);
    }
    if (BUTTON_PRESSED(BUTTON_SELECT))
    {
        goToStart();
        stopSound();
        playSoundB(clickSound_data, clickSound_length, 0);
        playSoundA(startSong_data, startSong_length, 1);
    }
}

// Sets up the win state.
void goToWin()
{
    REG_BG1CNT = BG_8BPP | BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31);
    REG_DISPCTL = MODE0 | BG1_ENABLE | SPRITE_ENABLE;
    DMANow(3, winScreenPal, PALETTE, 256);
    DMANow(3, winScreenTiles, &CHARBLOCK[0], winScreenTilesLen / 2);
    DMANow(3, winScreenMap, &SCREENBLOCK[31], winScreenMapLen / 2);
    // hideSprites();
    for (int i = 0; i < 124; i++)
    {
        shadowOAM[i].attr0 |= ATTR0_HIDE;
    }
    showScoreEnd();
    DMANow(3, shadowOAM, OAM, 128 * 4);
    waitForVBlank();
    state = WIN;
    stopSound();
    playSoundA(winSong_data, winSong_length, 1);
}

// Runs every frame of the win state.
void win()
{
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START))
    {
        goToStart();
        stopSound();
        playSoundB(clickSound_data, clickSound_length, 0);
        playSoundA(startSong_data, startSong_length, 1);
    }
}

// Sets up the lose state.
void goToLose()
{
    REG_BG1CNT = BG_8BPP | BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31);
    REG_DISPCTL = MODE0 | BG1_ENABLE | SPRITE_ENABLE;
    DMANow(3, loseScreenPal, PALETTE, 256);
    DMANow(3, loseScreenTiles, &CHARBLOCK[0], loseScreenTilesLen / 2);
    DMANow(3, loseScreenMap, &SCREENBLOCK[31], loseScreenMapLen / 2);
    // hideSprites();
    for (int i = 0; i < 124; i++)
    {
        shadowOAM[i].attr0 |= ATTR0_HIDE;
    }
    showScoreEnd();
    DMANow(3, shadowOAM, OAM, 128 * 4);
    waitForVBlank();
    state = LOSE;
    stopSound();
    playSoundA(loseSong_data, loseSong_length, 1);
}

// Runs every frame of the lose state.
void lose()
{
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START))
    {
        goToStart();
        stopSound();
        playSoundB(clickSound_data, clickSound_length, 0);
        playSoundA(startSong_data, startSong_length, 1);
    }
}

void showLives()
{
    shadowOAM[1].attr0 = 5 | ATTR0_4BPP | ATTR0_WIDE;
    shadowOAM[1].attr1 = SCREENWIDTH - 35 | ATTR1_SMALL;
    shadowOAM[1].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(20, (lives - 1) + 5);
}

void showScore()
{
    shadowOAM[2].attr0 = 3 | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[2].attr1 = SCREENWIDTH - 37 - 40 | ATTR1_SMALL;
    shadowOAM[2].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(26, 4);
    shadowOAM[3].attr0 = 5 | ATTR0_4BPP | ATTR0_TALL;
    shadowOAM[3].attr1 = SCREENWIDTH - 25 - 40 | ATTR1_TINY;
    shadowOAM[3].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(28, 20);
    shadowOAM[4].attr0 = 4 | ATTR0_4BPP | ATTR0_TALL;
    shadowOAM[4].attr1 = SCREENWIDTH - 21 - 40 | ATTR1_TINY;
    shadowOAM[4].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(28, 2 * (pts / 10));
    shadowOAM[5].attr0 = 4 | ATTR0_4BPP | ATTR0_TALL;
    shadowOAM[5].attr1 = SCREENWIDTH - 13 - 40 | ATTR1_TINY;
    shadowOAM[5].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(28, 2 * (pts % 10));
}

void showScoreEnd()
{
    shadowOAM[125].attr0 = 78 | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[125].attr1 = 134 | ATTR1_SMALL;
    shadowOAM[125].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(26, 4);
    shadowOAM[126].attr0 = 80 | ATTR0_4BPP | ATTR0_TALL;
    shadowOAM[126].attr1 = 146 | ATTR1_TINY;
    shadowOAM[126].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(28, 20);
    shadowOAM[127].attr0 = 79 | ATTR0_4BPP | ATTR0_TALL;
    shadowOAM[127].attr1 = 150 | ATTR1_TINY;
    shadowOAM[127].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(28, 2 * (pts / 10));
    shadowOAM[124].attr0 = 79 | ATTR0_4BPP | ATTR0_TALL;
    shadowOAM[124].attr1 = 158 | ATTR1_TINY;
    shadowOAM[124].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(28, 2 * (pts % 10));
}

void showAmmo()
{
    shadowOAM[6].attr0 = 5 | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[6].attr1 = 8 | ATTR1_TINY;
    shadowOAM[6].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(22, 1);
    shadowOAM[7].attr0 = 5 | ATTR0_4BPP | ATTR0_TALL;
    shadowOAM[7].attr1 = 8 + 8 | ATTR1_TINY;
    shadowOAM[7].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(28, 20);

    shadowOAM[8].attr0 = 4 | ATTR0_4BPP | ATTR0_TALL;
    shadowOAM[8].attr1 = 8 + 8 + 4 | ATTR1_TINY;
    shadowOAM[8].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(28, 2 * (numBullets / 10));
    shadowOAM[9].attr0 = 4 | ATTR0_4BPP | ATTR0_TALL;
    shadowOAM[9].attr1 = 8 + 8 + 8 + 4 | ATTR1_TINY;
    shadowOAM[9].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(28, 2 * (numBullets % 10));
}

void showWeapons()
{
    // actual weapon
    if (currWeapon == SHIELD)
    {
        shadowOAM[10].attr0 = 5 | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[10].attr1 = 56 - 8 | ATTR1_TINY;
        shadowOAM[10].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(20, 3);
    }
    else
        shadowOAM[10].attr0 = ATTR0_HIDE;

    if (currWeapon == KNIFE)
    {
        shadowOAM[11].attr0 = 5 | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[11].attr1 = 56 + 2 | ATTR1_TINY;
        shadowOAM[11].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(21, 3);
    }
    else
        shadowOAM[11].attr0 = ATTR0_HIDE;

    if (currWeapon == GUN)
    {
        shadowOAM[12].attr0 = 5 | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[12].attr1 = 56 + 9 | ATTR1_TINY;
        shadowOAM[12].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(22, 3);
    }
    else
        shadowOAM[12].attr0 = ATTR0_HIDE;

    // backdrop
    shadowOAM[13].attr0 = 5 | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[13].attr1 = 56 - 8 | ATTR1_TINY;
    shadowOAM[13].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(20, 4);
    shadowOAM[14].attr0 = 5 | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[14].attr1 = 56 + 2 | ATTR1_TINY;
    shadowOAM[14].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(21, 4);
    shadowOAM[15].attr0 = 5 | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[15].attr1 = 56 + 9 | ATTR1_TINY;
    shadowOAM[15].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(22, 4);
}

void showTime()
{
    short time_m_1s = time_m % 10;
    short time_s_1s = time_s % 10;
    short time_s_10s = time_s / 10;

    char y = 145;
    char x = 8;
    if (timerAniCounter % 10 == 0 && timer % 2 == 0)
    {
        timerCurFrame = (timerCurFrame + 1) % 8;
    }
    timerAniCounter++;
    shadowOAM[16].attr0 = y | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[16].attr1 = x - 4 | ATTR1_SMALL;
    shadowOAM[16].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(30, 2 * timerCurFrame);

    shadowOAM[17].attr0 = y | ATTR0_4BPP | ATTR0_TALL;
    shadowOAM[17].attr1 = x + 8 | ATTR1_TINY;
    shadowOAM[17].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(28, 2 * time_m_1s);

    shadowOAM[18].attr0 = y | ATTR0_4BPP | ATTR0_TALL;
    shadowOAM[18].attr1 = x + 8 + 8 | ATTR1_TINY;
    shadowOAM[18].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(28, 20);

    shadowOAM[19].attr0 = y | ATTR0_4BPP | ATTR0_TALL;
    shadowOAM[19].attr1 = x + 8 + 8 + 4 | ATTR1_TINY;
    shadowOAM[19].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(28, 2 * time_s_10s);

    shadowOAM[20].attr0 = y | ATTR0_4BPP | ATTR0_TALL;
    shadowOAM[20].attr1 = x + 8 + 8 + 8 + 4 | ATTR1_TINY;
    shadowOAM[20].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(28, 2 * time_s_1s);
}