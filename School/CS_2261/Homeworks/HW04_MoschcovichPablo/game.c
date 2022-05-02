#include <stdlib.h>
#include "HW04Lib.h"
#include "game.h"
#include "ship.h"

// variables
PLAYER player;
BULLET bullets[BULLETCOUNT];
ENEMY enemies[ENEMYCOUNT];
int enemiesRemaining;
int gameState;
int dim;

// initialize game
void initGame() {
    initPlayer();
    initBullets();
    initEnemies();

    enemiesRemaining = ENEMYCOUNT;
    gameState = 0;
    dim = 0;

    unsigned short colors[NUMCOLORS] = {BLACK, BLUE, GREEN, RED, WHITE, GRAY};

    DMANow(3, &shipPal, PALETTE, 256);
    for (int i = 0; i < NUMCOLORS; i++) {
        PALETTE[256-NUMCOLORS+i] = colors[i];
    }
}

// update game each frame
void updateGame() {
    updatePlayer();
    for(int i = 0; i < BULLETCOUNT; i++) {
        updateBullet(&bullets[i]);
    }
    for (int i = 0; i < ENEMYCOUNT; i++) {
        updateEnemy(&enemies[i]);
    }
}

// draw game each frame
void drawGame() {
    fillScreen4(BLUEID);
    drawRect4(0,0,16,SCREENHEIGHT,BLACKID);
    drawPlayer();
    for (int i = 0; i < BULLETCOUNT; i++) {
        drawBullet(&bullets[i]);
    }
    for (int i = 0; i < ENEMYCOUNT; i++) {
        drawEnemy(&enemies[i]);
    }
}

// initialize player
void initPlayer() {
    player.col = SCREENWIDTH-player.width-16;
    player.row = SCREENHEIGHT/2 -10;
    player.width = 12;
    player.height = 12;
    player.cdel = 1;
    player.rdel = 1;
    player.bulletTimer = 15;
}


// update player
void updatePlayer() {
    // move player to the right
    if (BUTTON_PRESSED(BUTTON_RIGHT)
        && (player.col + player.width - 1 < SCREENWIDTH)) {
            player.col += player.cdel;
    }
    if (BUTTON_HELD(BUTTON_RIGHT) 
        && (player.col + player.width - 1 < SCREENWIDTH)) {
            player.col += player.cdel;
    }

    // move player to the left
    if (BUTTON_PRESSED(BUTTON_LEFT) 
        && (player.col > 0)) {
            player.col -= player.cdel;
    }
    if (BUTTON_HELD(BUTTON_LEFT) 
        && (player.col > 0)) {
            player.col -= player.cdel;
    }

    // move player up
    if (BUTTON_PRESSED(BUTTON_UP) 
        && (player.row > 0)) {
            player.row -= player.rdel;
    }
    if (BUTTON_HELD(BUTTON_UP)
        && (player.row > 0)) {
            player.row -= player.rdel;
    }

    // move player down
    if (BUTTON_PRESSED(BUTTON_DOWN) 
        && (player.row + player.height - 1 < SCREENHEIGHT)) {
            player.row += player.rdel;
    }
    if (BUTTON_HELD(BUTTON_DOWN) 
        && (player.row + player.height - 1 < SCREENHEIGHT)) {
            player.row += player.rdel;
    }

    // shoot bullets
    if (BUTTON_PRESSED(BUTTON_B) && player.bulletTimer >= 15) {
        fireBullet();
        player.bulletTimer = 0;
    }

    // allow player to move up and out of screen after destroying all enemies
    if (player.col <= 2 && enemiesRemaining == 0) {
        gameState = 1;
    }

    player.bulletTimer++;
}

// draw player each frame
void drawPlayer() {
    drawImage4(player.col, player.row, player.width, player.height, shipBitmap);
}

// initialize bullets
void initBullets() {
    for (int i = 0; i < BULLETCOUNT; i++) {
        bullets[i].col = player.col;
        bullets[i].row = player.row;
        bullets[i].width = 3;
        bullets[i].height = 1;
        bullets[i].cdel = -2;
        bullets[i].rdel = 0;
        bullets[i].active = 0;
        bullets[i].color = WHITEID;
    }
}

// fire bullets
void fireBullet() {
    for (int i = 0; i < BULLETCOUNT; i++) {
        if (!bullets[i].active) {
            bullets[i].row = player.row + (player.height / 2) // position bullet
                - (bullets[i].height / 2);
            bullets[i].col = player.col;
            bullets[i].active = 1;
            break;
        }
    }
}

// update bullet each frame
void updateBullet(BULLET* b) {
    if (b->active) { // update active bullets
        if (b->col + (b->width - 1) > 0
            && b->row > 0
            && b->row + b->height -1 < SCREENHEIGHT) {
                b->col += b->cdel;
                b->row += b->rdel;
        } else { // ignore inactive bullets
            b->active = 0;
        }
    }
}

// draw active bullets each frame
void drawBullet(BULLET* b) {
    if (b->active) {
        drawRect4(b->col, b->row, b->width, b->height, WHITEID);
    }
}

// initialize enemies
void initEnemies() {
    int fallSpeed = 10;

    for (int i = 0; i < ENEMYCOUNT; i++) {
        if (i % 2 == 0) { // vary fall speed
            fallSpeed = 2;
        }
        enemies[i].col = rand() % 130 + 16;
        enemies[i].row = rand() % 100 + 12;
        enemies[i].width = 10;
        enemies[i].height = 10;
        enemies[i].cdel = 1;
        enemies[i].rdel = fallSpeed;
        enemies[i].active = 1;
    }
}

// update enemy each frame
void updateEnemy(ENEMY* a) {
    if (a->active) {
        // reflect enemy off the walls
        if (a->col <= 1 || a->col + a->width+dim - 1 > SCREENWIDTH - 2 || a->col + a->width+dim - 1 < 25+dim){
            a->cdel *= -1;
        }
        if (a->row <= 1 || a->row + a->height+dim - 1 > SCREENHEIGHT) {
            a->rdel *= -1;
        }

        // update positions
        a->col += a->cdel;
        a->row += a->rdel;

        // handle enemy-bullet collision
        for (int i = 0; i < BULLETCOUNT; i++) {
            if (bullets[i].active && collision(a->col, a->row, a->width+dim, a->height+dim, 
                bullets[i].col, bullets[i].row, bullets[i].width, bullets[i].height)) {
                    a->active = 0;
                    bullets[i].active = 0;
                    enemiesRemaining--;
                    dim+=3;
                    REG_SND2CNT = DMG_ENV_VOL(15) | DMG_DIRECTION_DECR | DMG_STEP_TIME(7) | DMG_DUTY_50;
                    REG_SND2FREQ = NOTE_B4 | SND_RESET | DMG_FREQ_TIMED;
            }
        }

        // handle enemy-player collision
        if (collision(a->col, a->row, a->width+dim, a->height+dim, 
            player.col, player.row, player.width, player.height)) {
                gameState = -1;
                REG_SND2CNT = DMG_ENV_VOL(10) | DMG_DIRECTION_DECR | DMG_STEP_TIME(7) | DMG_DUTY_50;
                REG_SND2FREQ = NOTE_E4 | SND_RESET | DMG_FREQ_TIMED;
        }
    }
}

// draw enemy each frame
void drawEnemy(ENEMY* a) {
    if (a->active) {
        drawRect4(a->col, a->row, a->width + dim, a->height + dim, GREENID);
    }
}