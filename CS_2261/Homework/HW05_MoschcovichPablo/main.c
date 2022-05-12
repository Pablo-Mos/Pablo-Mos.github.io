#include <stdlib.h>
#include <stdio.h>
#include "mode0.h"
#include "game.h"
#include "bg.h"
#include "gameScreen.h"
#include "gameScreen2.h"
#include "pause.h"
#include "win.h"
#include "lose.h"
#include "spritesheet.h"
#include "font.h"
#include "foreground.h"

// Prototypes.
void initialize();

// State Prototypes.
void goToStart();
void start();
void goToGame();
void game();
void goToGame2();
void game2();
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
    GAME,
    GAME2,
    PAUSE,
    WIN,
    LOSE
};
int state;
int seed;
int won = 0;
int won2 = 0;
int lvl;
int lives;
int pts;

// Button Variables.
unsigned short buttons;
unsigned short oldButtons;

int hOff = 0;
int vOff = 0;

// Shadow OAM.
OBJ_ATTR shadowOAM[128];

int main()
{
    initialize();

    // // text
    // DMANow(3, fontPal, SPRITEPALETTE, fontPalLen / 2);
    // DMANow(3, fontTiles, &CHARBLOCK[5], fontTilesLen / 2);
    // for (int i = 0; i < 128; i++)
    // {
    //     shadowOAM[i].attr0 = ATTR0_HIDE;
    // }

    // waitForVBlank();
    // DMANow(3, shadowOAM, OAM, 512);
    // REG_DISPCTL = MODE0 | SPRITE_ENABLE;
    while (1)
    {
        // // text
        // // C
        // shadowOAM[12].attr0 = 50 | ATTR0_4BPP | ATTR0_SQUARE;
        // shadowOAM[12].attr1 = 56 | ATTR1_SMALL;
        // shadowOAM[12].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(2 * 2, 0);
        // // O
        // shadowOAM[13].attr0 = 50 | ATTR0_4BPP | ATTR0_SQUARE;
        // shadowOAM[13].attr1 = 72 | ATTR1_SMALL;
        // shadowOAM[13].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(14 * 2, 0);

        // Update button variables.
        oldButtons = buttons;
        buttons = BUTTONS;

        // State Machine.
        switch (state)
        {
        case START:
            start();
            break;
        case GAME:
            game();
            break;
        case GAME2:
            game2();
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
    buttons = BUTTONS;
    oldButtons = 0;
    goToStart();
}

// Sets up the start state.
void goToStart()
{
    REG_BG0CNT = BG_4BPP | BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);
    REG_DISPCTL = MODE0 | BG0_ENABLE;

    DMANow(3, bgPal, PALETTE, 256);
    DMANow(3, bgTiles, &CHARBLOCK[0], bgTilesLen / 2);
    DMANow(3, bgMap, &SCREENBLOCK[28], bgMapLen / 2);

    buttons = BUTTONS;
    state = START;
    seed = 0;
    pts = 0;
}

// Runs every frame of the start state.
void start()
{
    seed++;
    if (BUTTON_PRESSED(BUTTON_START))
    {
        srand(seed);
        goToGame();
        initGame();
    }
}

// Sets up the game state.
void goToGame()
{
    lives = 3;

    REG_DISPCTL = MODE0 | BG0_ENABLE | /* BG1_ENABLE*/ SPRITE_ENABLE;
    // REG_BG1CNT = BG_CHARBLOCK(1) | BG_SCREENBLOCK(24) | BG_SIZE_SMALL;
    //  REG_BG1VOFF = vOff;
    //  REG_BG1HOFF = hOff;

    DMANow(3, gameScreenPal, PALETTE, 256);
    DMANow(3, gameScreenTiles, &CHARBLOCK[0], gameScreenTilesLen / 2);
    DMANow(3, gameScreenMap, &SCREENBLOCK[28], gameScreenMapLen / 2);
    DMANow(3, spritesheetPal, SPRITEPALETTE, 256);
    DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen / 2);
    hideSprites();
    waitForVBlank();
    state = GAME;
    lvl = 1;
}

void goToGame2()
{
    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
    DMANow(3, gameScreen2Pal, PALETTE, 256);
    DMANow(3, gameScreen2Tiles, &CHARBLOCK[0], gameScreen2TilesLen / 2);
    DMANow(3, gameScreen2Map, &SCREENBLOCK[28], gameScreen2MapLen / 2);
    DMANow(3, spritesheetPal, SPRITEPALETTE, 256);
    DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen / 2);
    hideSprites();
    waitForVBlank();
    state = GAME2;
}

// Runs every frame of the game state.
void game()
{
    showLives();
    updateGame();
    showScore();
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128 * 4);

    if (BUTTON_PRESSED(BUTTON_START))
    {
        goToPause();
    }
    if (won)
    {
        initGame();
        goToGame2();
    }
    if (!lives)
    {
        goToLose();
    }
}

void game2()
{
    showLives();
    updateGame();
    showScore();
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128 * 4);

    if (BUTTON_PRESSED(BUTTON_START))
    {
        goToPause();
    }
    if (won2)
    {
        goToWin();
    }
    if (!lives)
    {
        goToLose();
    }
}

// Sets up the pause state.
void goToPause()
{
    REG_DISPCTL = MODE0 | BG0_ENABLE;
    DMANow(3, pausePal, PALETTE, 256);
    DMANow(3, pauseTiles, &CHARBLOCK[0], pauseTilesLen / 2);
    DMANow(3, pauseMap, &SCREENBLOCK[28], pauseMapLen / 2);
    hideSprites();
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
        if (lvl == 1)
            goToGame();
        else
            goToGame2();
    }
    if (BUTTON_PRESSED(BUTTON_SELECT))
    {
        goToStart();
    }
}

// Sets up the win state.
void goToWin()
{
    REG_DISPCTL = MODE0 | BG0_ENABLE;
    DMANow(3, winPal, PALETTE, 256);
    DMANow(3, winTiles, &CHARBLOCK[0], winTilesLen / 2);
    DMANow(3, winMap, &SCREENBLOCK[28], winMapLen / 2);
    hideSprites();
    DMANow(3, shadowOAM, OAM, 128 * 4);
    waitForVBlank();
    state = WIN;
}

// Runs every frame of the win state.
void win()
{
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START))
        goToStart();
}

// Sets up the lose state.
void goToLose()
{
    REG_DISPCTL = MODE0 | BG0_ENABLE;
    DMANow(3, losePal, PALETTE, 256);
    DMANow(3, loseTiles, &CHARBLOCK[0], loseTilesLen / 2);
    DMANow(3, loseMap, &SCREENBLOCK[28], loseMapLen / 2);
    hideSprites();
    DMANow(3, shadowOAM, OAM, 128 * 4);
    waitForVBlank();
    state = LOSE;
}

// Runs every frame of the lose state.
void lose()
{
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START))
        goToStart();
}

void showLives()
{
    shadowOAM[15].attr0 = 2 | ATTR0_4BPP | ATTR0_WIDE;
    shadowOAM[15].attr1 = SCREENWIDTH - 70 | ATTR1_LARGE;
    shadowOAM[15].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(20, (lives - 1) * 4 + 8);
}

void showScore()
{
    shadowOAM[16].attr0 = 2 | ATTR0_4BPP | ATTR0_WIDE;
    shadowOAM[16].attr1 = SCREENWIDTH - 70 | ATTR1_LARGE;
    shadowOAM[16].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(20, 22);

    shadowOAM[17].attr0 = 18 | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[17].attr1 = SCREENWIDTH - 32 | ATTR1_SMALL;
    if (pts < 10)
        shadowOAM[17].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(28, 2 * pts);
    else
    {
        shadowOAM[17].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(28, 2 * (pts / 10));
        shadowOAM[18].attr0 = 18 | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[18].attr1 = SCREENWIDTH - 25 | ATTR1_SMALL;
        shadowOAM[18].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(28, 2 * (pts % 10));
    }
}