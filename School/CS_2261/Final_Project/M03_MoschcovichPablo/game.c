#include <stdlib.h>
#include "mode0.h"
#include "game.h"
#include "spritesheet.h"
#include "collisionMap.h"
//      make sure bullets and pts dont exceed two digits (reset to max if go over)
//      cleanup some shadooam locations
//      slow down normal enemy shooting so can still see pause between life-loss if player stays on enemy
//      for UI, once sprites are made, reserve space that can show all weapons in corner... if don't have weapon, don't show anything there, if have weapon, but not used, leave faded out (needed for M4), if being used, show in full color/opacity
//      add more ways to gain lives? (if not at 3, max)
//     game over (lives=0;) if height = bottom (dead) (fix bc tried but won't fall below (need to make map smaller?))
//     once more involved with sprites, use enemy.direction to choose frames to cycles through for animation + figure out better collisions (and falling off platforms at right time), start at top right? trying that makes running animation weird bc body not centered like on HW5
//     for tile stuff,have walls that must be shot down/hit with sword couple of times to get past

OBJ_ATTR shadowOAM[128];

int timer;
int jumped;
int won;
int fallen;
int jumpCount;
int lives;
int pts;
int hasGun;
int hasKnife;
int hasShield;
int shootUp;
int collTimer;
int hOff;
int vOff;
int maxJump;
int ovrEnemyColl;
int stabbing;
int stabbingFrames;
int successfulStab;
int shielding;
int shieldingFrames;
int currWeapon;
int numWeapons;
int numBullets;

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
    vOff = 0;
    hOff = 0;
    won = 0;
    timer = 0;
    hasGun = 0;
    hasKnife = 0;
    hasShield = 0;
    shielding = 0;
    shieldingFrames = 0;
    collTimer = 0;
    ovrEnemyColl = 0;
    stabbing = 0;
    stabbingFrames = 0;
    maxJump = 15;
    successfulStab = 0;
    numWeapons = 0;
    currWeapon = 0;
    numBullets = 0;
    initPlayer();
    initEnemy();
    initBullets();
    initBulletsEnemy();
    initWeapons();
    initCoins();
    initAmmo();
}

// initialize weapons
void initWeapons()
{
    for (int i = 0; i < WEAPONCOUNT; i++)
    {
        if (i == 0)
            weapon[i].type = GUN;
        else if (i == 1)
            weapon[i].type = KNIFE;
        else
            weapon[i].type = SHIELD;

        switch (weapon[i].type)
        {
        case GUN:
            weapon[i].width = 12;
            weapon[i].height = 15;
            weapon[i].worldRow = 10;
            weapon[i].worldCol = 330;
            weapon[i].aniCounter = 0;
            weapon[i].curFrame = 0;
            weapon[i].numFrames = 2;
            weapon[i].aniState = 0;
            weapon[i].active = 1;
            break;
        case KNIFE:
            weapon[i].width = 9;
            weapon[i].height = 19;
            weapon[i].worldRow = 60;
            weapon[i].worldCol = 65;
            weapon[i].aniCounter = 0;
            weapon[i].curFrame = 0;
            weapon[i].numFrames = 2;
            weapon[i].aniState = 0;
            weapon[i].active = 1;
            break;
        case SHIELD:
            weapon[i].width = 5;
            weapon[i].height = 20;
            weapon[i].worldRow = 100;
            weapon[i].worldCol = 170;
            weapon[i].aniCounter = 0;
            weapon[i].curFrame = 0;
            weapon[i].numFrames = 2;
            weapon[i].aniState = 0;
            weapon[i].active = 1;
            break;
        }
    }
}

// initialize player
void initPlayer()
{
    player.width = 32;
    player.height = 32;
    player.cdel = 1;
    player.rdel = 1;
    player.aniCounter = 0;
    player.curFrame = 0;
    player.aniState = 1;
    player.numFrames = 3;
    player.bulletTimer = 20;
    player.shot = 0;

    player.worldRow = SCREENHEIGHT / 2 - player.width / 2 + vOff;
    player.worldCol = SCREENWIDTH / 2 - player.height / 2 + hOff;

    jumpCount = 0;
    jumped = 0;
    fallen = 0;
    shootUp = 0;
}

// initialize enemy
void initEnemy()
{
    for (int i = 0; i < ENEMYCOUNT; i++)
    {
        if (i == 0) // just one boss
            enemy[i].type = BOSS;
        else
            enemy[i].type = NORMAL;

        switch (enemy[i].type)
        {
        case NORMAL:
            enemy[i].width = 32;
            enemy[i].height = 32;
            enemy[i].cdel = 1;
            enemy[i].rdel = 1;
            if (i % 2 == 0)
            {
                enemy[i].worldCol = 85;
                enemy[i].worldRow = 8;
            }
            else
            {
                enemy[i].worldCol = MAPWIDTH - 60;
                enemy[i].worldRow = MAPHEIGHT - 37;
            }

            enemy[i].aniCounter = 0;
            enemy[i].curFrame = 0;
            enemy[i].aniState = 1;
            enemy[i].numFrames = 3;
            enemy[i].active = 1;
            enemy[i].health = 2;
            enemy[i].x = 0;
            enemy[i].xLimit = 20;
            break;
        case BOSS:
            enemy[i].width = 32;
            enemy[i].height = 32;
            enemy[i].cdel = 1;
            enemy[i].rdel = 1;
            enemy[i].worldCol = 1;
            enemy[i].worldRow = 133 + enemy[i].height;
            enemy[i].aniCounter = 0;
            enemy[i].curFrame = 0;
            enemy[i].aniState = 1;
            enemy[i].numFrames = 3;
            enemy[i].active = 1;
            enemy[i].health = 4;
            enemy[i].x = 0;
            enemy[i].xLimit = 4;
            break;
        }
    }
}

// initialize coins
void initCoins()
{
    for (int i = 0; i < COINCOUNT; i++)
    {
        if (i == 0) // just one special
            coin[i].type = SPECIAL;
        else
            coin[i].type = NORMAL;

        switch (coin[i].type)
        {
        case NORMAL:
            coin[i].width = 16;
            coin[i].height = 14;
            if (i % 2 == 0)
            {
                coin[i].worldCol = 85 + 80;
                coin[i].worldRow = 15;
            }
            else
            {
                coin[i].worldCol = MAPWIDTH - 90;
                coin[i].worldRow = 10;
            }
            coin[i].active = 1;
            break;
        case SPECIAL:
            coin[i].width = 7;
            coin[i].height = 7;
            coin[i].worldCol = MAPWIDTH - 60 - 60;
            coin[i].worldRow = MAPHEIGHT - 32;
            coin[i].active = 1;
            break;
        }
    }
}

// initialize ammo
void initAmmo()
{
    for (int i = 0; i < AMMOCOUNT; i++)
    {
        ammo[i].width = 5;
        ammo[i].height = 6;
        ammo[i].active = 1;

        if (i == 0)
        {
            ammo[i].worldCol = 35;
            ammo[i].worldRow = 30;
        }
        else if (i == 1)
        {
            ammo[i].worldCol = 220;
            ammo[i].worldRow = 220;
        }
        else if (i == 2)
        {
            ammo[i].worldCol = 50;
            ammo[i].worldRow = 220;
        }
        else if (i == 3)
        {
            ammo[i].worldCol = 500;
            ammo[i].worldRow = 130;
        }
        else if (i == 4)
        {
            ammo[i].worldCol = 290;
            ammo[i].worldRow = 70;
        }
    }
}

// initializes the pool of bullets
void initBullets()
{
    for (int i = 0; i < BULLETCOUNT; i++)
    {
        bullets[i].height = 5;
        bullets[i].width = 13;
        bullets[i].worldRow = -bullets[i].height;
        bullets[i].worldCol = 0;
        bullets[i].rdel = 3;
        bullets[i].cdel = 3;
        bullets[i].active = 0;
        bullets[i].rowDirection = 0;
    }
}

void initBulletsEnemy()
{
    for (int i = 0; i < ENEMYBULLETCOUNT; i++)
    {
        enemyBullets[i].height = 5;
        enemyBullets[i].width = 13;
        enemyBullets[i].worldRow = -enemyBullets[i].height;
        enemyBullets[i].worldCol = 0;
        enemyBullets[i].cdel = 1;
        enemyBullets[i].active = 0;
    }
}

// updates every frame
void updateGame()
{
    updateCamera();
    updatePlayer();
    updateEnemy();
    updateCoins();
    updateAmmo();
    // Updates all the bullets
    for (int i = 0; i < BULLETCOUNT; i++)
    {
        updateBullet(&bullets[i]);
    }

    for (int i = 0; i < ENEMYBULLETCOUNT; i++)
    {
        updateBulletEnemy(&enemyBullets[i]);
    }

    // Draws all the bullets
    drawBullets();
    drawBulletsEnemy();
    updateWeapon();
    timer++;
    DMANow(3, shadowOAM, OAM, 512);
}

// updates weapons every frame
void updateWeapon()
{
    for (int i = 0; i < WEAPONCOUNT; i++)
    {
        if (collision(player.worldCol, player.worldRow, player.width, player.height, weapon[i].worldCol, weapon[i].worldRow, weapon[i].width, weapon[i].height))
        {
            if (weapon[i].active)
            {
                weapon[i].active = 0;
                numWeapons++;
                if (numWeapons == 1)
                    currWeapon = weapon[i].type;

                if (weapon[i].type == GUN)
                {
                    hasGun = 1;
                    // hasKnife = 0;
                    // hasShield = 0;
                }
                else if (weapon[i].type == KNIFE)
                {
                    // hasGun = 0;
                    hasKnife = 1;
                    // hasShield = 0;
                }
                else if (weapon[i].type == SHIELD)
                {
                    // hasGun = 0;
                    // hasKnife = 0;
                    hasShield = 1;
                }
            }
        }
    }
    for (int i = 0; i < WEAPONCOUNT; i++)
    {
        if (weapon[i].active == 1)
        {
            shadowOAM[i + 10].attr0 = (ROWMASK & weapon[i].worldRow - vOff) | ATTR0_4BPP | ATTR0_SQUARE;
            shadowOAM[i + 10].attr1 = (COLMASK & weapon[i].worldCol - hOff) | ATTR1_MEDIUM;
            if (weapon[i].type == GUN)
                shadowOAM[i + 10].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(8, 0);
            else if (weapon[i].type == KNIFE)
                shadowOAM[i + 10].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(8, 4);
            else if (weapon[i].type == SHIELD)
                shadowOAM[i + 10].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(8, 8);
        }
        else
        {
            shadowOAM[i + 10].attr0 = ATTR0_HIDE;
        }
    }
}

// updates enemy every frame
void updateEnemy()
{
    ovrEnemyColl = 0;
    for (int i = 0; i < ENEMYCOUNT; i++)
    {
        // check if stabbing
        if (!successfulStab && enemy[i].active && stabbing && (collision(enemy[i].worldRow, enemy[i].worldCol, enemy[i].height, enemy[i].width, player.worldRow, player.worldCol + 5, player.height, player.width) || collision(enemy[i].worldRow, enemy[i].worldCol, enemy[i].height, enemy[i].width, player.worldRow, player.worldCol - 5, player.height, player.width)))
        {
            enemy[i].health--;
            successfulStab = 1;
            // stabbingFrames++;
            // if (stabbingFrames % 45 == 0)
            // {
            //     enemy[i].health--;
            //     // stabbing = 0;
            // }
        }

        // check if killed
        if (enemy[i].active && enemy[i].health <= 0)
        {
            enemy[i].active = 0;
            pts++;
        }

        // update enemy direction
        if (enemy[i].x <= 0)
        {
            enemy[i].direction = 1;
            // shoot at turn
            if (timer % 20 == 0 && enemy[i].type != BOSS)
                fireBulletEnemy(enemy[i]);
            else if (enemy[i].type == BOSS && timer % 100 == 0)
                fireBulletEnemy(enemy[i]);
        }
        else if (enemy[i].x >= enemy[i].xLimit)
        {
            enemy[i].direction = -1;
            // shoot at turn
            if (timer % 20 == 0 && enemy[i].type != BOSS)
                fireBulletEnemy(enemy[i]);
            else if (enemy[i].type == BOSS && timer % 100 == 0)
                fireBulletEnemy(enemy[i]);
        }

        // move enemy
        if (timer % 5 == 0) // speed of movement
        {
            if (enemy[i].direction == 1)
            {
                enemy[i].worldCol++;
                enemy[i].x++;
            }
            else
            {
                enemy[i].worldCol--;
                enemy[i].x--;
            }
        }

        if (enemy[i].aniCounter % 72 == 0)
        {
            enemy[i].curFrame = (enemy[i].curFrame + 1) % enemy[i].numFrames;
        }

        enemy[i].aniCounter++;
        if (enemy[i].active)
        {
            shadowOAM[i + WEAPONCOUNT + 10].attr0 = (ROWMASK & enemy[i].worldRow - vOff) | ATTR0_4BPP | ATTR0_SQUARE;
            shadowOAM[i + WEAPONCOUNT + 10].attr1 = (COLMASK & enemy[i].worldCol - hOff) | ATTR1_MEDIUM;
            if (enemy[i].type == NORMAL)
                shadowOAM[i + WEAPONCOUNT + 10].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(16, enemy[i].curFrame * 4);
            else if (enemy[i].type == BOSS)
                shadowOAM[i + WEAPONCOUNT + 10].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(16, enemy[i].curFrame * 4 + 12);

            if (collision(player.worldRow, player.worldCol, player.height, player.width, enemy[i].worldRow, enemy[i].worldCol, enemy[i].height, enemy[i].width))
            {
                ovrEnemyColl = 1;
                if (lives == 3)
                {
                    lives--;
                }
                else if (lives == 2 && collTimer % 100 == 0)
                {
                    lives--;
                }
                else if (lives == 1 && collTimer % 100 == 0)
                {
                    lives--;
                }
                collTimer++;
            }
        }
        else
            shadowOAM[i + WEAPONCOUNT + 10].attr0 = ATTR0_HIDE;
    }
}

// updates coins every frame
void updateCoins()
{
    for (int i = 0; i < COINCOUNT; i++)
    {
        if (coin[i].active)
        {
            shadowOAM[i + WEAPONCOUNT + ENEMYCOUNT + 10].attr0 = (ROWMASK & coin[i].worldRow - vOff) | ATTR0_4BPP | ATTR0_SQUARE;
            if (coin[i].type == NORMAL)
            {
                shadowOAM[i + WEAPONCOUNT + ENEMYCOUNT + 10].attr1 = (COLMASK & coin[i].worldCol - hOff) | ATTR1_SMALL;
                shadowOAM[i + WEAPONCOUNT + ENEMYCOUNT + 10].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(24, 0);
            }
            else if (coin[i].type == SPECIAL)
            {
                shadowOAM[i + WEAPONCOUNT + ENEMYCOUNT + 10].attr1 = (COLMASK & coin[i].worldCol - hOff) | ATTR1_TINY;
                shadowOAM[i + WEAPONCOUNT + ENEMYCOUNT + 10].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(23, 0);
            }

            if (collision(player.worldRow, player.worldCol, player.height, player.width, coin[i].worldRow, coin[i].worldCol, coin[i].height, coin[i].width))
            {
                coin[i].active = 0;
                if (coin[i].type == NORMAL)
                    pts++;
                else if (coin[i].type == SPECIAL)
                {
                    if (lives < 3)
                        lives++;
                    pts += 5;
                }
            }
        }
        else
            shadowOAM[i + WEAPONCOUNT + ENEMYCOUNT + 10].attr0 = ATTR0_HIDE;
    }
}

// updates ammo every frame
void updateAmmo()
{
    for (int i = 0; i < AMMOCOUNT; i++)
    {
        if (ammo[i].active)
        {
            shadowOAM[i + WEAPONCOUNT + ENEMYCOUNT + COINCOUNT + 10].attr0 = (ROWMASK & ammo[i].worldRow - vOff) | ATTR0_4BPP | ATTR0_SQUARE;
            shadowOAM[i + WEAPONCOUNT + ENEMYCOUNT + COINCOUNT + 10].attr1 = (COLMASK & ammo[i].worldCol - hOff) | ATTR1_TINY;
            shadowOAM[i + WEAPONCOUNT + ENEMYCOUNT + COINCOUNT + 10].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(30, 0);

            // max bullets = 99
            if (numBullets < 95 && collision(player.worldRow, player.worldCol, player.height, player.width, ammo[i].worldRow, ammo[i].worldCol, ammo[i].height, ammo[i].width))
            {
                ammo[i].active = 0;
                numBullets += 5;
            }
        }
        else
            shadowOAM[i + WEAPONCOUNT + ENEMYCOUNT + COINCOUNT + 10].attr0 = ATTR0_HIDE;
    }
}

// updates bullet every frame
void updateBullet(ANISPRITE *b)
{

    // If active, update; otherwise ignore
    if (b->active)
    {

        if (BUTTON_HELD(BUTTON_UP))
        {
            b->rowDirection = -1;
        }
        else if (BUTTON_HELD(BUTTON_DOWN))
        {
            b->rowDirection = 1;
        }
        else
        {
            b->rowDirection = 0;
        }

        if (b->direction == 1)
        {
            if (b->worldCol + b->cdel <= MAPWIDTH - 1)
            {
                b->worldCol += b->cdel;
            }
            else
            {
                b->active = 0;
            }
        }
        else if (b->direction == -1)
        {
            if (b->worldCol + b->width - b->cdel >= 0)
            {
                b->worldCol -= b->cdel;
            }
            else
            {
                b->active = 0;
            }
        }
        else
        {
            if (b->worldRow + b->height - b->rdel >= 0)
            {
                b->worldRow -= b->rdel;
            }
            else
            {
                b->active = 0;
            }
        }

        if (b->direction != 0)
        {
            b->worldRow += b->rowDirection;
        }

        // shoot enemy
        for (int i = 0; i < ENEMYCOUNT; i++)
        {
            if (enemy[i].active && collision(enemy[i].worldRow, enemy[i].worldCol, enemy[i].height, enemy[i].width,
                                             b->worldRow, b->worldCol, b->height, b->width))
            {
                b->active = 0;
                enemy[i].health--;
            }
        }
    }
}

void updateBulletEnemy(ANISPRITE *b)
{
    // enemy bullets
    if (b->active)
    {
        if (b->direction == 1)
        {
            if (b->worldCol + b->cdel <= SCREENWIDTH + hOff - 1)
            {
                b->worldCol += b->cdel;
            }
            else
            {
                b->active = 0;
            }
        }
        else if (b->direction == -1)
        {
            if (b->worldCol + b->width - b->cdel >= hOff)
            {
                b->worldCol -= b->cdel;
            }
            else
            {
                b->active = 0;
            }
        }

        // kill player / check if blocked

        if (collision(player.worldRow, player.worldCol, player.height, player.width,
                      b->worldRow, b->worldCol, b->height, b->width))
        {
            b->active = 0;
            if (!shielding)
                lives--;
        }
    }
}

// update player components every frame
void updatePlayer()
{
    // check if switching weapons
    if (BUTTON_PRESSED(BUTTON_SELECT) && numWeapons > 1)
    {
        switchWeapons();
    }
    if (!ovrEnemyColl) // no contact with enemy
    {
        collTimer = 100;
    }
    // stop stabbing/shooting animation
    if (timer % 45 == 0)
    {
        stabbing = 0;
        successfulStab = 0;
        player.shot = 0;
    }

    // check if player is under map
    // if (player.worldRow >= MAPHEIGHT)
    // {
    //     lives = 0;
    // }

    //  Fire bullets check
    if (currWeapon == GUN && BUTTON_PRESSED(BUTTON_A) && player.bulletTimer >= 10 && numBullets > 0)
    {
        fireBullet();
        player.bulletTimer = 0;
    }
    player.bulletTimer++;

    // check if stabs
    if (currWeapon == KNIFE && BUTTON_PRESSED(BUTTON_A))
    {
        stabbing = 1;
    }

    // check if showing shield
    if (currWeapon == SHIELD && (BUTTON_PRESSED(BUTTON_A) || BUTTON_HELD(BUTTON_A)))
    {
        shielding = 1;
    }
    else
        shielding = 0;

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
    if (BUTTON_HELD(BUTTON_LEFT) && (player.worldCol > 0) && collisionCheck(collisionMap, MAPWIDTH, player.worldCol, player.worldRow, player.width, player.height, -player.cdel, 0))
    {
        player.aniState = SPRITELEFT;
        // player.worldCol -= player.cdel;

        player.worldCol -= player.cdel;
        if (hOff > 0 && player.worldCol - hOff <= SCREENWIDTH / 2)
        {
            hOff--;
        }
    }
    else if (BUTTON_HELD(BUTTON_RIGHT) && (player.worldCol + player.width - 1 < MAPWIDTH) && collisionCheck(collisionMap, MAPWIDTH, player.worldCol, player.worldRow, player.width, player.height, player.cdel, 0))
    {
        player.aniState = SPRITERIGHT;
        // player.worldCol += player.cdel;

        player.worldCol += player.cdel;
        if (hOff + SCREENWIDTH < MAPWIDTH && player.worldCol - hOff >= SCREENWIDTH / 2)
        {
            hOff++;
        }
    }
    if ((BUTTON_PRESSED(BUTTON_B) || BUTTON_HELD(BUTTON_B)) && jumped == 0 && fallen == 0)
    {
        jumped = 1;
        jumpCount = 0;
        player.rdel = -1;

        // player.worldRow -= player.rdel;
        // if (vOff > 0 && player.worldRow - vOff < SCREENHEIGHT / 2)
        // {
        //     vOff--;
        // }
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
    if (!jumped && collisionMap[OFFSET(player.worldCol, player.worldRow + player.height, MAPWIDTH)] != 0 && collisionMap[OFFSET(player.worldCol + (player.width / 2), player.worldRow + player.height, MAPWIDTH)] != 0 && collisionMap[OFFSET(player.worldCol + player.width - 1, player.worldRow + player.height, MAPWIDTH)] != 0)
        player.worldRow++;
}

// Fires a bullet
void fireBullet()
{
    player.shot = 1;
    numBullets--;
    // Finds the first inactive bullet
    for (int i = 0; i < BULLETCOUNT; i++)
    {
        if (!bullets[i].active)
        {
            // Positions the new bullet
            if (shootUp)
            {
                bullets[i].worldRow = player.worldRow - bullets[i].width;
                bullets[i].worldCol = player.worldCol;
                bullets[i].direction = 0;

                bullets[i].height = 13;
                bullets[i].width = 5;
            }
            else if (player.aniState == SPRITELEFT || player.aniState == SPRITEIDLE && player.prevAniState == SPRITELEFT)
            {
                bullets[i].worldRow = player.worldRow + player.height / 2 - 3;
                bullets[i].worldCol = player.worldCol - bullets[i].width / 2;
                bullets[i].direction = -1;

                bullets[i].height = 5;
                bullets[i].width = 13;
            }
            else // SPRITERIGHT
            {
                bullets[i].worldRow = player.worldRow + player.height / 2 - 3;
                bullets[i].worldCol = player.worldCol + player.width - bullets[i].width / 2;
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
                shadowOAM[i + WEAPONCOUNT + ENEMYCOUNT + COINCOUNT + AMMOCOUNT + 10].attr0 = (ROWMASK & (bullets[i].worldRow - vOff)) | ATTR0_4BPP | ATTR0_WIDE;
                shadowOAM[i + WEAPONCOUNT + ENEMYCOUNT + COINCOUNT + AMMOCOUNT + 10].attr1 = (COLMASK & (bullets[i].worldCol - hOff)) | ATTR1_TINY;
                shadowOAM[i + WEAPONCOUNT + ENEMYCOUNT + COINCOUNT + AMMOCOUNT + 10].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(20, 0);
            }
            else
            {
                shadowOAM[i + WEAPONCOUNT + ENEMYCOUNT + COINCOUNT + AMMOCOUNT + 10].attr0 = (ROWMASK & (bullets[i].worldRow - vOff)) | ATTR0_4BPP | ATTR0_TALL;
                shadowOAM[i + WEAPONCOUNT + ENEMYCOUNT + COINCOUNT + AMMOCOUNT + 10].attr1 = (COLMASK & (bullets[i].worldCol - hOff)) | ATTR1_TINY;
                shadowOAM[i + WEAPONCOUNT + ENEMYCOUNT + COINCOUNT + AMMOCOUNT + 10].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(22, 0);
            }
        }
        else
        {
            shadowOAM[i + WEAPONCOUNT + ENEMYCOUNT + COINCOUNT + AMMOCOUNT + 10].attr0 = ATTR0_HIDE;
        }
    }
}

void drawBulletsEnemy()
{
    for (int i = 0; i < ENEMYBULLETCOUNT; i++)
    {
        if (enemyBullets[i].active)
        {
            shadowOAM[i + WEAPONCOUNT + ENEMYCOUNT + COINCOUNT + AMMOCOUNT + BULLETCOUNT + 10].attr0 = (ROWMASK & (enemyBullets[i].worldRow - vOff)) | ATTR0_4BPP | ATTR0_WIDE;
            shadowOAM[i + WEAPONCOUNT + ENEMYCOUNT + COINCOUNT + AMMOCOUNT + BULLETCOUNT + 10].attr1 = (COLMASK & (enemyBullets[i].worldCol - hOff)) | ATTR1_TINY;
            shadowOAM[i + WEAPONCOUNT + ENEMYCOUNT + COINCOUNT + AMMOCOUNT + BULLETCOUNT + 10].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(20, 0);
        }
        else
        {
            shadowOAM[i + WEAPONCOUNT + ENEMYCOUNT + COINCOUNT + AMMOCOUNT + BULLETCOUNT + 10].attr0 = ATTR0_HIDE;
        }
    }
}

void fireBulletEnemy(ANISPRITE e)
{
    // JUST FIRES BULLETS
    for (int i = 0; i < ENEMYBULLETCOUNT; i++)
    {
        if (!enemyBullets[i].active && /*timer % 2 == 0 && */ e.active)
        {
            enemyBullets[i].worldRow = e.worldRow + e.height / 2 - 3;
            enemyBullets[i].worldCol = e.worldCol /*- enemyBullets[i].width / 2*/;
            enemyBullets[i].height = 5;
            enemyBullets[i].width = 13;
            if (e.direction == -1)
            {
                enemyBullets[i].direction = -1;
            }
            else // RIGHT
            {
                enemyBullets[i].direction = 1;
            }

            // Takes the bullet out of the pool
            enemyBullets[i].active = 1;

            // Break out of the loop
            break;
        }
    }
}

void drawPlayer()
{
    shadowOAM[0].attr0 = (ROWMASK & player.worldRow - vOff) | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[0].attr1 = (COLMASK & player.worldCol - hOff) | ATTR1_MEDIUM;
    if (jumped)
    {
        if (player.prevAniState == SPRITERIGHT || player.aniState == SPRITERIGHT)
            shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 12);
        else if (player.prevAniState == SPRITELEFT || player.aniState == SPRITELEFT)
            shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(4, 12);
        if (timer % 2 == 0)
        {
            player.worldRow -= 2;
            jumpCount++;

            if (jumpCount == maxJump || (collisionMap[OFFSET(player.worldCol, player.worldRow - 1, MAPWIDTH)] == 0 || collisionMap[OFFSET(player.worldCol + (player.width / 2), player.worldRow - 1, MAPWIDTH)] == 0 || collisionMap[OFFSET(player.worldCol + player.width - 1, player.worldRow - 1, MAPWIDTH)] == 0))
            {
                jumped = 0;
                fallen = 1;
            }
        }
    }
    else if (collisionCheck(collisionMap, MAPWIDTH, player.worldCol, player.worldRow + 2, player.width, player.height, 0, player.rdel))
        player.worldRow++;
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
    // stabbing animation
    else if (stabbing)
    {
        if (player.prevAniState == SPRITERIGHT || player.aniState == SPRITERIGHT)
            shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 16);
        else if (player.prevAniState == SPRITELEFT || player.aniState == SPRITELEFT)
            shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(4, 16);
    }
    // shielding animation
    else if (shielding)
    {
        if (player.prevAniState == SPRITERIGHT || player.aniState == SPRITERIGHT)
            shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 24);
        else if (player.prevAniState == SPRITELEFT || player.aniState == SPRITELEFT)
            shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(4, 24);
    }
    else if (player.shot)
    {
        if (player.prevAniState == SPRITERIGHT || player.aniState == SPRITERIGHT)
            shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 20);
        else if (player.prevAniState == SPRITELEFT || player.aniState == SPRITELEFT)
            shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(4, 20);
    }
    else if (player.prevAniState == SPRITERIGHT && player.aniState != SPRITERIGHT)
        shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 0);
    else if (player.prevAniState == SPRITELEFT && player.aniState != SPRITELEFT)
        shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(4, 0);
    else if (player.aniState == SPRITERIGHT)
        shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, player.curFrame * 4);
    else if (player.aniState == SPRITELEFT)
        shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(4, player.curFrame * 4);
}

void updateCamera()
{
    if (player.worldRow > MAPHEIGHT / 2)
        vOff = 96;
    else
        vOff = 0;
}

void switchWeapons()
{
    if (currWeapon == SHIELD)
    {
        if (hasKnife)
        {
            currWeapon = KNIFE;
        }
        else if (hasGun)
        {
            currWeapon = GUN;
        }
    }
    else if (currWeapon == KNIFE)
    {
        if (hasGun)
        {
            currWeapon = GUN;
        }
        else if (hasShield)
        {
            currWeapon = SHIELD;
        }
    }
    else if (currWeapon == GUN)
    {
        if (hasShield)
        {
            currWeapon = SHIELD;
        }
        else if (hasKnife)
        {
            currWeapon = KNIFE;
        }
    }
}