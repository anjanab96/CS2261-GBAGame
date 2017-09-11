# 1 "StateFunctions.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "StateFunctions.c"
# 1 "myLib.h" 1



typedef unsigned short u16;
# 40 "myLib.h"
extern unsigned short *videoBuffer;

extern unsigned short *frontBuffer;
extern unsigned short *backBuffer;



void setPixel3(int row, int col, unsigned short color);
void drawRect3(int row, int col, int height, int width, unsigned short color);
void fillScreen3(unsigned short color);
void drawImage3(const unsigned short* image, int row, int col, int height, int width);


void setPixel4(int row, int col, unsigned char colorIndex);
void drawRect4(int row, int col, int height, int width, unsigned char colorIndex);
void fillScreen4(unsigned char color);

void drawBackgroundImage4(const unsigned short* image);
void drawImage4(const unsigned short* image, int row, int col, int height, int width);

void loadPalette(const unsigned short* palette);

void waitForVblank();
void flipPage();

void loadMap(const unsigned short * map, unsigned short mapLen, unsigned short palIndex, unsigned short sbb);
# 83 "myLib.h"
extern unsigned int oldButtons;
extern unsigned int buttons;
# 93 "myLib.h"
void DMANow(int channel, volatile const void* source, volatile const void* destination, unsigned int control);






typedef volatile struct
{
        volatile const void *src;
        volatile const void *dst;
        volatile unsigned int cnt;
} DMA;

extern DMA *dma;
# 133 "myLib.h"
typedef struct { u16 tileimg[8192]; } charblock;
typedef struct { u16 tilemap[1024]; } screenblock;
# 192 "myLib.h"
typedef struct{
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
    unsigned short fill;
}OBJ_ATTR;
# 287 "myLib.h"
typedef struct
{
 int row;
 int oldRow;
 int col;
 int bigRow;
 int bigCol;
 int racc;
 int rdel;
 int cdel;
 int width;
 int height;
 int aniCounter;
 int aniState;
 int prevAniState;
 int frameDirection;
    int currFrame;
    int hFlip;
    int hide;
    int destroyed;
} SPRITE;

typedef struct{
    const unsigned char* data;
    int length;
    int frequency;
    int isPlaying;
    int loops;
    int duration;
    int priority;
    int vbCount;
}SOUND;
# 2 "StateFunctions.c" 2
# 1 "stateFunctions.h" 1

void updateStart();
void updateGame();
void story1();
void updatePause();
void instructions();
void win();
void lose();
# 3 "StateFunctions.c" 2
# 1 "Story1.h" 1
# 22 "Story1.h"
extern const unsigned short Story1Tiles[19104];


extern const unsigned short Story1Map[1024];


extern const unsigned short Story1Pal[256];
# 4 "StateFunctions.c" 2
# 1 "Instructions.h" 1
# 22 "Instructions.h"
extern const unsigned short InstructionsTiles[19104];


extern const unsigned short InstructionsMap[1024];


extern const unsigned short InstructionsPal[256];
# 5 "StateFunctions.c" 2
# 1 "CollisionMap.h" 1
# 20 "CollisionMap.h"
extern const unsigned short CollisionMapBitmap[131072];
# 6 "StateFunctions.c" 2
# 1 "WinScreen.h" 1
# 22 "WinScreen.h"
extern const unsigned short WinScreenTiles[16480];


extern const unsigned short WinScreenMap[1024];


extern const unsigned short WinScreenPal[256];
# 7 "StateFunctions.c" 2
# 1 "LoseScreen.h" 1
# 22 "LoseScreen.h"
extern const unsigned short LoseScreenTiles[17728];


extern const unsigned short LoseScreenMap[1024];


extern const unsigned short LoseScreenPal[256];
# 8 "StateFunctions.c" 2
# 1 "sound.h" 1

void setupSounds();
void playSoundA();
void playSoundB();
void pauseSound();
void unPauseSound();
void stopSounds();
void interruptHandler();
void setupInterrupts();
# 9 "StateFunctions.c" 2
# 1 "GameSound.h" 1
# 20 "GameSound.h"
extern const unsigned char GameSound[483115];
# 10 "StateFunctions.c" 2

extern enum{START, STORY1, INSTRUCTIONS, GAME, PAUSE, LOSE, WIN};
extern enum {POOHLEFT, POOHRIGHT, POOHIDLE};
extern int state;
extern int cheatState;
extern OBJ_ATTR shadowOAM[128];
extern SPRITE pooh;
extern int hOff;
extern int vOff;


void story1()
{
 *(unsigned short *)0x4000000 = 0 | (1<<9);
 *(volatile unsigned short*)0x400000A = 0 << 2 | 23 << 8 | 0<<14 | 1 << 7;

 loadPalette(Story1Pal);
    DMANow(3, Story1Map, &((screenblock *)0x6000000)[23], 2048/2);
    DMANow(3, Story1Tiles, &((charblock *)0x6000000)[0], 38208/2);

    *(volatile unsigned short *)0x04000014 = 0;
 *(volatile unsigned short *)0x04000016 = 0;

 if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3)))))
 {
  state = INSTRUCTIONS;

 }
}


void instructions()
{
 *(unsigned short *)0x4000000 = 0 | (1<<9);
 *(volatile unsigned short*)0x400000A = 0 << 2 | 25 << 8 | 0<<14 | 1 << 7;

 loadPalette(InstructionsPal);
    DMANow(3, InstructionsMap, &((screenblock *)0x6000000)[25], 2048/2);
    DMANow(3, InstructionsTiles, &((charblock *)0x6000000)[0], 38208/2);
    *(volatile unsigned short *)0x04000014 = 0;
 *(volatile unsigned short *)0x04000016 = 0;

 if ((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0)))))
 {
  cheatState++;
 }

 if ((!(~(oldButtons)&((1<<1))) && (~buttons & ((1<<1)))) ||
  (!(~(oldButtons)&((1<<2))) && (~buttons & ((1<<2)))) ||
  (!(~(oldButtons)&((1<<4))) && (~buttons & ((1<<4)))) ||
  (!(~(oldButtons)&((1<<5))) && (~buttons & ((1<<5)))) ||
  (!(~(oldButtons)&((1<<6))) && (~buttons & ((1<<6)))) ||
  (!(~(oldButtons)&((1<<7))) && (~buttons & ((1<<7)))) ||
  (!(~(oldButtons)&((1<<8))) && (~buttons & ((1<<8)))) ||
  (!(~(oldButtons)&((1<<9))) && (~buttons & ((1<<9)))))
 {
  cheatState = 0;
 }


    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3)))))
    {

     state = GAME;
     initGame();
     initPlayer();
     initHoneyPots();
     initBees();
     stopSound();
  playSoundA(GameSound, 483115, 11025, 1);
    }

}


void updateGame()
{

 if((!(~(oldButtons)&((1<<2))) && (~buttons & ((1<<2)))))
 {
  initPause();
 }

 *(volatile unsigned short *)0x04000014 = hOff;
 *(volatile unsigned short *)0x04000016 = vOff;

 updatePlayer();
 updatePots();
 updateBees();
 honeyPotCollision();
 if (cheatState != 4) {
  beeCollision();
 }
 updateOAM();
 DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);

 waitForVblank();

}

void updateStart()
{

    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3)))))
    {
     state = STORY1;
    }

    waitForVblank();

}

void updatePause()
{
 if((!(~(oldButtons)&((1<<2))) && (~buttons & ((1<<2)))))
 {
  state = GAME;
  initGame();
  unpauseSound();
 }

 if((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3)))))
 {
  initStart();
 }
 waitForVblank();
}


void updatePlayer()
{
 pooh.oldRow = pooh.row;
 pooh.rdel += pooh.racc;

    if (pooh.aniState != POOHIDLE)
    {
     pooh.prevAniState = pooh.aniState;
    }

    pooh.aniState = POOHIDLE;

    if (pooh.aniCounter % 10 == 0)
    {
  pooh.aniCounter = 0;

  if (pooh.currFrame == 8)
  {
   pooh.currFrame = 0;
  }
  else
  {
   pooh.currFrame++;
  }
    }

    if((~(*(volatile unsigned int *)0x04000130) & ((1<<5))))
 {
  pooh.aniState = POOHLEFT;
# 180 "StateFunctions.c"
  if (pooh.bigCol > 80) {
   hOff--;
   pooh.bigCol--;
  }

 }

 if((~(*(volatile unsigned int *)0x04000130) & ((1<<4))))
 {
  pooh.aniState = POOHRIGHT;
# 202 "StateFunctions.c"
  hOff++;
  pooh.bigCol++;
 }

 if ((!(~(oldButtons)&((1<<6))) && (~buttons & ((1<<6)))))
 {

  pooh.rdel = -10;

 }


 if (pooh.rdel >= 0)
 {
  if (CollisionMapBitmap[((pooh.row + pooh.height)*(512)+(pooh.bigCol + 1))] == 0 ||
    CollisionMapBitmap[((pooh.row + pooh.height)*(512)+(pooh.bigCol + pooh.width + 1))] == 0) {

      pooh.rdel = 0;
     }
 }

 pooh.row += pooh.rdel;

 if (pooh.row > 130)
 {
  pooh.row = 130;
 }
 if (pooh.row < 0)
 {
  pooh.row = 0;
 }

    if(pooh.aniState == POOHIDLE)
 {
        pooh.currFrame = 0;
 }
    else
 {
        pooh.aniCounter++;
 }

}

void win()
{
 *(unsigned short *)0x4000000 = 0 | (1<<9);
 *(volatile unsigned short*)0x400000A = 0 << 2 | 25 << 8 | 0<<14 | 1 << 7;

 loadPalette(WinScreenPal);
    DMANow(3, WinScreenMap, &((screenblock *)0x6000000)[25], 2048/2);
    DMANow(3, WinScreenTiles, &((charblock *)0x6000000)[0], 32960/2);
    *(volatile unsigned short *)0x04000016 = 0;
    *(volatile unsigned short *)0x04000014 = 0;


    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3)))))
    {
     initStart();
     state = START;

    }
}

void lose()
{
 *(unsigned short *)0x4000000 = 0 | (1<<9);
 *(volatile unsigned short*)0x400000A = 0 << 2 | 25 << 8 | 0<<14 | 1 << 7;
 loadPalette(LoseScreenPal);
    DMANow(3, LoseScreenMap, &((screenblock *)0x6000000)[25], 2048/2);
    DMANow(3, LoseScreenTiles, &((charblock *)0x6000000)[0], 35456/2);
    *(volatile unsigned short *)0x04000016 = 0;
    *(volatile unsigned short *)0x04000014 = 0;

    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3)))))
    {
     initStart();
     state = START;

    }
}
