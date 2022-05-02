#include "lab09lib.h"
#include "digits.h"

// Time variables
int time_m;
int time_s;
int time_cs;

short digit_to_sprite_tile_index[] = {132, 0, 4, 8, 12, 16, 20, 24, 28, 128};
/* !!!!! For learning purposes only -- DO NOT COPY+PASTE FROM THIS FILE !!!!! */

inline void haltUntilInterrupt()
{
  __asm__("swi 0x04 << 15");
}

void displayTime()
{
  short time_m_1s = time_m % 10;
  short time_m_10s = time_m / 10;
  short time_s_1s = time_s % 10;
  short time_s_10s = time_s / 10;
  short time_cs_1s = time_cs % 10;
  short time_cs_10s = time_cs / 10;

  char y = 64;
  char x = 8;
  shadowOAM[0].attr0 = ATTR0_AFFINE | y;
  shadowOAM[0].attr1 = ATTR1_MEDIUM | x;
  shadowOAM[0].attr2 = digit_to_sprite_tile_index[time_m_10s];

  shadowOAM[1].attr0 = ATTR0_AFFINE | y;
  shadowOAM[1].attr1 = ATTR1_MEDIUM | (x + 32);
  shadowOAM[1].attr2 = digit_to_sprite_tile_index[time_m_1s];

  shadowOAM[2].attr0 = ATTR0_TALL | ATTR0_AFFINE | y;
  shadowOAM[2].attr1 = ATTR1_MEDIUM | (x + 64);
  shadowOAM[2].attr2 = 136;

  shadowOAM[3].attr0 = ATTR0_AFFINE | y;
  shadowOAM[3].attr1 = ATTR1_MEDIUM | (x + 64 + 16);
  shadowOAM[3].attr2 = digit_to_sprite_tile_index[time_s_10s];

  shadowOAM[4].attr0 = ATTR0_AFFINE | y;
  shadowOAM[4].attr1 = ATTR1_MEDIUM | (x + 64 + 16 + 32);
  shadowOAM[4].attr2 = digit_to_sprite_tile_index[time_s_1s];

  shadowOAM[5].attr0 = ATTR0_TALL | ATTR0_AFFINE | y;
  shadowOAM[5].attr1 = ATTR1_MEDIUM | (x + 64 + 16 + 64);
  shadowOAM[5].attr2 = 138;

  shadowOAM[6].attr0 = ATTR0_AFFINE | y;
  shadowOAM[6].attr1 = ATTR1_MEDIUM | (x + 64 + 16 + 64 + 16);
  shadowOAM[6].attr2 = digit_to_sprite_tile_index[time_cs_10s];

  shadowOAM[7].attr0 = ATTR0_AFFINE | y;
  shadowOAM[7].attr1 = ATTR1_MEDIUM | (x + 64 + 16 + 64 + 16 + 32);
  shadowOAM[7].attr2 = digit_to_sprite_tile_index[time_cs_1s];
}

/* !!!!! For learning purposes only -- DO NOT COPY+PASTE FROM THIS FILE !!!!! */
void interruptHandler(void)
{
  // TODO 2.4: Disable all interrupts
  REG_IME = 0;
  // TODO 2.5: Set the condition for each of the if statements below, then
  // uncomment the corresponding UNCOMMENT.

  // Set condition for if statement below to check if the interrupt flag
  // register has the bit set for timer 0. Then, uncomment UNCOMMENT 2.0.
  // UNCOMMENT 2.0
  if (REG_IF & INT_TM0)
  {
    time_cs++;
    if (time_cs > 99)
      time_cs = 0;
  }
  // end of UNCOMMENT 2.0

  // Set condition for if statement below to check if the interrupt flag
  // register has the bit set for timer 1. Then, uncomment UNCOMMENT 2.1.
  // UNCOMMENT 2.1
  if (REG_IF & INT_TM1)
  {
    time_s++;
    if (time_s > 59)
    {
      time_s = time_s - 60;
    }
  }
  // end of UNCOMMENT 2.1

  // Set condition for if statement below to check if the interrupt flag
  // register has the bit set for timer 2. Then, uncomment UNCOMMENT 2.2.
  // UNCOMMENT 2.2
  if (REG_IF & INT_TM2)
  {
    time_m++;
  }
  // end of UNCOMMENT 2.2

  // end of TODO 2.5

  // TODO 2.6: Handle VBlank interrupt
  if (REG_IF & INT_VBLANK)
  {
    displayTime();
    DMANow(3, shadowOAM, OAM, 512);
  }
  // TODO 3.0: Handle Button A interrupt. Uncomment UNCOMMENT 3.0 below
  // UNCOMMENT 3.0
  if ((REG_IF & INT_BUTTON) && (~BUTTONS & BUTTON_A))
  {
    PALETTE[0] += 17;
  }
  // end of UNCOMMENT 3.0

  // TODO 3.1: Handle start button interrupt
  if ((REG_IF & INT_BUTTON) && (~BUTTONS & BUTTON_START))
  {
    REG_TM0CNT = TIMER_OFF;
    REG_TM1CNT = TIMER_OFF;
    REG_TM2CNT = TIMER_OFF;
    time_m = 0;
    time_s = 0;
    time_cs = 0;
    REG_TM0CNT = TM_FREQ_1024 | TIMER_ON | TM_IRQ;
    REG_TM1CNT = TM_FREQ_1024 | TIMER_ON | TM_IRQ;
    REG_TM2CNT = TM_CASCADE | TIMER_ON | TM_IRQ;
  }
  // TODO 3.2: Handle select button interrupt
  if ((REG_IF & INT_BUTTON) && (~BUTTONS & BUTTON_SELECT))
  {
    REG_TM0CNT = TIMER_OFF;
    REG_TM1CNT = TIMER_OFF;
    REG_TM2CNT = TIMER_OFF;
  }
  //  TODO 2.7: Tell the GBA that the interrupt has been handled
  REG_IF = REG_IF;
  // TODO 2.8: Re-enable all interrupts
  REG_IME = 1;
}

/* !!!!! For learning purposes only -- DO NOT COPY+PASTE FROM THIS FILE !!!!! */
void enableTimerInterrupts(void)
{
  // TODO 2.0: Enable timer interrupts
  REG_IE = INT_TM0 | INT_TM1 | INT_TM2;
  // TODO 2.1: Set control register and data register for timer 0 (triggers once per cs)
  REG_TM0CNT = 0;
  REG_TM0D = 65536 - 164;
  REG_TM0CNT = TM_FREQ_1024 | TIMER_ON | TM_IRQ;
  // TODO 2.2: Set control register and data register for timer 1 (triggers once per s)
  REG_TM1CNT = 0;
  REG_TM1D = 65536 - 16384;
  REG_TM1CNT = TM_FREQ_1024 | TIMER_ON | TM_IRQ;
  // TODO 2.3: Set control register and data register for timer 1
  // (timer 2 ticks when timer 1 overflows and triggers once per minute)
  REG_TM2CNT = 0;
  REG_TM2D = 65536 - 60;
  REG_TM2CNT = TM_CASCADE | TIMER_ON | TM_IRQ;
}

void setupInterrupts(void)
{
  REG_IME = 0;
  REG_INTERRUPT = (unsigned int)interruptHandler;
  enableTimerInterrupts();
  REG_IE |= INT_VBLANK;
  REG_DISPSTAT |= INT_VBLANK_ENABLE;
  REG_IE |= INT_BUTTON;
  REG_KEYCNT = BUTTON_SELECT | BUTTON_START | BUTTON_A | KEYCNT_INT_ENABLE;
  REG_IME = 1;
  // TODO 1.0: Disable all interrupts

  // TODO 1.1: Set interrupt handler

  // TODO 1.2: Enable VBlank Interrupts

  // TODO 1.3: Enable Button Interrupts

  // TODO 1.4: Re-enable all interrupts
}

/* !!!!! For learning purposes only -- DO NOT COPY+PASTE FROM THIS FILE !!!!! */
int main()
{
  REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;

  // set affine matrix to _something_ -- in case I ever get here.
  shadowOAM[0].fill = 256;
  shadowOAM[3].fill = 256;

  // hide all the sprites I don't plan to use;
  hideSprites();

  // set up interrupts
  setupInterrupts();

  // digits sprites into memory
  DMANow(3, digitsPal, SPRITEPALETTE, digitsPalLen / 2);
  DMANow(3, digitsTiles, &CHARBLOCK[4], digitsTilesLen / 2);

  while (1)
    haltUntilInterrupt();
}