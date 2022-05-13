#include <stdlib.h>
#include "mode0.h"
#include "game.h"
#include "sound.h"
#include "spritesheet.h"
#include "collisionMap.h"
#include "playerHurt.h"
#include "enemyHit.h"
#include "ammoSound.h"
#include "coinSound.h"
#include "iceSound.h"
#include "jumpSound.h"
#include "lifeSound.h"

OBJ_ATTR shadowOAM[128];

int timer;
int timer2;
int jumped;
int won;
int hasCheat;
int fallen;
int hasIce;
int jumpCount;
int lives;
int pts;
int hasGun;
int shotFrames;
int hasKnife;
int hasShield;
int shootUp;
int collTimer;
int hOff;
int hOff2;
int vOff;
int maxJump;
int hitFrames;
int ovrEnemyColl;
int stabbing;
int stabbingFrames;
int successfulStab;
int shielding;
int shieldingFrames;
int currWeapon;
int numWeapons;
int numBullets;
int playerhOff;
int screenBlock2;
int hasKey;
int keyFall;
int iceFrames;
int timerAniCounter;
int timerCurFrame;

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
    playerhOff = 0;
    hasKey = 0;
    keyFall = 0;
    if (!hasCheat)
        hasIce = 0;
    else
        hasIce = 1;
    iceFrames = 0;
    shotFrames = 0;
    vOff = 0;
    hOff = 0;
    hOff2 = 0;
    won = 0;
    timer = 0;
    timer2 = 0;
    timerAniCounter = 0;
    timerCurFrame = 0;
    hasGun = 0;
    hasKnife = 0;
    hasShield = 0;
    hitFrames = 0;
    shielding = 0;
    shieldingFrames = 0;
    collTimer = 0;
    ovrEnemyColl = 0;
    stabbing = 0;
    stabbingFrames = 0;
    maxJump = 20;
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
    initKey();
    initDoor();
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
            weapon[i].width = 7;
            weapon[i].height = 5;
            weapon[i].worldRow = MAPHEIGHT - 24;
            weapon[i].worldCol = 220;
            weapon[i].aniCounter = 0;
            weapon[i].curFrame = 0;
            weapon[i].numFrames = 2;
            weapon[i].aniState = 0;
            weapon[i].active = 1;
            break;
        case KNIFE:
            weapon[i].width = 4;
            weapon[i].height = 7;
            weapon[i].worldRow = 14;
            weapon[i].worldCol = 272;
            weapon[i].aniCounter = 0;
            weapon[i].curFrame = 0;
            weapon[i].numFrames = 2;
            weapon[i].aniState = 0;
            weapon[i].active = 1;
            break;
        case SHIELD:
            weapon[i].width = 7;
            weapon[i].height = 8;
            weapon[i].worldRow = 60;
            weapon[i].worldCol = 65;
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
    player.width = 9;
    player.height = 22;
    player.cdel = 1;
    player.rdel = 1;
    player.aniCounter = 0;
    player.curFrame = 0;
    player.aniState = 1;
    player.numFrames = 3;
    player.bulletTimer = 20;
    player.shot = 0;

    player.worldRow = 10 + SCREENHEIGHT / 2 - player.width / 2 + vOff;
    player.worldCol = 5;

    jumpCount = 0;
    jumped = 0;
    fallen = 0;
    shootUp = 0;
}

void initKey()
{
    key.width = 7;
    key.height = 13;
    key.worldRow = 8;
    key.worldCol = 1024 - 7 - key.width;
}

void initDoor()
{
    door.width = 16;
    door.height = 32;
    door.worldRow = 216 - door.height;
    door.worldCol = MAPWIDTH - door.width;
}

// initialize enemy
void initEnemy()
{
    for (int i = 0; i < ENEMYCOUNT; i++)
    {
        if (i == 0 || i == 1 || i == 2 || i == 3)
            enemy[i].type = BOSS;
        else
            enemy[i].type = NORMAL;

        switch (enemy[i].type)
        {
        case NORMAL:
            enemy[i].width = 10;
            enemy[i].height = 23;
            enemy[i].cdel = 1;
            enemy[i].rdel = 1;
            enemy[i].bulletTimer = 20;
            enemy[i].hitFramesEnemy = 0;

            if (i == 4)
            {
                enemy[i].worldCol = 60;
                enemy[i].worldRow = 32 - enemy[i].height;
            }
            else if (i == 5)
            {
                enemy[i].worldCol = 106;
                enemy[i].worldRow = 76 - enemy[i].height;
            }
            else if (i == 6)
            {
                enemy[i].worldCol = 485;
                enemy[i].worldRow = 92 - enemy[i].height;
            }
            else if (i == 7)
            {
                enemy[i].worldCol = 354;
                enemy[i].worldRow = 136 - enemy[i].height;
            }
            if (i == 8)
            {
                enemy[i].worldCol = 597;
                enemy[i].worldRow = 100 - enemy[i].height;
            }
            else if (i == 9)
            {
                enemy[i].worldCol = 860;
                enemy[i].worldRow = 60 - enemy[i].height;
            }
            else if (i == 10)
            {
                enemy[i].worldCol = 678;
                enemy[i].worldRow = 244 - enemy[i].height;
            }
            else if (i == 11)
            {
                enemy[i].worldCol = 548;
                enemy[i].worldRow = 196 - enemy[i].height;
            }

            enemy[i].aniCounter = 0;
            enemy[i].curFrame = 0;
            enemy[i].aniState = 1;
            enemy[i].numFrames = 3;
            enemy[i].active = 1;
            enemy[i].health = 2;
            enemy[i].x = 0;
            enemy[i].xLimit = 24;
            enemy[i].shot2 = 0;
            break;
        case BOSS:
            enemy[i].width = 10;
            enemy[i].height = 23;
            enemy[i].cdel = 1;
            enemy[i].rdel = 1;
            enemy[i].bulletTimer = 20;
            enemy[i].hitFramesEnemy = 0;
            enemy[i].aniCounter = 0;
            enemy[i].curFrame = 0;
            enemy[i].aniState = 1;
            enemy[i].numFrames = 3;
            enemy[i].active = 1;
            enemy[i].shot2 = 0;
            enemy[i].health = 4;
            enemy[i].x = 0;
            enemy[i].xLimit = 10;
            if (i == 0)
            {
                enemy[i].worldCol = 97;
                enemy[i].worldRow = 228 - 1 - enemy[i].height;
            }
            else if (i == 1)
            {
                enemy[i].worldCol = 363;
                enemy[i].worldRow = 212 - 1 - enemy[i].height;
            }
            else if (i == 2)
            {
                enemy[i].worldCol = 731;
                enemy[i].worldRow = 80 - 1 - enemy[i].height;
            }
            else if (i == 3)
            {
                enemy[i].worldCol = 787;
                enemy[i].worldRow = 204 - 1 - enemy[i].height;
            }
            break;
        }
    }
}

// initialize coins
void initCoins()
{
    for (int i = 0; i < COINCOUNT; i++)
    {
        if (i == 0 || i == 1)
            coin[i].type = SPECIAL;
        else if (i == 2)
            coin[i].type = ICE;
        else
            coin[i].type = NORMAL;

        switch (coin[i].type)
        {
        case NORMAL:
            coin[i].width = 12;
            coin[i].height = 16;
            if (i == 3)
            {
                coin[i].worldCol = 260;
                coin[i].worldRow = 130;
            }
            else if (i == 4)
            {
                coin[i].worldCol = 210;
                coin[i].worldRow = 20;
            }
            else if (i == 5)
            {
                coin[i].worldCol = 340;
                coin[i].worldRow = 22;
            }
            else if (i == 6)
            {
                coin[i].worldCol = 402;
                coin[i].worldRow = 225;
            }
            else if (i == 7)
            {
                coin[i].worldCol = 491;
                coin[i].worldRow = 105;
            }
            else if (i == 8)
            {
                coin[i].worldCol = 620;
                coin[i].worldRow = 230;
            }
            else if (i == 9)
            {
                coin[i].worldCol = 685;
                coin[i].worldRow = 7;
            }
            else if (i == 10)
            {
                coin[i].worldCol = 920;
                coin[i].worldRow = 220;
            }
            else if (i == 11)
            {
                coin[i].worldCol = 1000;
                coin[i].worldRow = 120;
            }
            coin[i].active = 1;
            break;
        case SPECIAL:
            coin[i].width = 7;
            coin[i].height = 7;
            if (i == 0)
            {
                coin[i].worldCol = 9;
                coin[i].worldRow = 180;
            }
            else if (i == 1)
            {
                coin[i].worldCol = 760;
                coin[i].worldRow = 135;
            }
            coin[i].active = 1;
            break;
        case ICE:
            coin[i].width = 7;
            coin[i].height = 7;
            if (i == 2)
            {
                coin[i].worldCol = 518;
                coin[i].worldRow = 14;
            }
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
            ammo[i].worldCol = 10;
            ammo[i].worldRow = 60;
        }
        else if (i == 1)
        {
            ammo[i].worldCol = 144;
            ammo[i].worldRow = 130;
        }
        else if (i == 2)
        {
            ammo[i].worldCol = 234;
            ammo[i].worldRow = 70;
        }
        else if (i == 3)
        {
            ammo[i].worldCol = 110;
            ammo[i].worldRow = 180;
        }
        else if (i == 4)
        {
            ammo[i].worldCol = 320;
            ammo[i].worldRow = 90;
        }
        else if (i == 5)
        {
            ammo[i].worldCol = 427;
            ammo[i].worldRow = 20;
        }
        else if (i == 6)
        {
            ammo[i].worldCol = 320;
            ammo[i].worldRow = 170;
        }
        else if (i == 7)
        {
            ammo[i].worldCol = 495;
            ammo[i].worldRow = 150;
        }
        else if (i == 8)
        {
            ammo[i].worldCol = 543;
            ammo[i].worldRow = 120;
        }
        else if (i == 9)
        {
            ammo[i].worldCol = 795;
            ammo[i].worldRow = 235;
        }
        else if (i == 10)
        {
            ammo[i].worldCol = 642;
            ammo[i].worldRow = 14;
        }
        else if (i == 11)
        {
            ammo[i].worldCol = 860;
            ammo[i].worldRow = 232;
        }
        else if (i == 12)
        {
            ammo[i].worldCol = 786;
            ammo[i].worldRow = 22;
        }
        else if (i == 13)
        {
            ammo[i].worldCol = 895;
            ammo[i].worldRow = 128;
        }
        else if (i == 14)
        {
            ammo[i].worldCol = 638;
            ammo[i].worldRow = 160;
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
    if (hasIce)
        iceFrames++;
    if (iceFrames >= 1500 && !hasCheat)
        hasIce = 0;

    if (playerhOff > 512 - player.width)
    {
        playerhOff -= 512;
    }
    else if (playerhOff < 0)
    {
        playerhOff += 512;
    }
    updateCamera();
    updatePlayer();
    updateEnemy();
    updateCoins();
    updateAmmo();
    updateKey();
    updateDoor();
    //  Updates all the bullets
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
    timer2++;
    DMANow(3, shadowOAM, OAM, 512);
}

// updates weapons every frame
void updateWeapon()
{
    for (int i = 0; i < WEAPONCOUNT; i++)
    {
        if (weapon[i].aniCounter % 30 == 0)
        {
            weapon[i].curFrame = (weapon[i].curFrame + 1) % 2;
        }
        weapon[i].aniCounter++;

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
                }
                else if (weapon[i].type == KNIFE)
                {
                    hasKnife = 1;
                }
                else if (weapon[i].type == SHIELD)
                {
                    hasShield = 1;
                }
            }
        }
    }
    for (int i = 0; i < WEAPONCOUNT; i++)
    {
        if (weapon[i].active == 1 && onScreen(weapon[i]))
        {
            shadowOAM[i + 21].attr0 = (ROWMASK & (weapon[i].worldRow - vOff)) | ATTR0_4BPP | ATTR0_SQUARE;
            shadowOAM[i + 21].attr1 = (COLMASK & (weapon[i].worldCol - pHoff())) | ATTR1_TINY;
            if (weapon[i].type == GUN)
                shadowOAM[i + 21].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(22, 2 + weapon[i].curFrame);
            else if (weapon[i].type == KNIFE)
                shadowOAM[i + 21].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(21, 2 + weapon[i].curFrame);
            else if (weapon[i].type == SHIELD)
                shadowOAM[i + 21].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(20, 2 + weapon[i].curFrame);
        }
        else
        {
            shadowOAM[i + 21].attr0 = ATTR0_HIDE;
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
        if (!successfulStab && enemy[i].active && stabbing && (collision(enemy[i].worldRow, enemy[i].worldCol, enemy[i].height, enemy[i].width, player.worldRow, player.worldCol + 7, player.height, player.width) || collision(enemy[i].worldRow, enemy[i].worldCol, enemy[i].height, enemy[i].width, player.worldRow, player.worldCol - 7, player.height, player.width)))
        {
            enemy[i].health--;
            enemy[i].hitFramesEnemy = 30;
            playSoundB(enemyHit_data, enemyHit_length, 0);
            successfulStab = 1;

            // push enemy away
            if (collision(enemy[i].worldRow, enemy[i].worldCol, enemy[i].height, enemy[i].width, player.worldRow, player.worldCol + 5, player.height, player.width))
                enemy[i].worldCol += 10;
            else
                enemy[i].worldCol -= 10;
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
            enemy[i].shot = 1;
            enemy[i].shot2 = 1;
        }
        else if (enemy[i].x >= enemy[i].xLimit)
        {
            enemy[i].direction = -1;
            // shoot at turn
            enemy[i].shot = 1;
            enemy[i].shot2 = 1;
        }
        else
        {
            enemy[i].shot = 0;
            // enemy[i].shot2 = 0;
        }

        // drawing enemy shots
        if (enemy[i].shot2)
            enemy[i].shotFramesEnemy++;
        else
            enemy[i].shotFramesEnemy = 0;
        if (enemy[i].shotFramesEnemy >= 36)
            enemy[i].shot2 = 0;

        if (enemy[i].shot && !hasIce && enemy[i].bulletTimer >= 10)
        {
            fireBulletEnemy(enemy[i]);
            enemy[i].bulletTimer = 0;
        }
        enemy[i].bulletTimer++;
        // move enemy
        if (timer % 10 == 0 && !hasIce) // speed of movement + check for freeze
        {
            if (enemy[i].direction == 1)
            {
                enemy[i].worldCol++;
                enemy[i].x++;
            }
            else if (enemy[i].direction == -1)
            {
                enemy[i].worldCol--;
                enemy[i].x--;
            }
        }

        if (enemy[i].aniCounter % 18 == 0 && !hasIce)
        {
            enemy[i].curFrame = (enemy[i].curFrame + 1) % enemy[i].numFrames;
        }
        enemy[i].aniCounter++;
        if (enemy[i].active && (onScreen(enemy[i])))
        {
            shadowOAM[i + WEAPONCOUNT + 21].attr0 = (ROWMASK & (enemy[i].worldRow - vOff)) | ATTR0_4BPP | ATTR0_TALL;
            if (enemy[i].hitFramesEnemy > 0)
            {
                REG_MOSAIC = MOS_OH(1) | MOS_OV(1);
                shadowOAM[i + WEAPONCOUNT + 21].attr0 |= ATTR0_MOSAIC;
                enemy[i].hitFramesEnemy--;
            }
            shadowOAM[i + WEAPONCOUNT + 21].attr1 = (COLMASK & (enemy[i].worldCol - pHoff())) | ATTR1_MEDIUM;
            if (enemy[i].shot2 && !hasCheat && !hasIce)
            {
                if (enemy[i].type == NORMAL)
                {
                    if (enemy[i].direction == 1)
                        shadowOAM[i + WEAPONCOUNT + 21].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(8, 12);
                    else
                        shadowOAM[i + WEAPONCOUNT + 21].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(12, 12);
                }
                else
                {
                    if (enemy[i].direction == 1)
                        shadowOAM[i + WEAPONCOUNT + 21].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(8, 28);
                    else
                        shadowOAM[i + WEAPONCOUNT + 21].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(12, 28);
                }
            }
            else
            {
                if (enemy[i].type == NORMAL)
                {
                    if (enemy[i].direction == 1)
                        shadowOAM[i + WEAPONCOUNT + 21].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(8, enemy[i].curFrame * 4);
                    else
                        shadowOAM[i + WEAPONCOUNT + 21].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(12, enemy[i].curFrame * 4);
                }
                else if (enemy[i].type == BOSS)
                {
                    if (enemy[i].direction == 1)
                        shadowOAM[i + WEAPONCOUNT + 21].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(8, enemy[i].curFrame * 4 + 16);
                    else
                        shadowOAM[i + WEAPONCOUNT + 21].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(12, enemy[i].curFrame * 4 + 16);
                }

                if (collision(player.worldRow, player.worldCol, player.height, player.width, enemy[i].worldRow, enemy[i].worldCol, enemy[i].height, enemy[i].width))
                {
                    ovrEnemyColl = 1;
                    if (lives == 3)
                    {
                        lives--;
                        hitFrames = 30;
                        playSoundB(playerHurt_data, playerHurt_length, 0);
                    }
                    else if (lives == 2 && collTimer % 100 == 0)
                    {
                        lives--;
                        hitFrames = 30;

                        playSoundB(playerHurt_data, playerHurt_length, 0);
                    }
                    else if (lives == 1 && collTimer % 100 == 0)
                    {
                        lives--;
                        hitFrames = 30;

                        playSoundB(playerHurt_data, playerHurt_length, 0);
                    }
                    collTimer++;
                }
            }
        }
        else
            shadowOAM[i + WEAPONCOUNT + 21].attr0 = ATTR0_HIDE;
    }
}

// updates coins every frame
void updateCoins()
{
    for (int i = 0; i < COINCOUNT; i++)
    {
        if (coin[i].type == NORMAL)
        {
            if (coin[i].aniCounter % 20 == 0)
                coin[i].curFrame = (coin[i].curFrame + 1) % 4;
        }
        else
        {
            if (coin[i].aniCounter % 30 == 0)
                coin[i].curFrame = (coin[i].curFrame + 1) % 2;
        }
        coin[i].aniCounter++;

        if (timer % 36 < 12 && coin[i].type == SPECIAL)
            coin[i].rowDirection = 1;
        else
            coin[i].rowDirection = 0;

        if (coin[i].active && onScreen(coin[i]))
        {
            shadowOAM[i + WEAPONCOUNT + ENEMYCOUNT + 21].attr0 = (ROWMASK & (coin[i].worldRow - vOff + coin[i].rowDirection)) | ATTR0_4BPP | ATTR0_SQUARE;
            if (coin[i].type == NORMAL)
            {
                shadowOAM[i + WEAPONCOUNT + ENEMYCOUNT + 21].attr1 = (COLMASK & (coin[i].worldCol - pHoff())) | ATTR1_SMALL;
                shadowOAM[i + WEAPONCOUNT + ENEMYCOUNT + 21].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(24, 2 * coin[i].curFrame);
            }
            else if (coin[i].type == SPECIAL)
            {
                shadowOAM[i + WEAPONCOUNT + ENEMYCOUNT + 21].attr1 = (COLMASK & (coin[i].worldCol - pHoff())) | ATTR1_TINY;
                shadowOAM[i + WEAPONCOUNT + ENEMYCOUNT + 21].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(23, coin[i].curFrame);
            }
            else if (coin[i].type == ICE)
            {
                shadowOAM[i + WEAPONCOUNT + ENEMYCOUNT + 21].attr1 = (COLMASK & (coin[i].worldCol - pHoff())) | ATTR1_SMALL;
                shadowOAM[i + WEAPONCOUNT + ENEMYCOUNT + 21].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(18, 2 * coin[i].curFrame);
            }

            if (collision(player.worldRow, player.worldCol, player.height, player.width, coin[i].worldRow, coin[i].worldCol, coin[i].height, coin[i].width))
            {
                coin[i].active = 0;
                if (coin[i].type == NORMAL)
                {
                    pts++;
                    playSoundB(coinSound_data, coinSound_length, 0);
                }
                else if (coin[i].type == SPECIAL)
                {
                    playSoundB(lifeSound_data, lifeSound_length, 0);
                    if (lives < 3)
                        lives++;
                }
                else if (coin[i].type == ICE)
                {
                    playSoundB(iceSound_data, iceSound_length, 0);
                    hasIce = 1;
                }
            }
        }
        else
            shadowOAM[i + WEAPONCOUNT + ENEMYCOUNT + 21].attr0 = ATTR0_HIDE;
    }
}

// updates ammo every frame
void updateAmmo()
{
    for (int i = 0; i < AMMOCOUNT; i++)
    {
        if (ammo[i].aniCounter % 36 == 0)
        {
            ammo[i].curFrame = (ammo[i].curFrame + 1) % 2;
        }
        ammo[i].aniCounter++;

        if (ammo[i].active && onScreen(ammo[i]))
        {
            shadowOAM[i + WEAPONCOUNT + ENEMYCOUNT + COINCOUNT + 21].attr0 = (ROWMASK & (ammo[i].worldRow - vOff)) | ATTR0_4BPP | ATTR0_SQUARE;
            shadowOAM[i + WEAPONCOUNT + ENEMYCOUNT + COINCOUNT + 21].attr1 = (COLMASK & (ammo[i].worldCol - pHoff())) | ATTR1_TINY;
            shadowOAM[i + WEAPONCOUNT + ENEMYCOUNT + COINCOUNT + 21].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(22, ammo[i].curFrame);

            // max bullets = 99
            if (numBullets < 95 && collision(player.worldRow, player.worldCol, player.height, player.width, ammo[i].worldRow, ammo[i].worldCol, ammo[i].height, ammo[i].width))
            {
                ammo[i].active = 0;
                numBullets += 5;
                playSoundB(ammoSound_data, ammoSound_length, 0);
            }
        }
        else
            shadowOAM[i + WEAPONCOUNT + ENEMYCOUNT + COINCOUNT + 21].attr0 = ATTR0_HIDE;
    }
}

void updateKey()
{
    if (key.aniCounter % 20 == 0)
    {
        key.curFrame = (key.curFrame + 1) % 2;
    }
    key.aniCounter++;

    if (keyFall && key.worldRow < (80 - key.height))
    {
        key.worldRow++;
    }

    if (!hasKey)
    {
        shadowOAM[WEAPONCOUNT + ENEMYCOUNT + COINCOUNT + AMMOCOUNT + BULLETCOUNT + ENEMYBULLETCOUNT + 21].attr0 = (ROWMASK & (key.worldRow - vOff)) | ATTR0_4BPP | ATTR0_TALL;
        shadowOAM[WEAPONCOUNT + ENEMYCOUNT + COINCOUNT + AMMOCOUNT + BULLETCOUNT + ENEMYBULLETCOUNT + 21].attr1 = (COLMASK & (key.worldCol - hOff)) | ATTR1_TINY;
        shadowOAM[WEAPONCOUNT + ENEMYCOUNT + COINCOUNT + AMMOCOUNT + BULLETCOUNT + ENEMYBULLETCOUNT + 21].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(26, 2 * key.curFrame);
    }
    else
        shadowOAM[WEAPONCOUNT + ENEMYCOUNT + COINCOUNT + AMMOCOUNT + BULLETCOUNT + ENEMYBULLETCOUNT + 21].attr0 = ATTR0_HIDE;

    if (collision(player.worldRow, player.worldCol, player.height, player.width, key.worldRow, key.worldCol, key.height, key.width))
    {
        hasKey = 1;
    }
}

void updateDoor()
{
    if (door.aniCounter % 10 == 0)
    {
        door.curFrame = (door.curFrame + 1) % 5;
    }
    door.aniCounter++;

    shadowOAM[1 + WEAPONCOUNT + ENEMYCOUNT + COINCOUNT + AMMOCOUNT + BULLETCOUNT + ENEMYBULLETCOUNT + 21].attr0 = (ROWMASK & (door.worldRow - vOff)) | ATTR0_4BPP | ATTR0_TALL;
    shadowOAM[1 + WEAPONCOUNT + ENEMYCOUNT + COINCOUNT + AMMOCOUNT + BULLETCOUNT + ENEMYBULLETCOUNT + 21].attr1 = (COLMASK & (door.worldCol - hOff)) | ATTR1_MEDIUM;
    shadowOAM[1 + WEAPONCOUNT + ENEMYCOUNT + COINCOUNT + AMMOCOUNT + BULLETCOUNT + ENEMYBULLETCOUNT + 21].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(16, door.curFrame * 4);

    if (hasKey && collision(player.worldRow, player.worldCol, player.height, player.width, door.worldRow, door.worldCol + 5, door.height, door.width))
    {
        won = 1;
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
                enemy[i].hitFramesEnemy = 30;
                playSoundB(enemyHit_data, enemyHit_length, 0);
            }
        }

        // when shoot gate with key
        if (collision(24, 992, 8, 32, b->worldRow, b->worldCol, b->height, b->width))
        {
            SCREENBLOCK[27].tilemap[OFFSET(28, 3, 32)] = 0;
            SCREENBLOCK[27].tilemap[OFFSET(29, 3, 32)] = 0;
            SCREENBLOCK[27].tilemap[OFFSET(30, 3, 32)] = 0;
            SCREENBLOCK[27].tilemap[OFFSET(31, 3, 32)] = 0;
            b->active = 0;
            keyFall = 1;
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
            if (b->worldCol + b->cdel <= MAPWIDTH + hOff - 1)
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
            {
                lives--;
                hitFrames = 30;
                playSoundB(playerHurt_data, playerHurt_length, 0);
            }
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
    if (hasKnife && stabbingFrames < 10)
    {
        stabbingFrames++;
        stabbing = 1;
    }
    else
    {
        stabbing = 0;
        successfulStab = 0;
    }
    if (player.shot)
        shotFrames++;
    else
        shotFrames = 0;
    if (shotFrames % 36 == 0)
        player.shot = 0;

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
        stabbingFrames = 0;
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
    if (player.aniCounter % 6 == 0)
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
    if ((BUTTON_PRESSED(BUTTON_B) || BUTTON_HELD(BUTTON_B)) && jumped == 0 && fallen == 0)
    {
        playSoundB(jumpSound_data, jumpSound_length, 0);
        jumped = 1;
        jumpCount = 0;
        player.rdel = -1;
    }
    if (BUTTON_HELD(BUTTON_LEFT) && (player.worldCol > 0) && collisionCheck(collisionMap, MAPWIDTH, player.worldCol, player.worldRow, player.width, player.height, -player.cdel, 0))
    {
        player.aniState = SPRITELEFT;
        player.worldCol -= player.cdel;

        if ((screenBlock2 > 24 || hOff > 0) && (player.worldCol - playerhOff <= SCREENWIDTH / 2))
        {
            hOff--;
            hOff2 -= (1 / 2);
            playerhOff -= player.cdel;
        }
        // weird check for last half of map
        else if ((screenBlock2 > 24 || hOff > 0) && (player.worldCol - playerhOff - MAPWIDTH / 2 <= SCREENWIDTH / 2))
        {
            hOff--;
            hOff2 -= (1 / 2);
            playerhOff -= player.cdel;
        }
    }
    else if (BUTTON_HELD(BUTTON_RIGHT) && (player.worldCol + player.width - 1 < MAPWIDTH - 6) && collisionCheck(collisionMap, MAPWIDTH, player.worldCol, player.worldRow, player.width, player.height, player.cdel, 0))
    {
        player.aniState = SPRITERIGHT;
        player.worldCol += player.cdel;
        if ((screenBlock2 < 27 || hOff < 32) && hOff + SCREENWIDTH <= MAPWIDTH && player.worldCol - playerhOff >= SCREENWIDTH / 2)
        {
            if (!(screenBlock2 == 26 && playerhOff == 272))
            {
                hOff++;
                hOff2 += (1 / 2);
                playerhOff += player.cdel;
            }
        }
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
            bullets[i].active = 1;
            break;
        }
    }
}

// Draws the bullets
void drawBullets()
{
    for (int i = 0; i < BULLETCOUNT; i++)
    {
        if (bullets[i].active && onScreen(bullets[i]))
        {
            if (bullets[i].direction != 0)
            {
                shadowOAM[i + WEAPONCOUNT + ENEMYCOUNT + COINCOUNT + AMMOCOUNT + 21].attr0 = (ROWMASK & (bullets[i].worldRow - vOff)) | ATTR0_4BPP | ATTR0_SQUARE;
                shadowOAM[i + WEAPONCOUNT + ENEMYCOUNT + COINCOUNT + AMMOCOUNT + 21].attr1 = (COLMASK & (bullets[i].worldCol - pHoff())) | ATTR1_TINY;
                shadowOAM[i + WEAPONCOUNT + ENEMYCOUNT + COINCOUNT + AMMOCOUNT + 21].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(20, 0);
            }
            else
            {
                shadowOAM[i + WEAPONCOUNT + ENEMYCOUNT + COINCOUNT + AMMOCOUNT + 21].attr0 = (ROWMASK & (bullets[i].worldRow - vOff)) | ATTR0_4BPP | ATTR0_SQUARE;
                shadowOAM[i + WEAPONCOUNT + ENEMYCOUNT + COINCOUNT + AMMOCOUNT + 21].attr1 = (COLMASK & (bullets[i].worldCol - pHoff())) | ATTR1_TINY;
                shadowOAM[i + WEAPONCOUNT + ENEMYCOUNT + COINCOUNT + AMMOCOUNT + 21].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(20, 1);
            }
        }
        else
        {
            shadowOAM[i + WEAPONCOUNT + ENEMYCOUNT + COINCOUNT + AMMOCOUNT + 21].attr0 = ATTR0_HIDE;
        }
    }
}

void drawBulletsEnemy()
{
    for (int i = 0; i < ENEMYBULLETCOUNT; i++)
    {
        if (!onScreen(enemyBullets[i]))
        {
            enemyBullets[i].active = 0;
        }

        if (enemyBullets[i].active && onScreen(enemyBullets[i]))
        {
            shadowOAM[i + WEAPONCOUNT + ENEMYCOUNT + COINCOUNT + AMMOCOUNT + BULLETCOUNT + 21].attr0 = (ROWMASK & (enemyBullets[i].worldRow - vOff)) | ATTR0_4BPP | ATTR0_SQUARE;
            shadowOAM[i + WEAPONCOUNT + ENEMYCOUNT + COINCOUNT + AMMOCOUNT + BULLETCOUNT + 21].attr1 = (COLMASK & (enemyBullets[i].worldCol - pHoff())) | ATTR1_TINY;
            shadowOAM[i + WEAPONCOUNT + ENEMYCOUNT + COINCOUNT + AMMOCOUNT + BULLETCOUNT + 21].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(21, 0);
        }
        else
        {
            shadowOAM[i + WEAPONCOUNT + ENEMYCOUNT + COINCOUNT + AMMOCOUNT + BULLETCOUNT + 21].attr0 = ATTR0_HIDE;
        }
    }
}

void fireBulletEnemy(ANISPRITE e)
{
    // JUST FIRES BULLETS
    for (int i = 0; i < ENEMYBULLETCOUNT; i++)
    {
        if (!enemyBullets[i].active && e.active)
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
            break;
        }
    }
}

void drawPlayer()
{
    shadowOAM[0].attr0 = (ROWMASK & (player.worldRow - vOff)) | ATTR0_4BPP | ATTR0_TALL;

    if (hitFrames > 0)
    {
        REG_MOSAIC = MOS_OH(1) | MOS_OV(1);
        shadowOAM[0].attr0 |= ATTR0_MOSAIC;
        hitFrames--;
    }

    shadowOAM[0].attr1 = (COLMASK & (player.worldCol - playerhOff)) | ATTR1_MEDIUM;
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

        if (timer % 1 == 0)
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
        {
            if (BUTTON_HELD(BUTTON_UP))
                shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 28);
            else
                shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 20);
        }
        else if (player.prevAniState == SPRITELEFT || player.aniState == SPRITELEFT)
        {
            if (BUTTON_HELD(BUTTON_UP))
                shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(4, 28);
            else
                shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(4, 20);
        }
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
    if (player.worldRow > MAPHEIGHT / 2 + 16)
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

int pHoff()
{
    return (256 * (screenBlock2 - 24) + hOff);
}

int onScreen(ANISPRITE a)
{
    if ((a.worldRow + a.height - vOff >= 0 && a.worldRow - vOff <= SCREENHEIGHT) &&
        (a.worldCol + a.width - pHoff() >= 0 && a.worldCol - pHoff() <= SCREENWIDTH))
        return 1;
    else
        return 0;
}