# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"

# 1 "lab2lib.h" 1




typedef unsigned short u16;
# 25 "lab2lib.h"
extern volatile unsigned short *videoBuffer;
# 40 "lab2lib.h"
void setPixel(int col, int row, unsigned short color);
void drawRect(int col, int row, int width, int height, unsigned short color);
void fillScreen(unsigned short color);


void waitForVBlank();
# 66 "lab2lib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 78 "lab2lib.h"
int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);
# 3 "main.c" 2
# 1 "print.h" 1
# 26 "print.h"
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 1 3 4
# 9 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 1 3 4
# 12 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 1 3 4







# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 1 3 4
# 28 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_newlib_version.h" 1 3 4
# 29 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 2 3 4
# 9 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 2 3 4
# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4

# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef signed char __int8_t;

typedef unsigned char __uint8_t;
# 55 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef short int __int16_t;

typedef short unsigned int __uint16_t;
# 77 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long int __int32_t;

typedef long unsigned int __uint32_t;
# 103 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __int64_t;

typedef long long unsigned int __uint64_t;
# 134 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef signed char __int_least8_t;

typedef unsigned char __uint_least8_t;
# 160 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef short int __int_least16_t;

typedef short unsigned int __uint_least16_t;
# 182 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long int __int_least32_t;

typedef long unsigned int __uint_least32_t;
# 200 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __int_least64_t;

typedef long long unsigned int __uint_least64_t;
# 214 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __intmax_t;







typedef long long unsigned int __uintmax_t;







typedef int __intptr_t;

typedef unsigned int __uintptr_t;
# 13 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 1 3 4
# 35 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
# 187 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
# 14 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_stdint.h" 1 3 4
# 20 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_stdint.h" 3 4
typedef __int8_t int8_t ;



typedef __uint8_t uint8_t ;







typedef __int16_t int16_t ;



typedef __uint16_t uint16_t ;







typedef __int32_t int32_t ;



typedef __uint32_t uint32_t ;







typedef __int64_t int64_t ;



typedef __uint64_t uint64_t ;






typedef __intmax_t intmax_t;




typedef __uintmax_t uintmax_t;




typedef __intptr_t intptr_t;




typedef __uintptr_t uintptr_t;
# 15 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4






typedef __int_least8_t int_least8_t;
typedef __uint_least8_t uint_least8_t;




typedef __int_least16_t int_least16_t;
typedef __uint_least16_t uint_least16_t;




typedef __int_least32_t int_least32_t;
typedef __uint_least32_t uint_least32_t;




typedef __int_least64_t int_least64_t;
typedef __uint_least64_t uint_least64_t;
# 51 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast8_t;
  typedef unsigned int uint_fast8_t;
# 61 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast16_t;
  typedef unsigned int uint_fast16_t;
# 71 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast32_t;
  typedef unsigned int uint_fast32_t;
# 81 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef long long int int_fast64_t;
  typedef long long unsigned int uint_fast64_t;
# 10 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 2 3 4
# 27 "print.h" 2
# 36 "print.h"

# 36 "print.h"
void mgba_printf_level(int level, const char* ptr, ...);
void mgba_printf(const char* string, ...);
void mgba_break(void);
uint8_t mgba_open(void);
void mgba_close(void);
# 4 "main.c" 2


void initialize();
void update();
void draw();


unsigned short buttons;
unsigned short oldButtons;


unsigned short bgColor;


int cHeight, cWidth;


int c1Row, c1Col;
unsigned short c1Color;


int c2Row, c2Col;
unsigned short c2Color;


int c3Row, c3Col;
unsigned short c3Color;


int c4Row, c4Col;
unsigned short c4Color;


int pRow, pCol, pOldRow, pOldCol, pRDel, pCDel, pHeight, pWidth;
unsigned short pColor;

int main() {



 mgba_open();


 mgba_printf("Debugging Initialized");


 initialize();

 while (1) {

  oldButtons = buttons;
  buttons = (*(volatile unsigned short *)0x04000130);
  update();
  waitForVBlank();
  draw();
 }
}


void initialize() {
 (*(volatile unsigned short *)0x4000000) = 3 | (1<<10);


 u16 buttons = (*(volatile unsigned short *)0x04000130);
 u16 oldButtons = 0;



 pColor = ((0) | (0)<<5 | (31)<<10);
 c1Color = ((31) | (0)<<5 | (31)<<10);
 c2Color = ((31) | (31)<<5 | (0)<<10);
 c3Color = ((0) | (31)<<5 | (0)<<10);
 c4Color = ((0) | (31)<<5 | (31)<<10);




 bgColor = ((31) | (31)<<5 | (31)<<10);
 fillScreen(bgColor);



 cHeight = 30;
 cWidth = 30;

 c1Row = 30;
 c1Col = 30;

 c2Row = 30;
 c2Col = 180;

 c3Row = 100;
 c3Col = 180;

 c4Row = 100;
 c4Col = 30;


 pHeight = 15;
 pWidth = 15;
 pRow = (160 / 2) - (pHeight / 2);
 pCol = (240 / 2) - (pWidth / 2);
 pOldRow = pRow;
 pOldCol = pCol;
 pRDel = 1;
 pCDel = 1;
}


void update() {


 if (((!(~oldButtons & (1<<0))) && (~buttons & ((1<<0))))) {
  pColor = 0;
 }
 if (((!(~oldButtons & (1<<1))) && (~buttons & ((1<<1))))) {
  pColor = ((0) | (0)<<5 | (31)<<10);
 }



 if (pCol < 0) {
  pOldCol = pCol;
  pCol = 0;
 }
 if (pCol + pWidth > 240) {
  pOldCol = pCol;
  pCol = (240 - 1) - (pWidth - 1);
 }
 if (pRow < 0) {
  pOldRow = pRow;
  pRow = 0;
 }
 if (pRow + pHeight > 160) {
  pOldRow = pRow;
  pRow = (160 - 1) - (pHeight - 1);
 }



 if((~(*(volatile unsigned short *)0x04000130) & ((1<<6)))) {
  pRow -=1;
 } else if ((~(*(volatile unsigned short *)0x04000130) & ((1<<7)))) {
  pRow +=1;
 } else if ((~(*(volatile unsigned short *)0x04000130) & ((1<<5)))) {
  pCol -= 1;
 } else if ((~(*(volatile unsigned short *)0x04000130) & ((1<<4)))) {
  pCol +=1;
 }





 if (collision(pCol, pRow, pWidth, pHeight, c1Col, c1Row, cWidth, cHeight)){
  pColor = c1Color;
 }

 if (collision(pCol, pRow, pWidth, pHeight, c2Col, c2Row, cWidth, cHeight)){
  pColor = c2Color;
 }

 if (collision(pCol, pRow, pWidth, pHeight, c3Col, c3Row, cWidth, cHeight)){
  pColor = c3Color;
 }

 if (collision(pCol, pRow, pWidth, pHeight, c4Col, c4Row, cWidth, cHeight)){
  pColor = c4Color;
 }






 if (pOldRow != pRow || pOldCol != pCol) {






  mgba_printf("Player has moved!");







  mgba_printf_level(4, "Current Position: (%d, %d)", pCol, pRow);

 }
# 207 "main.c"
}


void draw() {






 if(!(~(*(volatile unsigned short *)0x04000130) & ((1<<2)))){
  drawRect(pOldCol, pOldRow, pWidth, pHeight, bgColor);
 }


 drawRect(pCol, pRow, pWidth, pHeight, pColor);


 drawRect(c1Col, c1Row, cWidth, cHeight, c1Color);
 drawRect(c2Col, c2Row, cWidth, cHeight, c2Color);
 drawRect(c3Col, c3Row, cWidth, cHeight, c3Color);
 drawRect(c4Col, c4Row, cWidth, cHeight, c4Color);



 pOldRow = pRow;
 pOldCol = pCol;
}
