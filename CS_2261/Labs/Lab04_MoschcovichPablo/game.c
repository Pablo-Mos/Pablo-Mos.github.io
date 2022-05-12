#include <stdlib.h>
#include "lab04Lib.h"
#include "game.h"

// Variables
// UNCOMMENT 3.1
PLAYER cannon;
// UNCOMMENT 4.0
BULLET bullets[BULLETCOUNT];
BALL balls[BALLCOUNT];
int ballsRemaining;


// Initialize the game
void initGame() {

	// UNCOMMENT 3.4
	initCannon();

	// UNCOMMENT 4.3
	initBullets();

	initBalls();
	ballsRemaining = BALLCOUNT;
}

// Updates the game each frame
void updateGame() {

	// UNCOMMENT 3.5
	updateCannon();

	// TODO 4.2: Update all the bullets
	for (int i = 0; i < BULLETCOUNT; i++) {
		updateBullet(&bullets[i]);
	}

	// TODO 5.0: Update all the balls
	for (int i = 0; i<BALLCOUNT; i++) {
		updateBall(&balls[i]);
	}

}

// Draws the game each frame
void drawGame() {

	// UNCOMMENT 3.6
	drawCannon();
	drawBar();

	// TODO 4.5: Draw all the bullets
	for (int i = 0; i<BULLETCOUNT; i++) {
		drawBullet(&bullets[i]);
	}
	// TODO 5.1: Draw all the balls
	for (int i=0; i<BALLCOUNT; i++) {
		drawBall(&balls[i]);
	}
}

// Draws the bar protecting the cannon
void drawBar() {
	drawRect(0, 120, 240, 3, COLOR(17, 30, 25)); // col, row, width, height, color
}

// UNCOMMENT 3.2: All the way to the end of drawCannon
// Initialize the cannon
void initCannon() {
	cannon.row = 140;
	cannon.col = 118;
	cannon.oldRow = cannon.row;
	cannon.oldCol = cannon.col;
	cannon.cdel = 1;
	cannon.height = 10;
	cannon.width = 5;
	cannon.color = COLOR(255, 175, 75);
	cannon.bulletTimer = 20;

}

 // Handle every-frame actions of the cannon
void updateCannon() {

 	// Move the cannon
	if (BUTTON_HELD(BUTTON_LEFT)
		&& cannon.col >= cannon.cdel) {

		cannon.col -= cannon.cdel;

	} else if (BUTTON_HELD(BUTTON_RIGHT)
		&& cannon.col + cannon.width - 1 < SCREENWIDTH - cannon.cdel) {

		cannon.col += cannon.cdel;

	}
 	// Fire bullets
	if (BUTTON_PRESSED(BUTTON_B) && cannon.bulletTimer >= 20) {
 		// UNCOMMENT 4.4
 		fireBullet();
		// TODO 4.5: Back in main.c, comment out the state transition from game to win
		 cannon.bulletTimer = 0;
	}
	cannon.bulletTimer++;
}

  // Draw the cannon
void drawCannon() {

	drawRect(cannon.oldCol, cannon.oldRow, cannon.width, cannon.height, BLACK);
	drawRect(cannon.col, cannon.row, cannon.width, cannon.height, cannon.color);

	cannon.oldRow = cannon.row;
	cannon.oldCol = cannon.col;
}

// UNCOMMENT 4.1: All the way to the bottom of drawBullet
// Initialize the pool of bullets
void initBullets() {
	// TODO 4.0: Initialize the data for all of the bullets as per the instructions
	for(int i=0; i<BULLETCOUNT; i++) {
		bullets[i].height = 2;
		bullets[i].width = 1;
		bullets[i].row = -bullets[i].height;
		bullets[i].col = 0;
		bullets[i].oldRow = cannon.row;
		bullets[i].oldCol = cannon.col;
		bullets[i].rdel = -3;
		bullets[i].color = WHITE;
		bullets[i].active = 0;
	}
}

// // Spawn a bullet
void fireBullet() {
	// TODO 4.3: Find the first inactive bullet, initialize it, and set it active
	for (int i = 0; i<BULLETCOUNT; i++) {
		if (!(bullets[i].active)) {
			bullets[i].row = cannon.row;
			bullets[i].col = cannon.col + (cannon.width/2) + (bullets[i].width/2);
			bullets[i].active = 1;
			bullets[i].erased = 0;
			break;
		}
	}
}

// // Handle every-frame actions of a bullet
void updateBullet(BULLET* b) {

	// TODO 4.1: If active, move the bullet upwards, and set it inactive if it goes off the screen
	if (b -> active) {
		b -> row -=1; 
		if (b -> row < 0) {
			b -> active = 0;
		}
	}
}
// // Draw a bullet
void drawBullet(BULLET* b) {

	if(b->active) {
		drawRect(b->oldCol, b->oldRow, b->width, b->height, BLACK);
		drawRect(b->col, b->row, b->width, b->height, b->color);
	} else if (!b->erased) {
		drawRect(b->oldCol, b->oldRow, b->width, b->height, BLACK);
		b->erased = 1;
	}
	b->oldRow = b->row;
	b->oldCol = b->col;
}

// Initialize the balls
void initBalls() {

	for (int i = 0; i < BALLCOUNT; i++) {
		balls[i].height = 10;
		balls[i].width = 10;
		balls[i].row = rand() % 110;
		balls[i].col = rand() % 130 + 10;
		balls[i].oldRow = balls[i].row;
		balls[i].oldCol = balls[i].col;
		balls[i].rdel = 1;
		balls[i].cdel = 1;
		balls[i].color = GOLD;
		balls[i].active = 1;
		balls[i].erased = 0;
	}
}

// Handle every-frame actions of a ball
void updateBall(BALL* b) {

	if (b->active) {

		// Bounce the ball off the sides of the box
		if (b->row <= 0 || b->row + b->height-1 >= 120)
			b->rdel *= -1;
		if (b->col <= 0 || b->col + b->width-1 >= SCREENWIDTH-1)
			b->cdel *= -1;

		// Move the ball
		b->row += b->rdel;
		b->col += b->cdel;

		// Handle ball-bullet collisions
		// TODO 6.0: Loop through all the bullets, and if an active bullet is hitting this ball,
		//            put the bullet back in the pool, and update the score.
		for (int j=0; j<BULLETCOUNT; j++) {
			for (int i=0; i<BALLCOUNT; i++) {
				if(bullets[j].active && balls[i].active) {
					if(collision(bullets[j].col, bullets[j].row, bullets[j].width, bullets[j].height, balls[i].col, balls[i].row, balls[i].width, balls[i].height)) {
						bullets[j].active = 0;
						balls[i].active = 0;
						ballsRemaining -=1;
					}
				}
			}
		}

		// TODO 6.1: Back in main.c, transition to win state if ballsRemaining == 0
	}
}

// Draw a ball
void drawBall(BALL* b) {
	if(b->active) {
		drawRect(b->oldCol, b->oldRow, b->width, b->height, BLACK);
		drawRect(b->col, b->row, b->width, b->height, b->color);
	} else if (!b->erased) {
		drawRect(b->oldCol, b->oldRow, b->width, b->height, BLACK);
		b->erased = 1;
	}
	b->oldRow = b->row;
	b->oldCol = b->col;
}
