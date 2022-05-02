#include "Lab06Lib.h"
#include "spritesheet.h"

// TODO 2.0: Include your .h files here.


void initialize();

OBJ_ATTR shadowOAM[128];

int main() {

    initialize(); 

	while(1) {
		/****Letter Sprites****/
		
		//C		
		shadowOAM[0].attr0 = 50 | ATTR0_4BPP | ATTR0_SQUARE;
		shadowOAM[0].attr1 = 56 | ATTR1_SMALL;
		shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(2 * 2, 0);
		//O
		shadowOAM[1].attr0 = 50 | ATTR0_4BPP | ATTR0_SQUARE;
		shadowOAM[1].attr1 = 72 | ATTR1_SMALL;
		shadowOAM[1].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(14 * 2, 0);
		//N
		shadowOAM[2].attr0 = 50 | ATTR0_4BPP | ATTR0_SQUARE;
		shadowOAM[2].attr1 = 88 | ATTR1_SMALL;
		shadowOAM[2].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(13 * 2, 0);
		//G
		shadowOAM[3].attr0 = 50 | ATTR0_4BPP | ATTR0_SQUARE;
		shadowOAM[3].attr1 = 104 | ATTR1_SMALL;
		shadowOAM[3].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(6 * 2, 0);
		//R
		shadowOAM[4].attr0 = 50 | ATTR0_4BPP | ATTR0_SQUARE;
		shadowOAM[4].attr1 = 120 | ATTR1_SMALL;
		shadowOAM[4].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(1 * 2, 2);
		//A
		shadowOAM[5].attr0 = 50 | ATTR0_4BPP | ATTR0_SQUARE;
		shadowOAM[5].attr1 = 136 | ATTR1_SMALL;
		shadowOAM[5].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 0);
		//T
		shadowOAM[6].attr0 = 50 | ATTR0_4BPP | ATTR0_SQUARE;
		shadowOAM[6].attr1 = 152 | ATTR1_SMALL;
		shadowOAM[6].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(3 * 2, 2);
		//S
		shadowOAM[7].attr0 = 50 | ATTR0_4BPP | ATTR0_SQUARE;
		shadowOAM[7].attr1 = 168 | ATTR1_SMALL;
		shadowOAM[7].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(2 * 2, 2);

		/****Custom Sprite****/
		shadowOAM[8].attr0 = 66 | ATTR0_4BPP | ATTR0_SQUARE;
		shadowOAM[8].attr1 = 104 | ATTR1_MEDIUM;
		shadowOAM[8].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 4);

		waitForVBlank();

		DMANow(3, shadowOAM, OAM, 512);
	}

	return 0;
}


void initialize() {
	//TODO 2.2: Use DMA to load in the spritesheet and the spritesheet palette
	DMANow(3, spritesheetPal, SPRITEPALETTE, spritesheetPalLen / 2);
    DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen / 2);

	for(int i = 0; i < 128; i++) {
        shadowOAM[i].attr0 = ATTR0_HIDE;
    }
	waitForVBlank();
    DMANow(3, shadowOAM, OAM, 512);

    REG_DISPCTL = MODE0 |SPRITE_ENABLE; 

}
