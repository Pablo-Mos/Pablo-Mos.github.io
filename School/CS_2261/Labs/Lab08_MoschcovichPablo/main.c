#include "lab08lib.h"
#include "game.h"
#include "spritesheet.h"
#include "house.h"
#include "foreground.h"
// TODO 3.0: Include foreground.h

// Prototypes
void initialize();
void goToGame();
void game();

// States
enum
{
    GAME
};
int state;

// Button Variables
unsigned short buttons;
unsigned short oldButtons;

int main()
{

    initialize();

    while (1)
    {

        // Update button variables
        oldButtons = buttons;
        buttons = BUTTONS;

        // State Machine
        switch (state)
        {

        case GAME:
            game();
            break;
        }
    }
}

// Sets up GBA
void initialize()
{

    // Set up the display
    // TODO 3.1: Enable background 0
    REG_DISPCTL = MODE0 | BG1_ENABLE | BG0_ENABLE | SPRITE_ENABLE;
    REG_BG0CNT = BG_CHARBLOCK(1) | BG_SCREENBLOCK(24) | BG_SIZE_SMALL;
    REG_BG1CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(31) | BG_SIZE_SMALL;

    // TODO 3.2: Set up background 0's control register

    // Set up the first state
    goToGame();
    initGame();
}

// Sets up the game state
void goToGame()
{

    // Make sure changes do not appear onscreen
    waitForVBlank();

    // Set up the house background
    DMANow(3, housePal, PALETTE, 256);
    DMANow(3, houseTiles, &CHARBLOCK[0], houseTilesLen / 2);
    DMANow(3, houseMap, &SCREENBLOCK[31], houseMapLen / 2);

    REG_BG0VOFF = vOff;
    REG_BG0HOFF = hOff;

    // TODO 3.3: Load foreground tiles to charblock

    // TODO 3.4: Load foreground map to screenblock

    // TODO 3.5: Set up background 0's hOff and vOff
    DMANow(3, housePal, PALETTE, 256);
    DMANow(3, foregroundTiles, &CHARBLOCK[1], foregroundTilesLen / 2);
    DMANow(3, foregroundMap, &SCREENBLOCK[24], foregroundMapLen / 2);
    REG_BG1VOFF = vOff;
    REG_BG1HOFF = hOff;
    // Set up the sprites
    DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen / 2);
    DMANow(3, spritesheetPal, SPRITEPALETTE, spritesheetPalLen / 2);
    hideSprites();
    DMANow(3, shadowOAM, OAM, 128 * 4);

    state = GAME;
}

// Runs every frame of the game state
void game()
{

    updateGame();
    drawGame();
}