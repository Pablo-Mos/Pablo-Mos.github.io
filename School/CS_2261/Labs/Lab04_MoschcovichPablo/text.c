#include "lab04Lib.h"
#include "text.h"
#include "font.h"

// Draws the specified character at the specified location in Mode 3
void drawChar(int col, int row, char ch, unsigned short color) {
    // TODO 2.0: Complete this function
    for(int i=0; i<8; i++) {
        for(int j=0; j<6; j++) {
            if(fontdata_6x8[48*ch+j+6*i]) {
                setPixel(col+j, row+i, color);
            }
        }
    }
}

// Draws the specified string at the specified location in Mode 3
void drawString(int col, int row, char *str, unsigned short color) {
    // TODO 2.0: Complete this function
     while(*str != '\0') {
        drawChar(col, row, *str, color);
        col += 6;
        str++;
    }
}