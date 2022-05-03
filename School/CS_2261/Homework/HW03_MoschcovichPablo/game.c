#include <stdlib.h>
#include "hw03lib.h"
#include "game.h"

// Variables
PLAYER player;
WAVE waves[WAVECOUNT];
FOOD foods[FOODCOUNT];
int pts;
int dead;
int dif;

void initGame() {
	initPlayer();
	initWaves();
	initFoods();
}

void updateGame() {
	updatePlayer();

    for (int i = 0; i < WAVECOUNT; i++)
		updateWave(&waves[i]);

	for (int i = 0; i < FOODCOUNT-dif; i++)
		updateFood(&foods[i]);
}

void drawGame() {
	drawPlayer();

    for (int i = 0; i < WAVECOUNT; i++)
		drawWave(&waves[i]);

	for (int i = 0; i < FOODCOUNT-dif; i++)
		drawFood(&foods[i]);
	//creates bubbles in background
    setPixel(rand()%240,rand()%140,DARKBLUE);
    drawCircle(rand()%240,rand()%135,10,DARKERBLUE);
}

void initPlayer() {
	player.row = SCREENHEIGHT / 2;
	player.col = SCREENWIDTH / 2;
	player.oldRow = player.row;
	player.oldCol = player.col;
	player.cdel = 1;
	player.rdel = 1;
	player.height = 5;
	player.width = 5;
	player.color = ORANGE;
}

void updatePlayer() {
	if (BUTTON_HELD(BUTTON_LEFT)
		&& player.col >= player.cdel) {
		player.col -= player.cdel;

	} if (BUTTON_HELD(BUTTON_RIGHT)
		&& player.col + player.width - 1 < SCREENWIDTH - player.cdel) {
		player.col += player.cdel;
	}
	if (BUTTON_HELD(BUTTON_DOWN)
		&& player.row + player.height - 1 < SCREENHEIGHT - player.rdel) {
		player.row += player.rdel;
	}
	if (BUTTON_HELD(BUTTON_UP)
		&& player.row >= player.rdel) {
		player.row -= player.rdel;
	}
}

void drawPlayer() {
	drawRect(player.oldCol, player.oldRow, player.width, player.height, DARKERBLUE);
	drawRect(player.col, player.row, player.width, player.height, player.color);
	drawRect(player.col+1, player.row+3, 3, 1, YELLOW);
	setPixel(player.col+1,player.row+1,YELLOW);
	setPixel(player.col+3,player.row+1,YELLOW);

	player.oldRow = player.row;
	player.oldCol = player.col;
}

void initWaves() {
	for (int i = 0; i < WAVECOUNT; i++) {
		waves[i].height = 10;
		waves[i].width = 2;
		//sections waves for separation
		if(i==0)
			waves[i].row =  rand() % (15);
		else if(i==1)
			waves[i].row =  15+ rand() % (40);
		else if(i==2)
			waves[i].row =  55+ rand() % (40);		
		else if(i==3)
			waves[i].row =  90+ rand() % (30);
		else
			waves[i].row =  120+ rand() % (20);
		//randomly chooses starting side for waves
        if(waves[i].row % 2 == 0)
		    waves[i].col = 0;
        else
 		    waves[i].col = SCREENWIDTH-waves[i].width-2;           
		waves[i].oldRow = player.row;
		waves[i].oldCol = player.col;
		waves[i].cdel = -2;
		//makes waves different colors
		if(i%2==0)
			waves[i].color = LIGHTERBLUE;
		else
			waves[i].color = LIGHTBLUE;
		waves[i].active = 1;
		waves[i].erased = 0;
	}
}

void updateWave(WAVE* w) {

	if (w->active) {
        if (w->col <= 0 || w->col + w->width >= SCREENWIDTH)
			w->cdel *= -1;
		w->col += w->cdel;
		//ends game if player touches wave
		if (collision(w->col, w->row, w->width, w->height, player.col, player.row, player.width, player.height)) {
            dead = 1;
		}
	}
}

void drawWave(WAVE* w) {
	if(w->active) {
		drawRect(w->oldCol, w->oldRow, w->width, w->height, DARKERBLUE);
		drawRect(w->col, w->row, w->width, w->height, w->color);

	} else if (!w->erased) {
		drawRect(w->oldCol, w->oldRow, w->width, w->height, DARKERBLUE);
		w->erased = 1;
	}
	w->oldRow = w->row;
	w->oldCol = w->col;
}

void initFoods() {
	for (int i = 0; i < FOODCOUNT-dif; i++) {
		foods[i].height = 3;
		foods[i].width = 3;
		foods[i].row =  rand() % (SCREENHEIGHT-foods[i].height-1);
 		foods[i].col = rand() % (SCREENWIDTH-foods[i].width-1);
		foods[i].oldRow = player.row;
		foods[i].oldCol = player.col;
		foods[i].color = GREEN;
		foods[i].active = 1;
		foods[i].erased = 0;
	}
}

void updateFood(FOOD* f) {
    if (f->active) {
		if (collision(f->col, f->row, f->width, f->height, player.col, player.row, player.width, player.height)) {
            pts++;
            f->active = 0;
            for (int i = 0; i < WAVECOUNT; i++) {
                if (waves[i].active) {
                    waves[i].height+=5;
                }
            }
		}
	}

    //make food disappear/respawn if wave touches it
    for (int i = 0; i < WAVECOUNT; i++) {
        if (collision(f->col, f->row, f->width, f->height,waves[i].col, waves[i].row, waves[i].width, waves[i].height)) {
            f->row =  rand() % (SCREENHEIGHT-foods[i].height-1);
 		    f->col = rand() % (SCREENWIDTH-foods[i].width-1);
        }
    }
}

void drawFood(FOOD* f) {
    if(f->active) {
		drawRect(f->oldCol, f->oldRow, f->width, f->height, DARKERBLUE);
		drawRect(f->col, f->row, f->width, f->height, f->color);
		setPixel(f->col+1, f->row+1,DARKGREEN);

	} else if (!f->erased) {
		drawRect(f->oldCol, f->oldRow, f->width, f->height, DARKERBLUE);
		f->erased = 1;
	}
	f->oldRow = f->row;
	f->oldCol = f->col;
}