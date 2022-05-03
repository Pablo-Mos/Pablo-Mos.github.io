
#include "hw02lib.h"
#include <stdlib.h>
//#include "print.h"

// prototypes
void initialize();
void update();
void draw();
void drawBall();
void delBall();
void drawFood();
void delFood();
void drawChar1();
void delChar1();
void drawChar2();
void delChar2();
void drawChar3();
void delChar3();
void drawBase();
void endScreen();
void drawStars();
void activeGame();

// buttons
unsigned short buttons;
unsigned short oldButtons;

//declarations
int rand();
int lvl;
int tHeight = 0;
BALL ball;
FOOD food;

// background
unsigned short bgColor;
int tRow,tCol,tOldRow,tOldCol;
int main() {
	initialize();
    //starts game and begins changes
	while (1) {
		oldButtons = buttons;
		buttons = BUTTONS;
		update();
		waitForVBlank();
		draw();
	}
}

void initialize() {
	REG_DISPCTL = MODE3 | BG2_ENABLE;
	u16 buttons = BUTTONS;
	u16 oldButtons = 0;

	//initialize background color and draw background, set variables
	bgColor = BLACK;
	fillScreen(bgColor);
    drawBase();
    ball.col=SCREENWIDTH/2;
    ball.row=0;
    ball.oldCol=ball.col;
    ball.oldRow=ball.row;
    food.row = 120;
    food.col = 5 + rand()%220;
    food.oldCol=food.col;
    food.oldRow=food.row;
    tRow = (SCREENHEIGHT / 2)-22;
	tCol = (SCREENWIDTH / 2)-10;
    tOldRow = tRow;
	tOldCol = tCol;
    lvl=0;
}

// performs all of the game's calculations
void update() {
    //move to sides
    if (BUTTON_HELD(BUTTON_LEFT)) {
		tCol -= 1;
        srand(tCol);
	} else if (BUTTON_HELD(BUTTON_RIGHT)) {
		tCol +=1;
        srand(tCol);
	}

    // boundary checks
	if (tCol < 0) { // left
		tOldCol = tCol;
		tCol = 0;
	}
	if (tCol > SCREENWIDTH - 20) { // right
		tOldCol = tCol;
		tCol = (SCREENWIDTH - 1) - (20);
	}

    //moves balls
    ball.row++;
    if (ball.row >= (SCREENHEIGHT - 20)) {
        ball.row = 0;
        ball.col = 5 + rand()%220;
    }

    //ball collision
    if(collision(ball.col-5,ball.row-5,10,10,tCol,tRow+40,10,41+tHeight)){
        lvl=0;
        ball.row=0;
        delChar3(tOldCol,tOldRow);
    }
    
    //food collision
    if(collision(food.col-2,food.row-2,4,4,tCol+5,tRow+35,10,41)){
        lvl++;
        food.col = 5 + rand()%220;
        delFood(food.oldCol,food.oldRow);
    }

    //restart game
    if(lvl == 3 && BUTTON_PRESSED(BUTTON_START)){
        initialize();
    }
}

// performs all of the writing to screen based on level
void draw() {
    if(lvl==0){
        tHeight = 0;
        delChar1(tOldCol,tOldRow);
        activeGame();
        drawChar1(tCol,tRow);
    }
    else if(lvl==1){
        activeGame();
        tHeight = 4;
        delChar2(tOldCol,tOldRow);
        drawChar2(tCol,tRow);
    }
    else if(lvl==2){
        activeGame();
        tHeight = 12;
        delChar3(tOldCol,tOldRow);
        drawChar3(tCol,tRow);
    }
    else{
        endScreen();
    }

    food.oldCol = food.col;
    food.oldRow = food.row;
    ball.oldCol = ball.col;
    ball.oldRow = ball.row;
    tOldRow = tRow;
	tOldCol = tCol;
}

void activeGame(){
    drawFood(food.col,food.row);
    delBall(ball.oldCol,ball.oldRow);
    drawBall(ball.col,ball.row);
    drawStars();
}

void drawFood(int c, int r){
    drawCircle(c,r,2,CYAN);
}
void delFood(int c, int r){
    drawCircle(c,r,2,BLACK);
}

void drawBall(int c, int r){
    drawCircle(c,r,5,RED);
}

void delBall(int c, int r){
    drawCircle(c,r,5,BLACK);
}

void drawChar1(int tCol,int tRow){
    drawRect(tCol+5,tRow+50,10,10,GRAY);
    drawRect(tCol+12,tRow+52,2,2,BLACK);
    drawRect(tCol+12,tRow+52,1,1,WHITE);
    drawRect(tCol+6,tRow+52,2,2,BLACK);
    drawRect(tCol+6,tRow+52,1,1,WHITE);
    drawRect(tCol+12,tRow+46,2,4,LIGHTPURPLE);
    drawRect(tCol+6,tRow+46,2,4,PINK);
    drawRect(tCol+8,tRow+56,4,2,BLACK);
    drawRect(tCol+0,tRow+60,20,20,GRAY);
    drawRect(tCol+6,tRow+65,8,8,LIGHTPURPLE);
    drawRect(tCol+8,tRow+67,4,4,PINK);
    drawRect(tCol+0,tRow+60,5,10,LIGHTPURPLE);
    drawRect(tCol+15,tRow+60,5,10,LIGHTPURPLE);
    drawRect(tCol+0,tRow+70,5,5,PINK);
    drawRect(tCol+15,tRow+70,5,5,PINK);
    drawRect(tCol+0,tRow+80,5,5,LIGHTPURPLE);
    drawRect(tCol+0,tRow+85,5,2,PINK);
    drawRect(tCol+15,tRow+80,5,5,LIGHTPURPLE);
    drawRect(tCol+15,tRow+85,5,2,PINK);
}

void delChar1(int tCol,int tRow){
    drawRect(tCol+5,tRow+50,10,10,BLACK);
    drawRect(tCol+12,tRow+46,2,4,BLACK);
    drawRect(tCol+6,tRow+46,2,4,BLACK);
    drawRect(tCol+0,tRow+60,20,20,BLACK);
    drawRect(tCol+0,tRow+80,5,5,BLACK);
    drawRect(tCol+0,tRow+85,5,2,BLACK);
    drawRect(tCol+15,tRow+80,5,5,BLACK);
    drawRect(tCol+15,tRow+85,5,2,BLACK);
}

void drawChar2(int tCol,int tRow){
    drawRect(tCol+5,tRow+50,10,10,GRAY);
    drawRect(tCol+12,tRow+52,2,2,BLACK);
    drawRect(tCol+12,tRow+52,1,1,WHITE);
    drawRect(tCol+6,tRow+52,2,2,BLACK);
    drawRect(tCol+6,tRow+52,1,1,WHITE);
    drawRect(tCol+12,tRow+42,2,8,LIGHTPURPLE);
    drawRect(tCol+6,tRow+42,2,8,PINK);
    drawRect(tCol+8,tRow+56,4,2,BLACK);
    drawRect(tCol+0,tRow+60,20,20,GRAY);
    drawRect(tCol+6,tRow+65,8,8,LIGHTPURPLE);
    drawRect(tCol+8,tRow+67,4,4,PINK);
    drawRect(tCol+0,tRow+60,5,15,LIGHTPURPLE);
    drawRect(tCol+15,tRow+60,5,15,LIGHTPURPLE);
    drawRect(tCol+0,tRow+75,5,5,PINK);
    drawRect(tCol+15,tRow+75,5,5,PINK);
    drawRect(tCol+0,tRow+80,5,5,LIGHTPURPLE);
    drawRect(tCol+0,tRow+85,5,2,PINK);
    drawRect(tCol+15,tRow+80,5,5,LIGHTPURPLE);
    drawRect(tCol+15,tRow+85,5,2,PINK);
}

void delChar2(int tCol,int tRow){
    drawRect(tCol+5,tRow+50,10,10,BLACK);
    drawRect(tCol+12,tRow+42,2,8,BLACK);
    drawRect(tCol+6,tRow+42,2,8,BLACK);
    drawRect(tCol+0,tRow+60,20,20,BLACK);
    drawRect(tCol+6,tRow+65,8,8,BLACK);
    drawRect(tCol+8,tRow+67,4,4,BLACK);
    drawRect(tCol+0,tRow+80,5,5,BLACK);
    drawRect(tCol+0,tRow+85,5,2,BLACK);
    drawRect(tCol+15,tRow+80,5,5,BLACK);
    drawRect(tCol+15,tRow+85,5,2,BLACK);
}

void drawChar3(int tCol,int tRow){
    drawRect(tCol+5,tRow+50,10,10,GRAY);
    drawRect(tCol+12,tRow+52,2,2,BLACK);
    drawRect(tCol+12,tRow+52,1,1,RED);
    drawRect(tCol+6,tRow+52,2,2,BLACK);
    drawRect(tCol+6,tRow+52,1,1,RED);
    drawRect(tCol+12,tRow+34,2,16,LIGHTPURPLE);
    drawRect(tCol+6,tRow+34,2,16,RED);
    drawRect(tCol+8,tRow+56,4,2,BLACK);
    drawRect(tCol+0,tRow+60,20,20,GRAY);
    drawRect(tCol+6,tRow+65,8,8,LIGHTPURPLE);
    drawRect(tCol+8,tRow+67,4,4,RED);
    drawRect(tCol+0,tRow+60,5,15,LIGHTPURPLE);
    drawRect(tCol+15,tRow+60,5,15,LIGHTPURPLE);
    drawRect(tCol+0,tRow+75,5,10,RED);
    drawRect(tCol+15,tRow+75,5,10,RED);
    drawRect(tCol+0,tRow+80,5,5,LIGHTPURPLE);
    drawRect(tCol+0,tRow+85,5,2,RED);
    drawRect(tCol+15,tRow+80,5,5,LIGHTPURPLE);
    drawRect(tCol+15,tRow+85,5,2,RED);
}

void delChar3(int tCol,int tRow){
    drawRect(tCol+5,tRow+50,10,10,BLACK);
    drawRect(tCol+12,tRow+34,2,16,BLACK);
    drawRect(tCol+6,tRow+34,2,16,BLACK);
    drawRect(tCol+0,tRow+60,20,20,BLACK);
    drawRect(tCol+0,tRow+60,5,15,BLACK);
    drawRect(tCol+15,tRow+60,5,15,BLACK);
    drawRect(tCol+0,tRow+75,5,10,BLACK);
    drawRect(tCol+15,tRow+75,5,10,BLACK);
    drawRect(tCol+0,tRow+80,5,5,BLACK);
    drawRect(tCol+0,tRow+85,5,2,BLACK);
    drawRect(tCol+15,tRow+80,5,5,BLACK);
    drawRect(tCol+15,tRow+85,5,2,BLACK);
}

void drawBase(){
    drawRect(0,SCREENHEIGHT-10,SCREENWIDTH,10,BROWN);
    drawRect(0,SCREENHEIGHT-15,SCREENWIDTH,5,GREEN);
}

void endScreen(){
    fillScreen(BLACK);
    for(int i=0; i<=10; i++) {
        drawCircle(rand()%240,rand()%160,1,MAGENTA);
        drawCircle(rand()%240,rand()%160,1,GREEN);
        drawCircle(rand()%240,rand()%160,1,CYAN);
        drawCircle(rand()%240,rand()%160,1,YELLOW);
        drawCircle(rand()%240,rand()%160,1,RED);
        drawCircle(rand()%240,rand()%160,1,RED);
    }
}

void drawStars(){
    for(int i=0; i<=1; i++) {
        setPixel(rand()%240,rand()%140,WHITE);
    }
    for(int i=0; i<=1; i++) {
        drawCircle(rand()%240,rand()%135,10,BLACK);
    }
}