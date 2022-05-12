
// GBA Video Registers and Flags
#define REG_DISPCTL (*(volatile unsigned short *)0x4000000)
#define MODE3 3
#define BG2_ENABLE (1<<10)

// Create a color with the specified RGB values
#define COLOR(r, g, b) ((r) | (g)<<5 | (b)<<10)

// Calculate the position of a pixel based on its row and column
#define OFFSET(col, row, rowlen) ((row)*(rowlen)+(col))

// Predefined colors
#define RED COLOR(31, 0, 0)
#define GREEN COLOR(0, 31, 0)
#define BLUE COLOR(0, 0, 31)
#define MAGENTA COLOR(31, 0, 31)
#define CYAN COLOR(0, 31, 31)
#define YELLOW COLOR(31, 31, 0)
#define BLACK 0
#define WHITE COLOR(31, 31, 31)

// Function Prototypes
void setPixel(int, int, unsigned short);
void drawRect(int, int, unsigned short);
void drawParallelogram(int, int, unsigned short);


// Global Variables
volatile unsigned short *videoBuffer = (unsigned short *)0x6000000;

// Size Macros
//TODO 2.0: Choose a width and height for your rectangles
#define RECT_WIDTH 20
#define RECT_HEIGHT 10

//TODO 3.0: Choose a width and height for your parallelograms


int main() {

    REG_DISPCTL = MODE3 | BG2_ENABLE;

    //TODO 1.1: Test your setPixel function (you can comment this back out later)
    setPixel(2,5,GREEN);
    //TODO 2.2: Call your drawRect function twice
    drawRect(15,22,RED);
    drawRect(55,80,BLUE);
    //TODO 3.2: Call your drawParallelogram function once
    drawParallelogram(90,60, CYAN);
    
    while(1);
}


void setPixel(int col, int row, unsigned short color) {
    videoBuffer[OFFSET(col, row, 240)] = color;
}

void drawRect(int col, int row, unsigned short color) {
    for(int i=0; i<RECT_HEIGHT; i++) {
        for(int j=0; j<RECT_WIDTH; j++){
            setPixel(col+j, row+i, color);
        }
    }
}

void drawParallelogram(int col, int row, unsigned short color) {
    int x=0;
    for(int i=0; i<45; i++) {
        for(int j=0; j<38; j++){
            setPixel(col+j+x, row+i, color);
        }
        x++;
    }
}
