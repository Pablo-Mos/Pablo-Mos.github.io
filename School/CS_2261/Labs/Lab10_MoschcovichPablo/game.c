#include "game.h"
#include "tetreminos.h"
#include "tetrisLib.h"
#include "sound.h"
#include "rowClearSound.h"
// TODO 1.1: Include rowClearSound header file here

// 28 unique rotations between all of the tetreminos, 4x4 grid for each of them. Check out collision_maps.c to see them!
// To get a particular tetremino's collisionMap, do collisionMaps[currentTetreminoType * 4 + currentTetreminoRotation]
extern int collisionMaps[28][16];

unsigned short gameboard[32][32];

extern void goToLose();
extern void goToWin();

// Tetremino Types
enum
{
    T,
    L,
    SKEW,
    SQUARE,
    STRAIGHT,
    SKEW2,
    L2
};

int currentTetreminoType;     // The tetremino type currently falling
int currentTetreminoRotation; // Rotation of the falling tetremino: 0 -> 0, 1 -> 90 CW, 2 -> 180, 3 -> 270 CW
int currentTetreminoCol;
int currentTetreminoRow;

int linesCleared = 0;

// TODO 1.0: Complete this function
// Return 1 if the row is entirely filled with tetriminos and 0 otherwise
// HINT: If any spot in the row is blank, set toReturn = 0
// HINT: If a spot in empty, the tilemap entry there will be 0
int checkIfRowIsFilled(int row)
{
    // 0th index is the left border tile, so we go from [1, width] (inclusive)
    for (int col = 1; col < GAMEBOARD_WIDTH + 1; col++)
    {
        // TODO: Replace this 0 and complete this conditional
        if (SCREENBLOCK[15].tilemap[OFFSET(col, row, 32)] == 0)
        { // If any spot is blank
            return 0;
        }
    }
    return 1;
}

void clearRow(int row)
{
    // TODO 5.5: Play the rowClearSound when a row is cleared
    playSoundB(rowClearSound_data, rowClearSound_length, 0);

    // TODO 1.1: Complete this for loop.
    // Go up the rows of the board, starting from the passed in row.
    // Replace every tile entry in the row with the entry above it.
    for (int i = row; i > 0; i--)
    {
        for (int j = 0; j < GAMEBOARD_WIDTH + 1; j++)
        {
            // Set each tilemap entry to the one above it
            SCREENBLOCK[15].tilemap[OFFSET(j, i, 32)] = SCREENBLOCK[15].tilemap[OFFSET(j, i - 1, 32)];
        }
    }
}

// TODO 1.2: Complete this function
void addPiecesToBackground()
{
    for (int i = 0; i < 4; i++)
    {
        for (int j = 0; j < 4; j++)
        {
            // Iterate through and add each non-empty spot in the collisionMap to the gameboard
            // This handles colors as well since each tetreminoType has an assigned color and that color is set in the collisionMap
            if (collisionMaps[(currentTetreminoType * 4) + currentTetreminoRotation][4 * j + i] != 0)
            {
                // To get a particular tile index of the current tetremino, use:
                //      collisionMaps[(currentTetreminoType * 4) + currentTetreminoRotation][4 * j + i];
                // where j and i are the row and col within the tetremino, respectively
                // SCREENBLOCK[15].tilemap[OFFSET(tileCol, tileRow, 32)]
                // To get the tile coords of the top left of the current tetremino,
                // use currentTetreminoRow and currentTetreminoCol
                // HINT: Use OFFSET(tileCol, tileRow, 32) to get the right tile index!
                int tileIndex = OFFSET(currentTetreminoCol + i, currentTetreminoRow + j, 32);
                SCREENBLOCK[15].tilemap[tileIndex] = collisionMaps[(currentTetreminoType * 4) + currentTetreminoRotation][4 * j + i];
            }
        }
    }
}

// ******************************************************
// * You don't need to modify anything below this line! *
// ******************************************************

//#region Row Clearing Functions
void checkForRowClear()
{
    for (int i = 0; i < GAMEBOARD_HEIGHT; i++)
    {
        if (checkIfRowIsFilled(i))
        {
            clearRow(i);
            linesCleared++;
            if (linesCleared >= LINES_CLEARED_TO_WIN)
            {
                goToWin();
            }
        }
    }
}
//#endregion

//#region Rotation Functions
void rotatePiecesCCW()
{
    int newRotation = currentTetreminoRotation - 1;
    if (newRotation < 0)
    {
        newRotation = 3;
    }

    // Check if next rotation would be colliding
    if (checkForCollision((currentTetreminoType * 4) + newRotation, currentTetreminoCol, currentTetreminoRow) == 0)
    {
        currentTetreminoRotation = newRotation;
    }
}
void rotatePiecesCW()
{
    int newRotation = (currentTetreminoRotation + 1) % 4;
    if (checkForCollision((currentTetreminoType * 4) + newRotation, currentTetreminoCol, currentTetreminoRow) == 0)
    {
        currentTetreminoRotation = newRotation;
    }
}
//#endregion

//#region Tetremino Handling Functions
int skipFrames = 0;
void updatePieces()
{
    if (skipFrames < SKIPFRAMES_BETWEEN_TETREMINO_MOVEMENT)
    {
        skipFrames++;
        return;
    }
    else
    {
        skipFrames = 0;
    }
    // Should we move the tiles to the background?
    if (checkForCollision((currentTetreminoType * 4) + currentTetreminoRotation, currentTetreminoCol, currentTetreminoRow + 1) == 1)
    {
        if (currentTetreminoRow == 0)
        {
            goToLose();
        }
        addPiecesToBackground();
        spawnTetremino(); // Spawn the next one once the current one is placed
    }
    else
    {
        currentTetreminoRow++;
    }
}

void updatePieceSprites()
{
    int spriteIndex = 0; // The sprite we are currently changing

    // Loop through the collision map, putting a sprite at each place we need one
    for (int i = 0; i < 4; i++)
    {
        for (int j = 0; j < 4; j++)
        {
            if (collisionMaps[(currentTetreminoType * 4) + currentTetreminoRotation][4 * j + i] != 0)
            {
                shadowOAM[spriteIndex].attr0 = (currentTetreminoRow + j) * 8 | ATTR0_SQUARE;
                shadowOAM[spriteIndex].attr1 = (currentTetreminoCol + i) * 8 | ATTR1_TINY;
                shadowOAM[spriteIndex].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(currentTetreminoType + 1, 0); // Type corresponds to color!

                spriteIndex++;
            }
        }
    }
}

int checkForCollision(int collisionMapIndex, int col, int row)
{
    int valueToReturn = 0;

    // Check each collision map index vs each SCREENBLOCK index (in the 4x4 area)
    for (int i = 0; i < 4; i++)
    {
        for (int j = 0; j < 4; j++)
        {
            if (SCREENBLOCK[15].tilemap[OFFSET(col + i, row + j, 32)] != 0 && collisionMaps[collisionMapIndex][4 * j + i] != 0)
            {
                valueToReturn = 1;
            }
        }
    }

    return valueToReturn;
}

void spawnTetremino()
{
    currentTetreminoType = rand() % 7;

    currentTetreminoCol = GAMEBOARD_WIDTH / 2 - 1; // Roughly centered
    currentTetreminoRow = 0;
    currentTetreminoRotation = 0;
}
//#endregion

//#region Start, Update, and Draw
void startGame()
{
    linesCleared = 0;
    if (currentTetreminoRow == 0)
    { // Band-aid fix for pause resetting the tetremino position
        spawnTetremino();
    }
}

void setupGameboard()
{
    // Hi, future Travis here. When I first wrote this code, I decided to abstract the
    // screenblock into an array called gameboard. Don't do this. Just use SCREENBLOCK[x].tilemap,
    // which you can treat as an array and use offset. I leave this code here so you can see an
    // alternative approach, but ultimately I don't see a reason to bother with all of this.

    // We're creating tilemap entries here,
    // refer to lecture slides to see how tilemap entries are setup.
    // (2 << 11) == Use the second subpallete
    u16 grayTile = 8 | (2 << 11);
    u16 solidGray = 9 | (2 << 11);

    // Clear out the gameboard
    for (int i = 0; i < 32; i++)
    {
        for (int j = 0; j < 32; j++)
        {
            gameboard[i][j] = 0;
        }
    }

    // Fill the edges of the board with non-zero so we can check for out of bounds using collision logic (and it looks pretty nice too!)
    for (int i = 0; i <= GAMEBOARD_HEIGHT; i++)
    { // Gameboard Left
        gameboard[i][0] = grayTile;
    }
    for (int i = 0; i <= GAMEBOARD_HEIGHT; i++)
    { // Gameboard Right
        gameboard[i][GAMEBOARD_WIDTH + 1] = grayTile;
    }
    for (int i = 0; i <= 19; i++)
    { // Screen Right
        gameboard[i][29] = grayTile;
    }
    for (int i = 0; i <= 29; i++)
    { // Screen Bottom
        gameboard[GAMEBOARD_HEIGHT][i] = grayTile;
    }
    for (int i = GAMEBOARD_WIDTH + 1; i <= 29; i++)
    { // Screen Top
        gameboard[0][i] = grayTile;
    }
    for (int i = GAMEBOARD_WIDTH + 2; i < 29; i++)
    {
        for (int j = 1; j < 19; j++)
        {
            gameboard[j][i] = solidGray;
        }
    }

    // Copy the gameboard we built into the screenblock for the background
    DMANow(3, &gameboard, &SCREENBLOCK[15], 1024);
}

void updateGame()
{
    if (BUTTON_PRESSED(BUTTON_B))
    {
        rotatePiecesCW();
    }
    if (BUTTON_PRESSED(BUTTON_A))
    {
        rotatePiecesCCW();
    }
    updatePieces();
    checkForRowClear();

    // Moving tetriminos left and right
    if (BUTTON_PRESSED(BUTTON_LEFT))
    {
        if (checkForCollision((currentTetreminoType * 4) + currentTetreminoRotation, currentTetreminoCol - 1, currentTetreminoRow) == 0 && currentTetreminoCol - 1 >= 0)
        {
            currentTetreminoCol--;
        }
    }
    if (BUTTON_PRESSED(BUTTON_RIGHT))
    {
        if (checkForCollision((currentTetreminoType * 4) + currentTetreminoRotation, currentTetreminoCol + 1, currentTetreminoRow) == 0)
        {
            currentTetreminoCol++;
        }
    }
}

void drawGame()
{
    updatePieceSprites();
    int oamIndex = 80;

    // Draw an E to show that it's the example
    for (int i = 0; i < 5; i++)
    {
        shadowOAM[oamIndex].attr0 = (40 + 8 * i) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[oamIndex].attr1 = 160 | ATTR1_TINY;
        shadowOAM[oamIndex].attr2 = ATTR2_TILEID(3, 0);
        oamIndex++;
    }
    for (int i = 0; i < 3; i++)
    {
        shadowOAM[oamIndex].attr0 = 40 | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[oamIndex].attr1 = (160 + 8 * i) | ATTR1_TINY;
        shadowOAM[oamIndex].attr2 = ATTR2_TILEID(3, 0);
        oamIndex++;
    }
    for (int i = 0; i < 3; i++)
    {
        shadowOAM[oamIndex].attr0 = 56 | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[oamIndex].attr1 = (160 + 8 * i) | ATTR1_TINY;
        shadowOAM[oamIndex].attr2 = ATTR2_TILEID(3, 0);
        oamIndex++;
    }
    for (int i = 0; i < 3; i++)
    {
        shadowOAM[oamIndex].attr0 = 72 | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[oamIndex].attr1 = (160 + 8 * i) | ATTR1_TINY;
        shadowOAM[oamIndex].attr2 = ATTR2_TILEID(3, 0);
        oamIndex++;
    }

    DMANow(3, &shadowOAM, OAM, 512);
}
//#endregion