#include "lab08lib.h"
#include "game.h"
#include "collisionmap.h"
// TODO 2.1: Include the collision map

// Variables
int hOff;
int vOff;
OBJ_ATTR shadowOAM[128];
SPRITE pikachu;

// TODO 2.1: Declare collisionMap and assign it the value collisionmapBitmap
// If you see a warning in the terminal when building because of this line,
// you need to fix it! (Hint: use a cast operation)
unsigned char *collisionMap = (unsigned char *)collisionmapBitmap;

// Pikachu animation states for aniState
enum
{
    PIKAFRONT,
    PIKABACK,
    PIKARIGHT,
    PIKALEFT,
    PIKAIDLE
};

// Initialize the game
void initGame()
{

    // Place screen on map
    vOff = 96;
    hOff = 9;

    initPlayer();
}

// Updates the game each frame
void updateGame()
{

    updatePlayer();
}

// Draws the game each frame
void drawGame()
{

    drawPlayer();

    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128 * 4);

    REG_BG1HOFF = hOff;
    REG_BG1VOFF = vOff;
}

// Initialize the player
void initPlayer()
{

    pikachu.width = 16;
    pikachu.height = 16;
    pikachu.rdel = 1;
    pikachu.cdel = 1;

    // Place in the middle of the screen in the world location chosen earlier
    pikachu.worldRow = SCREENHEIGHT / 2 - pikachu.width / 2 + vOff;
    pikachu.worldCol = SCREENWIDTH / 2 - pikachu.height / 2 + hOff;
    pikachu.aniCounter = 0;
    pikachu.curFrame = 0;
    pikachu.numFrames = 3;
    pikachu.aniState = PIKAFRONT;
}

// Handle every-frame actions of the player
// TODO 1.0: Make the character and screen move WITHOUT going off of the map
// TODO 2.3: Update this code to use collisionCheck
void updatePlayer()
{
    if (pikachu.worldRow >= MAPHEIGHT - pikachu.height - 1 && pikachu.worldCol <= SCREENWIDTH / 2)
        pikachu.worldRow--;
    if (BUTTON_HELD(BUTTON_UP))
    {
        // TODO 1.0: Replace the 1 (always true) with the correct conditional check
        if (collisionCheck(collisionMap, MAPWIDTH, pikachu.worldCol, pikachu.worldRow, pikachu.width, pikachu.height, 0, -pikachu.rdel) && pikachu.worldRow + pikachu.height - 1 > 0)
        {
            pikachu.worldRow -= pikachu.rdel;

            // TODO 1.0: Only move the screen if the character is in the proper spot
            // AND the screen isn't already at the edge
            if (vOff > 0 && pikachu.worldRow - vOff < SCREENHEIGHT / 2)
            {
                // TODO 1.0: Update background offset (aka move the screen) if the above is true
                vOff--;
            }
        }
    }
    if (BUTTON_HELD(BUTTON_DOWN))
    {
        // TODO 1.0: Replace the 1 (always true) with the correct conditional check
        // Use MAPHEIGHT for this!
        if (collisionCheck(collisionMap, MAPWIDTH, pikachu.worldCol, pikachu.worldRow, pikachu.width, pikachu.height, 0, pikachu.rdel) && pikachu.worldRow + pikachu.height - 1 < MAPHEIGHT)
        {
            pikachu.worldRow += pikachu.rdel;

            // TODO 1.0: Only move the screen if the character is in the proper spot
            // AND the screen isn't already at the edge
            if (vOff + SCREENHEIGHT < MAPHEIGHT && pikachu.worldRow - vOff > SCREENHEIGHT / 2)
            {
                // TODO 1.0: Update background offset if the above is true
                vOff++;
            }
        }
    }
    if (BUTTON_HELD(BUTTON_LEFT))
    {
        // TODO 1.0: Replace the 1 (always true) with the correct conditional check
        if (collisionCheck(collisionMap, MAPWIDTH, pikachu.worldCol, pikachu.worldRow, pikachu.width, pikachu.height, -pikachu.cdel, 0) && pikachu.worldCol > 0)
        {
            pikachu.worldCol -= pikachu.cdel;

            // TODO 1.0: Only move the screen if the character is in the proper spot
            // AND the screen isn't already at the edge
            if (hOff > 0 && pikachu.worldCol - hOff <= SCREENWIDTH / 2)
            {
                // TODO 1.0: Update background offset if the above is true
                hOff--;
            }
        }
    }
    if (BUTTON_HELD(BUTTON_RIGHT))
    {
        // TODO 1.0: Replace the 1 (always true) with the correct conditional check
        // Use MAPWIDTH for this!
        if (collisionCheck(collisionMap, MAPWIDTH, pikachu.worldCol, pikachu.worldRow, pikachu.width, pikachu.height, pikachu.cdel, 0) && pikachu.worldCol < SCREENWIDTH)
        {
            pikachu.worldCol += pikachu.cdel;

            // TODO 1.0: Only move the screen if the character is in the proper spot
            // AND the screen isn't already at the edge
            if (hOff + SCREENWIDTH < MAPWIDTH && pikachu.worldCol - hOff >= SCREENWIDTH / 2)
            {
                // TODO 1.0: Update background offset if the above is true
                hOff++;
            }
        }
    }
    animatePlayer();
}

// Handle player animation states
void animatePlayer()
{

    // Set previous state to current state
    pikachu.prevAniState = pikachu.aniState;
    pikachu.aniState = PIKAIDLE;

    // Change the animation frame every 20 frames of gameplay
    if (pikachu.aniCounter % 20 == 0)
    {
        pikachu.curFrame = (pikachu.curFrame + 1) % pikachu.numFrames;
    }

    // Control movement and change animation state
    if (BUTTON_HELD(BUTTON_UP))
        pikachu.aniState = PIKABACK;
    if (BUTTON_HELD(BUTTON_DOWN))
        pikachu.aniState = PIKAFRONT;
    if (BUTTON_HELD(BUTTON_LEFT))
        pikachu.aniState = PIKALEFT;
    if (BUTTON_HELD(BUTTON_RIGHT))
        pikachu.aniState = PIKARIGHT;

    // If the pikachu aniState is idle, frame is pikachu standing
    if (pikachu.aniState == PIKAIDLE)
    {
        pikachu.curFrame = 0;
        pikachu.aniCounter = 0;
        pikachu.aniState = pikachu.prevAniState;
    }
    else
    {
        pikachu.aniCounter++;
    }
}

// Draw the player
void drawPlayer()
{

    if (pikachu.hide)
    {
        shadowOAM[0].attr0 |= ATTR0_HIDE;
    }
    else
    {
        // TODO 1.1: Set the character's row and col properly
        shadowOAM[0].attr0 = (ROWMASK & pikachu.worldRow - vOff) | ATTR0_SQUARE;
        shadowOAM[0].attr1 = (COLMASK & pikachu.worldCol - hOff) | ATTR1_SMALL;
        shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(pikachu.aniState * 2, pikachu.curFrame * 2);
    }
}