#include "lab07Lib.h"
#include "gameBg.h"
#include "spritesheet.h"


// TODO 1.0: Include the spritesheet's .h file here.


void initialize();

unsigned short buttons;
unsigned short oldButtons;

int hOff = 0;
int vOff = 0;

OBJ_ATTR shadowOAM[128];

typedef struct {
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
} ANISPRITE;

ANISPRITE link;
ANISPRITE fairy[4];
#define FAIRYCOUNT 4

// States used for link.aniState
// Idle does not have an actual image associated with it;
// Whenever link is idle, just show whatever state link was before (prevAniState)
enum { SPRITEFRONT, SPRITEBACK, SPRITERIGHT, SPRITELEFT, SPRITEIDLE};

int main() {

    initialize();

    while(1) {

        // TODO 2.1: Set previous state to current state (if not idle)
        //           then reset link's state to idle
        // NOTE: We reset link's state to idle at the beginning of every
        //       frame so that we can easily check to see if any button was pressed.
        // Look for the TODO past the button input section for more explanation, but don't complete it yet
        if(link.aniState != SPRITEIDLE) {
			link.prevAniState = link.aniState;
			link.aniState = SPRITEIDLE;
		}


        // Change the animation frame every 15 frames of gameplay
        if(link.aniCounter % 15 == 0) {
            // TODO 2.2: Change the frame here
            //           Remember that there are only numFrames number of frames
            if (link.curFrame < link.numFrames - 1) {
				link.curFrame++;
			} else {
				link.curFrame = 0;
			}
        }

        
        // Control movement and change animation state
        if(BUTTON_HELD(BUTTON_UP)) {
            // TODO 2.3: Set link's aniState here accordingly
            link.aniState = SPRITEBACK;
            vOff--;
        }
        if(BUTTON_HELD(BUTTON_DOWN)) {
            // TODO 2.4: Set link's aniState here accordingly
			link.aniState = SPRITEFRONT;
            vOff++;
        }
        if(BUTTON_HELD(BUTTON_LEFT)) {
            // TODO 2.5: Set link's aniState here accordingly
			link.aniState = SPRITELEFT;
            hOff--;
        }
        if(BUTTON_HELD(BUTTON_RIGHT)) {
            // TODO 2.6: Set link's aniState here accordingly
			link.aniState = SPRITERIGHT;
            hOff++;
        }

        // TODO 2.7: If the link aniState is idle (thus no key is held),
        //           we want the frame to be link standing (frame 0)
        //           in whatever direction link was facing (set aniState to prevAniState)
        //           Else, if link aniState is not idle, we want to increment aniCounter
        if (link.aniState == SPRITEIDLE) {
			link.curFrame = 0;
			link.aniState = link.prevAniState;
		} else {
			link.aniCounter++;
		}



        // TODO 2.8: Using the proper flags from lab07Lib.h, set up all of your sprite attributes.
        //           (seriously, go look in lab07Lib.h for sprite stuff)
        //           Remember, you will want to consider your current frame and animation state
        //           when telling attr2 which tile index to find the image at.
        //           Hint: frames are the rows of the spritesheet, and animation states are the columns
        //           Hint: since this sprite is 32x32, you are going to have to do some multiplication...
        //                 (each tile is 8x8)
        //           Hint: When link is idle (the aniState SPRITEIDLE), the frame should be 0
        shadowOAM[0].attr0 = link.row | ATTR0_4BPP | ATTR0_SQUARE;
		shadowOAM[0].attr1 = link.col | ATTR1_MEDIUM;
		shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(link.aniState * 4, link.curFrame * 4);


        // === Fairies ===

        // TODO 3.1: For every fairy, change the frame of animation
        //           Remember that there are only numFrames number of frames
        // Change animation frame of flying fairies every 12 frames of gameplay
        // Refer to TODO 2.2 for basic structure
        // You will also need to increment each fairy's aniCounter here
        for (int i=0; i<FAIRYCOUNT; i++) {
			fairy[i].aniCounter++;
			if(fairy[i].aniCounter % 12 == 0) {
				if(fairy[i].curFrame < fairy[i].numFrames - 1) {
					fairy[i].curFrame++;
				} else {
					fairy[i].curFrame = 0;
				}
			}
		}




        // TODO 3.2: Using the proper flags from lab07Lib.h, set up all of your sprite attributes.
        //           (seriously, go look in lab07Lib.h for sprite stuff)
        //           Remember, you will want to consider your current frame and animation state
        //           when telling attr2 which tile index to find the image at.
        //           Hint: frames are the rows of the spritesheet, and animation states are the columns
        //                 ** fairy sprites start at (0,12) **
        //           Hint: since this sprite is 16x16, you are going to have to do some multiplication to get to the next row,
        //                 similar to TODO 2.8
        //                 (each tile is 8x8)
        //           Hint: only the rows(frames) are changing since we only have a single state for flying fairies
        for (int i=0; i<FAIRYCOUNT; i++) {
			shadowOAM[1+i].attr0 = fairy[i].row | ATTR0_4BPP | ATTR0_SQUARE;
			shadowOAM[1+i].attr1 = fairy[i].col | ATTR1_SMALL;
			shadowOAM[1+i].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, (fairy[i].curFrame)*2 + 12);
		}

        // Waiting for VBlank
        waitForVBlank();

        // TODO 2.9: Copy the shadowOAM into the OAM:
		DMANow(3, shadowOAM, OAM, 512);

        // Updating BG0 hOff and vOff
        REG_BG0HOFF = hOff;
        REG_BG0VOFF = vOff;
    }

    return 0;
}


void initialize() {

    // Load the background's palette and tiles into a desired space in memory
    DMANow(3, gameBgPal, PALETTE, 256);
    DMANow(3, gameBgTiles, &CHARBLOCK[0], gameBgTilesLen / 2);
    DMANow(3, gameBgMap, &SCREENBLOCK[28], 1024 * 4);

    // Tell the BG0 control register where to look for its tiles and tile map AND
    //      how to read them from this location (using the given settings)
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_4BPP | BG_SIZE_LARGE;

    // TODO 1.1: Load the spritesheet Tiles and Pal into THEIR desired spaces in memory
    // (Sprite Palette and Background Palette are 2 different things)
    DMANow(3, spritesheetPal, SPRITEPALETTE, 256);
	DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen / 2);



    // TODO 1.2: Hide all sprites with hideSprites().  You must complete this function yourself in lab07Lib.c.
	hideSprites();

    // TODO 1.3: Enable sprites in the Display Controller:
    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE; // TODO 1.3: Enable Sprites here

    // Player's Link
    link.width = 32;
    link.height = 32;
    link.cdel = 1;
    link.rdel = 1;
    link.col = SCREENWIDTH/2 - (link.width/2);
    link.row = SCREENHEIGHT/2 - (link.height/2) + 36;

    // TODO 2.0: Just read this (carefully).  No code needs to be edited here.
    /*  === Animation Variables ===
    *   aniCounter: Used to count how many frames have passed
    *   curFrame: which frame of animation link is in (frames go down the rows in spritesheet)
    *   numFrames: the total number of frames
    *   aniState: which state of animation link is in (states are in different columns of spritesheet)
    */
    link.aniCounter = 0;
    link.curFrame = 0;
    link.numFrames = 3;
    link.aniState = SPRITEFRONT;

    // Fairies
    for(int i = 0; i < FAIRYCOUNT; i++){
        fairy[i].width = 16;
        fairy[i].height = 16;
        // Place flying fairies at center-bottom of screen
        fairy[i].col = SCREENWIDTH/2 - (fairy[i].width/2 * i * 4) + 36;
        fairy[i].row = SCREENHEIGHT - (fairy[i].height);

        
        // TODO 3.0: Just read this (carefully).  No code needs to be edited here.
        /*  === Animation Variables ===
        *   aniCounter: Used to count how many frames have passed
        *   curFrame: which frame of animation the fairy is in (frames go down the rows in spritesheet)
        *       - fairy will start at row 12 of the spritesheet (start counting at 0, tile 12 is where it begins)
        *       - curFrame will count from 0 to indicate 0th frame of the fairy animation
        *   numFrames: the total number of frames
        *   aniState: which state of animation fairy is in (states are in different columns of spritesheet)
        */
        fairy[i].aniCounter = 0;
        fairy[i].curFrame = 0;
        fairy[i].numFrames = 3;
        fairy[i].aniState = SPRITEFRONT; // this can also be seen as aniState = 0
    }

    buttons = BUTTONS;

    // Because why not start here?
    hOff = 134;
    vOff = 172;

}
