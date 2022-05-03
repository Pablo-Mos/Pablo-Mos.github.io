#include "lab5lib.h"

// The start of the video memory
unsigned short *videoBuffer = (unsigned short *)0x6000000;

// The start of DMA registers
DMA *dma = (DMA *)0x40000B0;

// Set a pixel on the screen in Mode 3
void setPixel3(int col, int row, unsigned short color) {
	videoBuffer[OFFSET(col, row, SCREENWIDTH)] = color;
}

// Set a pixel on the screen in Mode 4
void setPixel4(int col, int row, unsigned char colorIndex) {
    // TODO 2.0: Write this function
    unsigned short pixels = videoBuffer[OFFSET(col/2, row, SCREENWIDTH/2)];
    if (col & 1) {
        pixels &= 0xFF;
        videoBuffer[OFFSET(col/2, row, SCREENWIDTH/2)] = pixels | colorIndex << 8;
    } else {
        pixels &= 0xFF << 8;
        videoBuffer[OFFSET(col/2, row, SCREENWIDTH/2)] = pixels | colorIndex;
    }

}

// Draw a rectangle at the specified location and size in Mode 3
void drawRect3(int col, int row, int width, int height, volatile unsigned short color) {
	for(int r = 0; r < height; r++) {
        DMANow(3, &color, &videoBuffer[OFFSET(col, row + r, SCREENWIDTH)], DMA_SOURCE_FIXED | width);
	}
}

// Draw a rectangle at the specified location and size in Mode 4
void drawRect4(int col, int row, int width, int height, volatile unsigned char colorIndex) {
    // TODO 6.0: Write this function using DMA
    unsigned short pixels = colorIndex << 8 | colorIndex;

    for (int r = 0; r < height; r++) {
        if (col % 2 == 0) {
            if (width > 1) {
                DMANow(3, &pixels, &videoBuffer[OFFSET(col/2, row + r, SCREENWIDTH/2)], (width/2) | DMA_SOURCE_FIXED);  
            }
            if (width % 2 == 1) {
                setPixel4(col + width - 1, row + r, colorIndex);
            }
        }
        else {
            setPixel4(col, row + r, colorIndex);
            if (width % 2 == 1) {
                if (width > 1) {
                    DMANow(3, &pixels, &videoBuffer[OFFSET((col + 1)/2, row + r, SCREENWIDTH/2)], (width/2) | DMA_SOURCE_FIXED);
                }
            } else {
                if (width > 2) {
                DMANow(3, &pixels, &videoBuffer[OFFSET((col + 1)/2, row + r, SCREENWIDTH/2)], ((width/2) - 1) | DMA_SOURCE_FIXED);
                }
                setPixel4(col + width - 1, row + r, colorIndex);
            }
        }
    }
}

// Fill the entire screen with a single color in Mode 3
void fillScreen3(volatile unsigned short color) {
    unsigned short c = color;
	DMANow(3, &c, videoBuffer, DMA_SOURCE_FIXED | (SCREENWIDTH * SCREENHEIGHT));
}

// Fill the entire screen with a single color in Mode 4
void fillScreen4(volatile unsigned char colorIndex) {
    // Double up our colorIndex to set 2 pixels per transfer (DMA by default transfers 2 bytes at a time)
    volatile unsigned short color = colorIndex | colorIndex << 8;
    // TODO 3.0: Write this function using DMA
    DMANow(3, &color, videoBuffer, SCREENHEIGHT * SCREENWIDTH / 2 | DMA_ON | DMA_SOURCE_FIXED | DMA_SOURCE_INCREMENT);    
}

// Draw an image at the specified location and size in Mode 3
void drawImage3(int col, int row, int width, int height, const unsigned short *image) {
    for(int r = 0; r < height; r++) {
        DMANow(3, &image[OFFSET(0, r, width)], &videoBuffer[OFFSET(col, row + r, SCREENWIDTH)], width);
    }
}

// Draw an image at the specified location and size in Mode 4 (must be even col and width)
void drawImage4(int col, int row, int width, int height, const unsigned short *image) {
    // TODO 5.0: Write this function using DMA
    for (int y = 0; y < height; y++) {
        DMANow(3, &image[OFFSET(0, y, width / 2)], videoBuffer + OFFSET(col, row + y, SCREENWIDTH)/2, (width/2) | DMA_ON);
    }
}

// Fill the entire screen with an image in Mode 3
void drawFullscreenImage3(const unsigned short *image) {
    DMANow(3, image, videoBuffer, SCREENWIDTH * SCREENHEIGHT);
}

// Fill the entire screen with an image in Mode 4
void drawFullscreenImage4(const unsigned short *image) {
    // TODO 4.0: Write this function using DMA
    DMANow(3, (unsigned short*)image, videoBuffer, ((SCREENWIDTH * SCREENHEIGHT)/2));    
}

// Pause code execution until vertical blank begins
void waitForVBlank() {
	while(SCANLINECOUNTER > 160);
	while(SCANLINECOUNTER < 160);
}

// Flips the page
void flipPage() {
    if (REG_DISPCTL & DISP_BACKBUFFER) {
        videoBuffer = BACKBUFFER;
    } else {
        videoBuffer = FRONTBUFFER;
    }
    REG_DISPCTL ^= DISP_BACKBUFFER;
}

// TODO 1.0: Complete this function
// Set up and begin a DMA transfer
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt) {
    // Remember to write this function to work with any passed in channel (0, 1, 2, 3).
    // Don't forget to set DMA_ON with the passed in cnt!

    // Clear cnt in the specified DMA channel
    dma[channel].cnt = 0;

    // Set the src of the specified dma channel to the passed in src
    dma[channel].src = src;    

    // Set the dst of the specified dma channel to the passed in dst
    dma[channel].dst = dst;

    // Set the cnt of the specified dma channel to the passed in cnt and turn the dma channel on
    dma[channel].cnt = cnt | DMA_ON;    
}

// Return true if the two rectangular areas are overlapping
int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB) {
    return rowA < rowB + heightB - 1 && rowA + heightA - 1 > rowB
        && colA < colB + widthB - 1 && colA + widthA - 1 > colB;
}