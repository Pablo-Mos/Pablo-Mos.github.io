#include <stdlib.h>
#include "mode0.h"
#include "game.h"
#include "spritesheet.h"
#include "collisionMap.h"
// fix why collision map won't work on bottom right and top center
// make collision map work with horizontal collisions?
// make large scrolling background (wait until TA lecture?)
// add pause between losing lives to see if still making contact with enemy, to avoid losing all lives at once
// once more involved with sprites, figure out better collisions, start at top right? trying that makes running animation weird bc body not centered like on HW5
int timer;
int jumped;
int won;
int fallen;
int jumpCount;
int lives;
int pts;
int numGuns;
int hasGun;
int shootUp;
int maxJump = 15;

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
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
    int active;
    int bulletTimer;
    int direction;
} ANISPRITE;

typedef struct
{
    int row;
    int col;
    int rdel;
    int cdel;
    int height;
    int width;
    int active;
    int direction;
    int rowDirection;
} BULLET;

ANISPRITE player;
ANISPRITE enemy;
ANISPRITE gun[2];
#define GUNCOUNT 1
#define BULLETCOUNT 5
BULLET bullets[BULLETCOUNT];

unsigned char *collisionMap = (unsigned char *)collisionMapBitmap;

// just for player
enum
{
    SPRITERIGHT,
    SPRITELEFT,
    SPRITEIDLE
};

// sets start of each level
void initGame()
{
    won = 0;
    timer = 0;
    numGuns = 0;
    hasGun = 0;
    initPlayer();
    initEnemy();
    initBullets();
    initGuns();
}

// initialize guns
void initGuns()
{
    for (int i = 0; i < GUNCOUNT; i++)
    {
        gun[i].width = 12;
        gun[i].height = 15;

        gun[i].row = SCREENHEIGHT - 96;
        gun[i].col = SCREENWIDTH / 2;

        gun[i].aniCounter = 0;
        gun[i].curFrame = 0;
        gun[i].numFrames = 2;
        gun[i].aniState = 0;
        gun[i].active = 1;
    }
}

// initialize player
void initPlayer()
{
    player.width = 32;
    player.height = 32;
    player.cdel = 1;
    player.rdel = 1;
    player.col = SCREENWIDTH - player.width;
    player.row = SCREENHEIGHT - player.height - 16;
    player.aniCounter = 0;
    player.curFrame = 0;
    player.aniState = 1;
    player.numFrames = 3;
    player.bulletTimer = 20;

    jumpCount = 0;
    jumped = 0;
    fallen = 0;
    shootUp = 0;
}

// initialize enemy
void initEnemy()
{
    enemy.width = 32;
    enemy.height = 32;
    enemy.cdel = 1;
    enemy.rdel = 1;
    enemy.col = 103;
    enemy.row = 8;
    enemy.aniCounter = 0;
    enemy.curFrame = 0;
    enemy.aniState = 1;
    enemy.numFrames = 3;
    enemy.active = 1;
}

// initializes the pool of bullets
void initBullets()
{
    for (int i = 0; i < BULLETCOUNT; i++)
    {
        bullets[i].height = 5;
        bullets[i].width = 13;
        bullets[i].row = -bullets[i].height;
        bullets[i].col = 0;
        bullets[i].rdel = 3;
        bullets[i].cdel = 3;
        bullets[i].active = 0;
        bullets[i].rowDirection = 0;
    }
}

// updates every frame
void updateGame()
{
    updatePlayer();
    updateEnemy();
    // Updates all the bullets
    for (int i = 0; i < BULLETCOUNT; i++)
        updateBullet(&bullets[i]);
    // Draws all the bullets
    drawBullets();
    updateGun();
    timer++;
    DMANow(3, shadowOAM, OAM, 512);
}

// updates guns every frame
void updateGun()
{
    for (int i = 0; i < GUNCOUNT; i++)
    {
        gun[i].aniCounter++;
        if (gun[i].aniCounter % 45 == 0)
        {
            if (gun[i].curFrame < gun[i].numFrames - 1)
            {
                gun[i].curFrame++;
            }
            else
            {
                gun[i].curFrame = 0;
            }
        }

        if (collision(player.col, player.row, player.width, player.height, gun[i].col, gun[i].row, gun[i].width, gun[i].height))
        {
            if (gun[i].active)
            {
                hasGun = 1;
                // if (numGuns < 1)
                // {
                //     gun[i].row = SCREENHEIGHT - 48;
                //     gun[i].col = rand() % 120 + 50;
                //     numGuns++;
                // }
                // else
                // {
                //     gun[i].active = 0;
                // }
                gun[i].active = 0;
                // do commented block above instead of this line if want to respawn gun
            }
        }
    }
    for (int i = 0; i < GUNCOUNT; i++)
    {
        if (gun[i].active == 1)
        {
            shadowOAM[3 + i].attr0 = gun[i].row | ATTR0_4BPP | ATTR0_SQUARE;
            shadowOAM[3 + i].attr1 = gun[i].col | ATTR1_MEDIUM;
            shadowOAM[3 + i].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(24, 4 * gun[i].curFrame);
        }
        else
        {
            shadowOAM[3 + i].attr0 = ATTR0_HIDE;
        }
    }
}

// updates enemy every frame
void updateEnemy()
{
    if (enemy.aniCounter % 72 == 0)
    {
        enemy.curFrame = (enemy.curFrame + 1) % enemy.numFrames;
    }

    enemy.aniCounter++;
    if (enemy.active)
    {
        shadowOAM[2].attr0 = enemy.row | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[2].attr1 = enemy.col | ATTR1_MEDIUM;
        shadowOAM[2].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(16, enemy.curFrame * 4);

        if (collision(player.row, player.col, player.height, player.width, enemy.row, enemy.col, enemy.height, enemy.width))
        {
            lives--;
        }
    }
    else
        shadowOAM[2].attr0 = ATTR0_HIDE;
}

// updates bullet every frame
void updateBullet(BULLET *b)
{

    // If active, update; otherwise ignore
    if (b->active)
    {

        if (BUTTON_HELD(BUTTON_UP))
        {
            b->rowDirection = -1;
        }
        else
        {
            b->rowDirection = 0;
        }

        if (b->direction == 1)
        {
            if (b->col + b->cdel <= SCREENWIDTH - 1)
            {
                b->col += b->cdel;
            }
            else
            {
                b->active = 0;
            }
        }
        else if (b->direction == -1)
        {
            if (b->col + b->width - b->cdel >= 0)
            {
                b->col -= b->cdel;
            }
            else
            {
                b->active = 0;
            }
        }
        else
        {
            if (b->row + b->height - b->rdel >= 0)
            {
                b->row -= b->rdel;
            }
            else
            {
                b->active = 0;
            }
        }

        if (b->direction != 0 && b->rowDirection == -1)
        {
            b->row += player.rdel;
        }
        // kill enemy
        if (enemy.active && collision(enemy.row, enemy.col, enemy.height, enemy.width,
                                      b->row, b->col, b->height, b->width))
        {
            enemy.active = 0;
            b->active = 0;
            pts++;
        }
    }
}

// update player components every frame
void updatePlayer()
{
    // Fire bullets check
    if (hasGun && BUTTON_PRESSED(BUTTON_A) && player.bulletTimer >= 10)
    {
        fireBullet();
        player.bulletTimer = 0;
    }
    player.bulletTimer++;

    // frame / animation state update
    if (player.aniState != SPRITEIDLE)
    {
        player.prevAniState = player.aniState;
        player.aniState = SPRITEIDLE;
    }
    if (player.aniCounter % 4 == 0)
    {
        if (player.curFrame < player.numFrames - 1)
        {
            player.curFrame++;
        }
        else
        {
            player.curFrame = 0;
        }
    }

    // player movement
    if (BUTTON_HELD(BUTTON_LEFT) && (player.col > 0) && collisionCheck(collisionMap, SCREENWIDTH, player.col, player.row, player.width, player.height, -player.cdel, 0))
    {
        player.aniState = SPRITELEFT;
        player.col -= player.cdel;
    }
    else if (BUTTON_HELD(BUTTON_RIGHT) && (player.col + player.width - 1 < SCREENWIDTH) && collisionCheck(collisionMap, SCREENWIDTH, player.col, player.row, player.width, player.height, player.cdel, 0))
    {
        player.aniState = SPRITERIGHT;
        player.col += player.cdel;
    }
    if ((BUTTON_PRESSED(BUTTON_B) || BUTTON_HELD(BUTTON_B)) && jumped == 0 && fallen == 0)
    {
        jumped = 1;
        jumpCount = 0;
        player.rdel = -1;
    }

    // for specific shooting up case
    if (BUTTON_HELD(BUTTON_UP))
        shootUp = 1;
    else
        shootUp = 0;

    // draws correct player (including jumping)
    drawPlayer();

    // update animation counter
    if (player.aniState != SPRITEIDLE)
        player.aniCounter++;

    // checks if feet on floor
    if (!jumped && collisionMap[OFFSET(player.col, player.row + player.height, SCREENWIDTH)] != 0 && collisionMap[OFFSET(player.col + (player.width / 2), player.row + player.height, SCREENWIDTH)] != 0 && collisionMap[OFFSET(player.col + player.width - 1, player.row + player.height, SCREENWIDTH)] != 0)
        player.row++;
}

// Fires a bullet
void fireBullet()
{
    // Finds the first inactive bullet
    for (int i = 0; i < BULLETCOUNT; i++)
    {
        if (!bullets[i].active)
        {

            // Positions the new bullet
            if (shootUp)
            {
                bullets[i].row = player.row - bullets[i].width;
                bullets[i].col = player.col;
                bullets[i].direction = 0;

                bullets[i].height = 13;
                bullets[i].width = 5;
            }
            else if (player.aniState == SPRITELEFT || player.aniState == SPRITEIDLE && player.prevAniState == SPRITELEFT)
            {
                bullets[i].row = player.row + player.height / 2 - 3;
                bullets[i].col = player.col - bullets[i].width / 2;
                bullets[i].direction = -1;

                bullets[i].height = 5;
                bullets[i].width = 13;
            }
            else // SPRITERIGHT
            {
                bullets[i].row = player.row + player.height / 2 - 3;
                bullets[i].col = player.col + player.width - bullets[i].width / 2;
                bullets[i].direction = 1;

                bullets[i].height = 5;
                bullets[i].width = 13;
            }

            // Takes the bullet out of the pool
            bullets[i].active = 1;

            // Break out of the loop
            break;
        }
    }
}

// Draws the bullets
void drawBullets()
{
    for (int i = 0; i < BULLETCOUNT; i++)
    {
        if (bullets[i].active)
        {
            if (bullets[i].direction != 0)
            {
                shadowOAM[i + 19].attr0 = (ROWMASK & bullets[i].row) | ATTR0_4BPP | ATTR0_WIDE;
                shadowOAM[i + 19].attr1 = (COLMASK & bullets[i].col) | ATTR1_TINY;
                shadowOAM[i + 19].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(20, 0);
            }
            else
            {
                shadowOAM[i + 19].attr0 = (ROWMASK & bullets[i].row) | ATTR0_4BPP | ATTR0_TALL;
                shadowOAM[i + 19].attr1 = (COLMASK & bullets[i].col) | ATTR1_TINY;
                shadowOAM[i + 19].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(22, 0);
            }
        }
        else
        {
            shadowOAM[i + 19].attr0 = ATTR0_HIDE;
        }
    }
}

void drawPlayer()
{
    shadowOAM[0].attr0 = player.row | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[0].attr1 = player.col | ATTR1_MEDIUM;
    if (jumped)
    {
        if (player.prevAniState == SPRITERIGHT || player.aniState == SPRITERIGHT)
            shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 12);
        else if (player.prevAniState == SPRITELEFT || player.aniState == SPRITELEFT)
            shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(4, 12);
        if (timer % 2 == 0)
        {
            player.row -= 2;
            jumpCount++;

            if (jumpCount == maxJump || (collisionMap[OFFSET(player.col, player.row - 1, SCREENWIDTH)] == 0 || collisionMap[OFFSET(player.col + (player.width / 2), player.row - 1, SCREENWIDTH)] == 0 || collisionMap[OFFSET(player.col + player.width - 1, player.row - 1, SCREENWIDTH)] == 0))
            {
                jumped = 0;
                fallen = 1;
            }
        }
    }
    else if (collisionCheck(collisionMap, SCREENWIDTH, player.col, player.row + 2, player.width, player.height, 0, player.rdel))
        player.row++;
    else if (fallen)
    {
        if (player.prevAniState == SPRITERIGHT || player.aniState == SPRITERIGHT)
            shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 12);
        else if (player.prevAniState == SPRITELEFT || player.aniState == SPRITELEFT)
            shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(4, 12);

        if (timer % 2 == 0)
        {
            jumpCount--;
            if (jumpCount == 0)
            {
                fallen = 0;
            }
        }
    }
    else if (player.prevAniState == SPRITERIGHT && player.aniState != SPRITERIGHT)
        shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 0);
    else if (player.prevAniState == SPRITELEFT && player.aniState != SPRITELEFT)
        shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(4, 0);
    else if (player.aniState == SPRITERIGHT)
        shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, player.curFrame * 4);
    else
        shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(4, player.curFrame * 4);
}