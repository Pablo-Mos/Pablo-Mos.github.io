// DONE: Working state machine, collision map for player to move around correctly, player movement (horizontal and jumping),
//      player actions (block, stab, shoot), weapon/item rotation, bullet movement for enemy and player, ability to collect coins,
//      weapons/items, and ammo, ability to kill enemies with bullets/stabbing(if nearby), ability to get hurt by enemy
//      (if contact with enemy or their bullets)(waits to lose another life if player remains touching enemy), lose if no lives left,
//      win by getting 10 points (gained through killing enemies and getting coins)
//
// WILL BE ADDED: Actual backgrounds for different states with cohesive theme, XL background for game state
//      (player will win once reaches end of long map), updated UI for top corners (showing lives, points, etc.),
//      new sprites for all characters and objects, walls that can be broken down by player (use tiles),
//      improve collisions, fix spritesheet layout, make better animations for player actions
//
// BUGS: can't jump if all the way on right of screen (will fix once implement XL background), sometimes player can get stuck between platform
//
// HOW TO PLAY:
//     BUTTON CONTROLS:
//          LEFT: move player left
//          RIGHT: move player right
//          UP: aim bullet upward once shot
//          DOWN: aim bullet downward once shot
//          START: go to pause screen
//          SELECT: switch weapons (amongst available)
//          B: make player jump
//          A: use weapon/item equipped
//              -shield: block/destroy enemy bullets (can hold button for this item action only)
//              -knife: stab nearby enemy
//              -gun: shoot bullet (hold UP to shoot up) (if shot horizontally, can hold UP or DOWN to move bullet shot after release)
//      Instructions:
//          Move through map to get weapons and other items. Avoid collision with enemies and their bullets (causes loss of life). Gain points
//          (10 points wins game) by collecting coins (special coin awards a life and 4 bonus points) and killing enemies
//          (boss requires 4 hits to kill, rest need only 2). Collect ammo to use with gun by finding different ammo packets (have 5 bullets).
//          Swap weapon/item equipped to use different actions (block, stab, shoot). Lose game by losing all lives

#include <stdlib.h>
#include <stdio.h>
#include "mode0.h"
#include "game.h"
#include "bg.h"
#include "gameScreen.h"
#include "instructions.h"
#include "pause.h"
#include "win.h"
#include "lose.h"
#include "spritesheet.h"
#include "font.h"
#include "collisionMap.h"

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
int won = 0;
int lives;
int pts;
int currWeapon;
int numWeapons;
int numBullets;

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
    buttons = BUTTONS;
    oldButtons = 0;
    goToStart();
}

// Sets up the start state.
void goToStart()
{
    REG_BG0VOFF = 0;
    REG_BG0HOFF = 0;

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
    if (BUTTON_PRESSED(BUTTON_SELECT))
    {
        goToInstructions();
    }
}

// Sets up the game state.
void goToInstructions()
{
    REG_DISPCTL = MODE0 | BG0_ENABLE;

    DMANow(3, instructionsPal, PALETTE, 256);
    DMANow(3, instructionsTiles, &CHARBLOCK[0], instructionsTilesLen / 2);
    DMANow(3, instructionsMap, &SCREENBLOCK[28], instructionsMapLen / 2);
    hideSprites();
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
    }
}

// Sets up the game state.
void goToGame()
{
    REG_BG0CNT = BG_4BPP | BG_SIZE_WIDE | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);

    REG_BG0VOFF = vOff;
    REG_BG0HOFF = hOff;

    lives = 3;

    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;

    DMANow(3, gameScreenPal, PALETTE, 256);
    DMANow(3, gameScreenTiles, &CHARBLOCK[0], gameScreenTilesLen / 2);
    DMANow(3, gameScreenMap, &SCREENBLOCK[28], gameScreenMapLen / 2);
    DMANow(3, spritesheetPal, SPRITEPALETTE, 256);
    DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen / 2);
    hideSprites();
    waitForVBlank();
    state = GAME;
}

// Runs every frame of the game state.
void game()
{
    REG_BG0VOFF = vOff;
    REG_BG0HOFF = hOff;

    showLives();
    updateGame();
    showScore();
    showAmmo();
    showWeapons();
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128 * 4);

    if (BUTTON_PRESSED(BUTTON_START))
    {
        goToPause();
    }
    if (pts >= 10)
    {
        goToWin();
    }
    if (lives <= 0)
    {
        goToLose();
    }
}

// Sets up the pause state.
void goToPause()
{
    REG_BG0VOFF = 0;
    REG_BG0HOFF = 0;

    REG_BG0CNT = BG_4BPP | BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);
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
        goToGame();
    }
    if (BUTTON_PRESSED(BUTTON_SELECT))
    {
        goToStart();
    }
}

// Sets up the win state.
void goToWin()
{
    REG_BG0VOFF = 0;
    REG_BG0HOFF = 0;

    REG_BG0CNT = BG_4BPP | BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);
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
    REG_BG0VOFF = 0;
    REG_BG0HOFF = 0;

    REG_BG0CNT = BG_4BPP | BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);
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
    shadowOAM[1].attr0 = 2 | ATTR0_4BPP | ATTR0_WIDE;
    shadowOAM[1].attr1 = SCREENWIDTH - 70 | ATTR1_LARGE;
    shadowOAM[1].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(20, (lives - 1) * 4 + 8);
}

void showScore()
{
    shadowOAM[2].attr0 = 2 | ATTR0_4BPP | ATTR0_WIDE;
    shadowOAM[2].attr1 = SCREENWIDTH - 70 | ATTR1_LARGE;
    shadowOAM[2].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(20, 22);

    shadowOAM[3].attr0 = 17 | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[3].attr1 = SCREENWIDTH - 28 | ATTR1_SMALL;
    if (pts < 10)
        shadowOAM[3].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(28, 2 * pts);
    else
    {
        shadowOAM[3].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(28, 2 * (pts / 10));
        shadowOAM[4].attr0 = 17 | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[4].attr1 = SCREENWIDTH - 20 | ATTR1_SMALL;
        shadowOAM[4].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(28, 2 * (pts % 10));
    }
}

void showAmmo()
{
    shadowOAM[5].attr0 = 4 | ATTR0_4BPP | ATTR0_WIDE;
    shadowOAM[5].attr1 = 8 | ATTR1_LARGE;
    shadowOAM[5].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(20, 20);

    shadowOAM[6].attr0 = 4 | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[6].attr1 = 48 | ATTR1_SMALL;
    if (numBullets < 10)
    {
        shadowOAM[6].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(28, 2 * numBullets);
        shadowOAM[7].attr0 = ATTR0_HIDE;
    }
    else
    {
        shadowOAM[6].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(28, 2 * (numBullets / 10));
        shadowOAM[7].attr0 = 4 | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[7].attr1 = 56 | ATTR1_SMALL;
        shadowOAM[7].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(28, 2 * (numBullets % 10));
    }
}

void showWeapons()
{
    shadowOAM[8].attr0 = 18 | ATTR0_4BPP | ATTR0_WIDE;
    shadowOAM[8].attr1 = 7 | ATTR1_LARGE;
    shadowOAM[8].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(20, 28);
    if (numWeapons > 0) // possibly remove this line when implement different UI for weapons
    {
        shadowOAM[9].attr0 = 17 | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[9].attr1 = 56 | ATTR1_TINY;
        if (currWeapon == SHIELD)
            shadowOAM[9].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(12, 0);
        else if (currWeapon == KNIFE)
            shadowOAM[9].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(13, 0);
        else if (currWeapon == GUN)
            shadowOAM[9].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(14, 0);
    }
}