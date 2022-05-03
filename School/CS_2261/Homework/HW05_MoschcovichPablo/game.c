#include <stdlib.h>
#include "mode0.h"
#include "game.h"
#include "spritesheet.h"

int timer;
int jumped;
int cheat;
int won;
int won2;
int lvl;
int fallen;
int jumpCount;
int canTurn;
int lives;
int pts;
int numHammers;
int overBarrel;

OBJ_ATTR shadowOAM[128];
typedef struct
{
    int row;
    int col;
    int rdel;
    int cdel;
    int width;
    int height;
    int aniCounter;
    int aniCounter2;
    int aniState;
    int prevAniState;
    int curFrame;
    int curFrame2;
    int numFrames;
    int active;
    int cheatFrames;
} ANISPRITE;

ANISPRITE mario;
ANISPRITE princess;
ANISPRITE dk;
ANISPRITE hammer[2];
ANISPRITE barrel[4];

#define HAMMERCOUNT 1
#define BARRELCOUNT 4

enum // just for mario
{
    SPRITERIGHT,
    SPRITELEFT,
    SPRITECLIMB,
    SPRITEIDLE
};

// sets start of each level
void initGame()
{
    canTurn = 1;
    cheat = 0;
    won = 0;
    won2 = 0;
    jumpCount = 0;
    jumped = 0;
    fallen = 0;
    numHammers = 0;
    overBarrel = 0;

    mario.width = 32;
    mario.height = 31;
    mario.cdel = 1;
    mario.rdel = 1;
    mario.col = SCREENWIDTH - mario.width;
    mario.row = SCREENHEIGHT - mario.height - 19;
    mario.aniCounter = 0;
    mario.curFrame = 0;
    mario.aniState = 1;
    mario.numFrames = 3;
    mario.cheatFrames = 0;

    princess.width = 24;
    princess.height = 31;
    princess.cdel = 1;
    princess.rdel = 1;
    princess.col = SCREENWIDTH / 2 - (princess.width / 2);
    princess.row = 14;
    princess.aniCounter = 0;
    princess.curFrame = 0;
    princess.aniState = 1;
    princess.numFrames = 2;

    dk.width = 32;
    dk.height = 32;
    dk.cdel = 1;
    dk.rdel = 1;
    dk.col = 24;
    dk.row = 14;
    dk.aniCounter = 0;
    dk.curFrame = 0;
    dk.aniState = 1;
    dk.numFrames = 3;

    for (int i = 0; i < HAMMERCOUNT; i++)
    {
        hammer[i].width = 12;
        hammer[i].height = 15;
        if (lvl == 2)
        {
            hammer[i].row = SCREENHEIGHT - 48;
            hammer[i].col = rand() % 40 + 45;
        }
        else
        {
            hammer[i].row = SCREENHEIGHT - 96;
            hammer[i].col = rand() % 140 + 40;
        }
        hammer[i].aniCounter = 0;
        hammer[i].curFrame = 0;
        hammer[i].numFrames = 2;
        hammer[i].aniState = 0;
        hammer[i].active = 1;
    }

    for (int i = 0; i < BARRELCOUNT; i++)
    {
        barrel[i].width = 9;
        barrel[i].height = 9;
        barrel[i].col = 56;
        barrel[i].active = 0;
        barrel[i].row = 37;
        barrel[i].aniCounter = 0;
        barrel[i].curFrame = 0;
        barrel[i].numFrames = 2;
        barrel[i].aniState = 0;
    }

    timer = 0;
}

// updates every frame
void updateGame()
{
    updateMario();
    updatePrincess();
    updateDK();
    updateHammer();
    updateBarrel();
    timer++;
    if (mario.cheatFrames == 0)
        cheat = 0;
    DMANow(3, shadowOAM, OAM, 512);
}

// update mario components every frame
void updateMario()
{
    if (mario.aniState != SPRITECLIMB && mario.prevAniState != SPRITECLIMB)
        oBcheck();
    if (mario.cheatFrames > 0)
        mario.cheatFrames--;
    if (mario.aniState != SPRITEIDLE)
    {
        mario.prevAniState = mario.aniState;
        mario.aniState = SPRITEIDLE;
    }
    if (mario.aniCounter % 4 == 0)
    {
        if (mario.curFrame < mario.numFrames - 1)
        {
            mario.curFrame++;
        }
        else
        {
            mario.curFrame = 0;
        }
    }

    if (mario.aniCounter2 % 24 < 12)
        mario.curFrame2 = 0;
    else
        mario.curFrame2 = 1;

    if (((BUTTON_HELD(BUTTON_UP) || BUTTON_PRESSED(BUTTON_UP)) && ladderPosUP()) && jumpCount == 0 || ((BUTTON_HELD(BUTTON_DOWN) || BUTTON_PRESSED(BUTTON_DOWN)) && ladderPosDOWN()) && jumpCount == 0)
    {
        mario.aniState = SPRITECLIMB;
        mario.numFrames = 2;
        jumpCount = 0;
        jumped = 0;
        fallen = 0;
    }
    else
        mario.numFrames = 3;

    if (BUTTON_HELD(BUTTON_LEFT) && (mario.col > 0) && canTurn && mario.prevAniState != SPRITECLIMB)
    {
        mario.aniState = SPRITELEFT;
    }
    if (BUTTON_HELD(BUTTON_RIGHT) && (mario.col + mario.width - 1 < SCREENWIDTH) && canTurn && mario.prevAniState != SPRITECLIMB)
    {
        mario.aniState = SPRITERIGHT;
    }
    if ((BUTTON_PRESSED(BUTTON_B) || BUTTON_HELD(BUTTON_B)) && jumped == 0 && fallen == 0 && canTurn)
    {
        jumped = 1;
        jumpCount = 0;
    }

    for (int i = 0; i < BARRELCOUNT; i++)
    {
        if (barrel[i].active && collision(mario.col, mario.row, mario.width - 8, mario.height, barrel[i].col, barrel[i].row, barrel[i].width, barrel[i].height))
        {
            if (!cheat)
            {
                barrel[i].active = 0;
                lives -= 1;
            }
        }
    }

    switch (mario.aniState)
    {
    case SPRITERIGHT:
        rightMario();
        break;
    case SPRITELEFT:
        leftMario();
        break;
    case SPRITECLIMB:
        climbMario();
        break;
    case SPRITEIDLE:
        idleMario();
        break;
    default:
        break;
    }

    if (mario.aniState != SPRITEIDLE)
        mario.aniCounter++;

    mario.aniCounter2++;
}

// shows accurate sprite for still mario
void idleMario()
{
    shadowOAM[0].attr0 = mario.row | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[0].attr1 = mario.col | ATTR1_MEDIUM;
    if (mario.prevAniState == SPRITERIGHT)
    {
        if (jumped)
        {
            shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 12);
            if (mario.aniCounter2 % 4 == 0)
            {
                mario.row -= 2;
                jumpCount++;
                if (jumpCount == 8)
                {
                    jumped = 0;
                    fallen = 1;
                }
            }
        }
        else if (fallen)
        {
            shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 12);
            if (mario.aniCounter2 % 4 == 0)
            {
                mario.row += 2;
                jumpCount--;
                if (jumpCount == 0)
                {
                    fallen = 0;
                }
            }
        }
        else if (cheat)
            shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, mario.curFrame2 * 4 + 16);
        else
            shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 0);
    }
    else if (mario.prevAniState == SPRITELEFT)
    {
        if (jumped)
        {
            shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(4, 12);
            if (mario.aniCounter2 % 4 == 0)
            {
                mario.row -= 2;
                jumpCount++;
                if (jumpCount == 8)
                {
                    jumped = 0;
                    fallen = 1;
                }
            }
        }
        else if (fallen)
        {
            shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(4, 12);
            if (mario.aniCounter2 % 4 == 0)
            {
                mario.row += 2;
                jumpCount--;
                if (jumpCount == 0)
                {
                    fallen = 0;
                }
            }
        }
        else if (cheat)
            shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(4, mario.curFrame2 * 4 + 16);
        else
            shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(4, 0);
    }
    else if (mario.prevAniState == SPRITECLIMB)
    {
        if (!(mario.row == SCREENHEIGHT - mario.height - 19 || mario.row == SCREENHEIGHT - mario.height - 19 - 48 || mario.row == SCREENHEIGHT - mario.height - 19 - 48 - 48))
            canTurn = 0;
        if (jumped)
        {
            shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(4, 12);
            if (mario.aniCounter2 % 4 == 0)
            {
                mario.row -= 2;
                jumpCount++;
                if (jumpCount == 8)
                {
                    jumped = 0;
                    fallen = 1;
                }
            }
        }
        else if (fallen)
        {
            shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(4, 12);
            if (mario.aniCounter2 % 4 == 0)
            {
                mario.row += 2;
                jumpCount--;
                if (jumpCount == 0)
                {
                    fallen = 0;
                }
            }
        }

        if (mario.row == SCREENHEIGHT - mario.height - 19 || mario.row == SCREENHEIGHT - mario.height - 19 - 48 || mario.row == SCREENHEIGHT - mario.height - 19 - 48 - 48)
        {
            canTurn = 1;
            if (mario.col > SCREENHEIGHT / 4)
            {
                mario.prevAniState = SPRITELEFT;
                if (cheat)
                    shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(4, mario.curFrame2 * 4 + 16);
                else
                    shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(4, 0);
            }
            else
            {
                mario.prevAniState = SPRITERIGHT;
                if (cheat)
                    shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, mario.curFrame2 * 4 + 16);
                else
                    shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 0);
            }
        }
    }
    if ((mario.row == SCREENHEIGHT - 70 - 28 && mario.col > 6 && mario.col < 18 || mario.row == SCREENHEIGHT - 70 - 28 - 48 && mario.col > SCREENWIDTH - 18 - mario.width && mario.col < SCREENWIDTH - 6 - mario.width || mario.row == SCREENHEIGHT - 70 - 28 && mario.col > SCREENWIDTH - 18 - 72 - mario.width && mario.col < SCREENWIDTH - 6 - 72 - mario.width) && BUTTON_HELD(BUTTON_DOWN))
    {
        mario.row += 28;
        mario.aniState = SPRITECLIMB;
    }
}

// shows accurate sprite for right mario
void rightMario()
{
    shadowOAM[0].attr0 = mario.row | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[0].attr1 = mario.col | ATTR1_MEDIUM;
    if (jumped)
    {
        shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 12);
        if (mario.aniCounter2 % 4 == 0)
        {
            mario.row -= 2;
            jumpCount++;
            if (jumpCount == 8)
            {
                jumped = 0;
                fallen = 1;
            }
        }
    }
    else if (fallen)
    {
        shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 12);
        if (mario.aniCounter2 % 4 == 0)
        {
            mario.row += 2;
            jumpCount--;
            if (jumpCount == 0)
            {
                fallen = 0;
            }
        }
    }
    else if (cheat)
        shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, mario.curFrame2 * 4 + 16);
    else
        shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, mario.curFrame * 4);
    if (!(lvl == 2 && mario.col >= 14 * 8 - 43 && mario.col < 14 * 8 && mario.row >= SCREENHEIGHT - 12 * 8))
        mario.col += mario.cdel;
}

// shows accurate sprite for left mario
void leftMario()
{
    shadowOAM[0].attr0 = mario.row | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[0].attr1 = mario.col | ATTR1_MEDIUM;
    if (jumped)
    {

        shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(4, 12);
        if (mario.aniCounter2 % 4 == 0)
        {
            mario.row -= 2;
            jumpCount++;
            if (jumpCount == 8)
            {
                jumped = 0;
                fallen = 1;
            }
        }
    }
    else if (fallen)
    {
        shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(4, 12);
        if (mario.aniCounter2 % 4 == 0)
        {
            mario.row += 2;
            jumpCount--;
            if (jumpCount == 0)
            {
                fallen = 0;
            }
        }
    }
    else if (cheat)
        shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(4, mario.curFrame2 * 4 + 16);
    else
        shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(4, mario.curFrame * 4);
    if (!(lvl == 2 && mario.col <= 14 * 8 && mario.col > 14 * 8 - 43 && mario.row >= SCREENHEIGHT - 12 * 8))
        mario.col -= mario.cdel;
}

// shows accurate sprite for climb mario
void climbMario()
{
    if (BUTTON_HELD(BUTTON_UP))
        mario.row -= mario.rdel;
    else
        mario.row += mario.rdel;
    if (mario.row == SCREENHEIGHT - 70 || mario.row == SCREENHEIGHT - 70 - 48)
    {
        mario.row -= 28;
        mario.aniState = SPRITEIDLE;
        mario.prevAniState = SPRITERIGHT;
        canTurn = 1;
    }
    shadowOAM[0].attr0 = mario.row | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[0].attr1 = mario.col | ATTR1_MEDIUM;
    shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(8, mario.curFrame * 4);
}

// update princess components every frame
void updatePrincess()
{
    if (collision(mario.col, mario.row, mario.width, mario.height, princess.col, princess.row, princess.width, princess.height))
    {
        if (lvl == 1)
        {
            lvl++;
            if (pts < 99)
                pts++;
            won = 1;
        }
        else
            won2 = 1;
    }

    if (princess.aniCounter % 24 < 12)
    {
        princess.curFrame = 0;
        princess.row--;
    }
    else
    {
        princess.curFrame = 1;
        princess.row++;
    }

    princess.aniCounter++;

    shadowOAM[1].attr0 = princess.row | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[1].attr1 = princess.col | ATTR1_MEDIUM;
    shadowOAM[1].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(12, princess.curFrame * 4);
}

// update donkey kong components every frame
void updateDK()
{
    if (dk.aniCounter % 72 == 0)
    {
        dk.curFrame = (dk.curFrame + 1) % dk.numFrames;
        if (dk.curFrame == 2)
        {
            for (int i = 0; i < BARRELCOUNT; i++)
            {
                if (barrel[i].active == 0)
                {
                    barrel[i].active = 1;
                    barrel[i].col = 56;
                    barrel[i].row = 37;
                    break;
                }
            }
        }
    }

    dk.aniCounter++;

    shadowOAM[2].attr0 = dk.row | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[2].attr1 = dk.col | ATTR1_MEDIUM;
    shadowOAM[2].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(16, dk.curFrame * 4);
}

// update hammer components every frame
void updateHammer()
{
    for (int i = 0; i < HAMMERCOUNT; i++)
    {
        hammer[i].aniCounter++;
        if (hammer[i].aniCounter % 45 == 0)
        {
            if (hammer[i].curFrame < hammer[i].numFrames - 1)
            {
                hammer[i].curFrame++;
            }
            else
            {
                hammer[i].curFrame = 0;
            }
        }

        if (collision(mario.col, mario.row, mario.width, mario.height, hammer[i].col, hammer[i].row, hammer[i].width, hammer[i].height))
        {
            if (hammer[i].active)
            {
                cheat = 1;
                if (lvl == 1 && numHammers < 1)
                {
                    hammer[i].row = SCREENHEIGHT - 48;
                    hammer[i].col = rand() % 120 + 50;
                    numHammers++;
                    mario.cheatFrames = 400;
                }
                else if (lvl == 2 && numHammers < 1)
                {
                    hammer[i].row = SCREENHEIGHT - 96;
                    hammer[i].col = rand() % 140 + 60;
                    numHammers++;
                    mario.cheatFrames = 400;
                }
                else
                {
                    hammer[i].active = 0;
                    mario.cheatFrames = 400;
                }
            }
        }
    }
    for (int i = 0; i < HAMMERCOUNT; i++)
    {
        if (hammer[i].active == 1)
        {
            shadowOAM[3 + i].attr0 = hammer[i].row | ATTR0_4BPP | ATTR0_SQUARE;
            shadowOAM[3 + i].attr1 = hammer[i].col | ATTR1_MEDIUM;
            shadowOAM[3 + i].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(24, 4 * hammer[i].curFrame);
        }
        else
        {
            shadowOAM[3 + i].attr0 = ATTR0_HIDE;
        }
    }
}

// update barrel components every frame
void updateBarrel()
{

    for (int i = 0; i < BARRELCOUNT; i++)
    {
        if (barrel[i].active)
        {
            barrel[i].aniCounter++;
            if (barrel[i].aniCounter % 20 == 0)
            {
                if (barrel[i].curFrame < barrel[i].numFrames - 1)
                {
                    barrel[i].curFrame++;
                }
                else
                {
                    barrel[i].curFrame = 0;
                }
            }

            if (barrel[i].row == 37 || barrel[i].row == SCREENHEIGHT - 27)
                barrel[i].col++;
            if (barrel[i].col == SCREENWIDTH - barrel[i].width && barrel[i].row < 100 || barrel[i].col == 0)
                barrel[i].row++;
            if (barrel[i].row == 85)
                barrel[i].col--;
            if (barrel[i].col >= SCREENWIDTH)
                barrel[i].active = 0;

            if (collision(mario.col, mario.row, mario.width, mario.height, barrel[i].col, barrel[i].row, barrel[i].width, barrel[i].height))
            {
                if (cheat)
                {
                    barrel[i].active = 0;
                    if (pts < 99)
                        pts++;
                }
            }
            shadowOAM[5 + i].attr0 = barrel[i].row | ATTR0_4BPP | ATTR0_SQUARE;
            shadowOAM[5 + i].attr1 = barrel[i].col | ATTR1_MEDIUM;
            shadowOAM[5 + i].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(20, barrel[i].curFrame * 4);
        }
        else
        {
            shadowOAM[5 + i].attr0 = ATTR0_HIDE;
        }
    }
}

// ok to go up ladder
int ladderPosUP()
{
    if ((mario.col > 6 && mario.col < 18 && mario.row > SCREENHEIGHT - 70 && mario.row < SCREENHEIGHT - 48) || (mario.col > SCREENWIDTH - 18 - mario.width && mario.col < SCREENWIDTH - 6 - mario.width && mario.row > SCREENHEIGHT - 70 - 48 && mario.row < SCREENHEIGHT - 48 - 48))
        return 1;
    if (lvl == 2 && (mario.col > SCREENWIDTH - 18 - 72 - mario.width && mario.col < SCREENWIDTH - 6 - 72 - mario.width && mario.row > SCREENHEIGHT - 70 && mario.row < SCREENHEIGHT - 48))
        return 1;
    return 0;
}

// ok to go down ladder
int ladderPosDOWN()
{
    if ((mario.col > 6 && mario.col < 18 && mario.row > SCREENHEIGHT - 71 && mario.row < SCREENHEIGHT - 50) || (mario.col > SCREENWIDTH - 18 - mario.width && mario.col < SCREENWIDTH - 6 - mario.width && mario.row > SCREENHEIGHT - 71 - 48 && mario.row < SCREENHEIGHT - 50 - 48))
        return 1;
    if (lvl == 2 && (mario.col > SCREENWIDTH - 18 - 72 - mario.width && mario.col < SCREENWIDTH - 6 - 72 - mario.width && mario.row > SCREENHEIGHT - 71 && mario.row < SCREENHEIGHT - 50))
        return 1;
    return 0;
}

// check if jumped over barrel
void oBcheck()
{
    if (fallen == 0 && jumped == 0)
    {
        overBarrel = 0;
    }
    if (!overBarrel)
    {
        for (int i = 0; i < BARRELCOUNT; i++)
        {
            if ((mario.col <= barrel[i].col + 4 && mario.col >= barrel[i].col - 4) && mario.row < barrel[i].row && barrel[i].row < mario.row + 50)
            {
                if (pts < 99 && barrel[i].active)
                {
                    pts++;
                    overBarrel = 1;
                }
            }
        }
    }
}