#include <stdlib.h>
#include "lab5lib.h"
#include "game.h"
#include "small_image.h"
// TODO 5.3: Include small_image.h

// Variables
PLAYER player;
BULLET bullets[BULLETCOUNT];
BALL balls[BALLCOUNT];
int ballsRemaining;
int ballsTransformed;

// Initialize the game
void initGame() {
	initPlayer();
	initBullets();
	initBalls();

	// Initialize the score
	ballsRemaining = BALLCOUNT - 1;
	ballsTransformed = 1;

	// Initialize the colors
	unsigned short colors[NUMCOLORS] = {BLACK, PORTAGE, PERSIAN, VIORED, WHITE, GRAY};

	// TODO 5.2: Load the small_image's palette
    DMANow(3, small_imagePal, PALETTE, 256);

	// Load the custom game colors to the end
	for (int i = 0; i < NUMCOLORS; i++) {
			PALETTE[256-NUMCOLORS+i] = colors[i];
	}
}

// Updates the game each frame
void updateGame() {
	updatePlayer();

	// Update all the bullets
	for (int i = 0; i < BULLETCOUNT; i++)
		updateBullet(&bullets[i]);

	// Update all the balls
	for (int i = 0; i < BALLCOUNT; i++)
		updateBall(&balls[i]);
}

// Draws the game each frame
void drawGame() {
	fillScreen4(WHITEID);

	drawPlayer();
	drawBar();

	// Draw all the bullets
	for (int i = 0; i < BULLETCOUNT; i++)
		drawBullet(&bullets[i]);

	// Draw all the balls
	for (int i = 0; i < BALLCOUNT; i++)
		drawBall(&balls[i]);
}

// Draws the bar protecting the player
void drawBar() {
	drawRect4(0, 120, 240, 3, VIOREDID);
}

// Initialize the player
void initPlayer() {
	player.row = 130;
	player.col = 118;
	player.cdel = 2;
	player.height = 12;
	player.width = 5;
	player.color = PERSIANID;
	player.bulletTimer = 20;
}

// Handle every-frame actions of the player
void updatePlayer() {
	// Move the player
	if (BUTTON_HELD(BUTTON_LEFT)
		&& player.col >= player.cdel) {

		player.col -= player.cdel;
				player.cDirection = -1;

	} else if (BUTTON_HELD(BUTTON_RIGHT)
		&& player.col + player.width - 1 < SCREENWIDTH - player.cdel) {

		player.col += player.cdel;
				player.cDirection = 1;

	} else {
				player.cDirection = 0;
		}

	// Fire bullets
	if (BUTTON_PRESSED(BUTTON_A) && player.bulletTimer >= 15) {

		fireBullet();
		player.bulletTimer = 0;
	}

	player.bulletTimer++;
}

// Draw the player
void drawPlayer() {
		drawRect4(player.col, player.row, player.width, player.height, player.color);
}

// Initialize the pool of bullets
void initBullets() {
	for (int i = 0; i < BULLETCOUNT; i++) {

		bullets[i].height = i+1; // Varies size for testing drawRect
		bullets[i].width = i+1;    // Varies size for testing drawRect
		bullets[i].row = -bullets[i].height;
		bullets[i].col = 0;
		bullets[i].rdel = -2;
		bullets[i].cdel = 0;
		bullets[i].color = BLACKID;
		bullets[i].active = 0;
	}
}

// Spawn a bullet
void fireBullet() {
	// Find the first inactive bullet
	for (int i = 0; i < BULLETCOUNT; i++) {
		if (!bullets[i].active) {

			// Position the new bullet
			bullets[i].row = player.row;
			bullets[i].col = player.col + player.width/2
				- bullets[i].width/2;

						// Slant it in the direction of player movement
						bullets[i].cdel = player.cDirection;

			// Take the bullet out of the pool
			bullets[i].active = 1;

			// Break out of the loop
			break;
		}
	}
}

// Handle every-frame actions of a bullet
void updateBullet(BULLET* b) {
	// If active, update; otherwise ignore
	if (b->active) {
		if (b->row + b->height-1 >= 0
						&& b->col + b->cdel > 0
						&& b->col + b->cdel < SCREENWIDTH-1) {

			b->row += b->rdel;
						b->col += b->cdel;
		} else {
			b->active = 0;
		}
	}
}

// Draw a bullet
void drawBullet(BULLET* b) {
	if(b->active) {
		drawRect4(b->col, b->row, b->width, b->height, b->color);
	}
}

// Initialize the balls
void initBalls() {
	for (int i = 0; i < BALLCOUNT; i++) {
		balls[i].row = rand() % 100;
		balls[i].col = rand() % 130 + 10;
		balls[i].rdel = 2;
		balls[i].cdel = 2;
		balls[i].active = 1;
		balls[i].isTransformed = 0;

		// Transform the first ball
		if(i == 0){
			balls[i].isTransformed = 1;
			balls[i].height = 16;
			balls[i].width = 16;
		} else {
			balls[i].height = 10;
			balls[i].width = 10;
		}
	}
}

// Handle every-frame actions of a ball
void updateBall(BALL* b) {
	if (b->active) {
		// Bounce the ball off the sides of the box
		if (b->row <= 1 || b->row + b->height-1 >= 119)
			b->rdel *= -1;
		if (b->col <= 1 || b->col + b->width-1 >= SCREENWIDTH-2)
			b->cdel *= -1;

		// Move the ball
		b->row += b->rdel;
		b->col += b->cdel;

		// Handle ball-bullet collisions
		for (int i = 0; i < BULLETCOUNT; i++) {
			if (bullets[i].active && !b->isTransformed && collision(b->col, b->row, b->width, b->height,
				bullets[i].col, bullets[i].row, bullets[i].width, bullets[i].height)) {

				// Put ball back in the pool
				bullets[i].active = 0;
				
				// Transform balls
				b->isTransformed = 1;
				b->height = 16;
				b->width = 16;

				// Update the score
				ballsRemaining--;
				ballsTransformed++;
			}
		}
	}
}

// Draw a ball
void drawBall(BALL* b) {
	// UNCOMMENT 5.4
	if(b->active) {
		if (b->isTransformed)
			drawImage4(b->col, b->row, b->width, b->height, small_imageBitmap);
		else
			drawRect4(b->col, b->row, b->width, b->height, PORTAGEID);
	}
}