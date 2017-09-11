# 1 "draw.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "draw.c"
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
# 2 "draw.c" 2
# 1 "draw.h" 1

void updateOAM();
void hideSprites();
void updateBees();
void updatePots();
# 3 "draw.c" 2

extern OBJ_ATTR shadowOAM[];
extern SPRITE pooh;
extern SPRITE honeypots[];
extern SPRITE bees[];

void hideSprites()
{
    int i;for(i = 0; i < 128; i++)
    {
         shadowOAM[i].attr0 = (2 << 8);
    }
}

void updateOAM()
{

 shadowOAM[0].attr0 = pooh.row | (0 << 13) | (2 << 14);
 shadowOAM[0].attr1 = pooh.col | (2 << 14) | pooh.hFlip;
 shadowOAM[0].attr2 = (4*pooh.prevAniState)*32+(2*pooh.currFrame);


 for (int i = 0; i < 4; i++)
 {
  if (!honeypots[i].hide && !honeypots[i].destroyed)
  {
   shadowOAM[i + 1].attr0 = honeypots[i].row | (0 << 13);
   shadowOAM[i + 1].attr1 = honeypots[i].col | (1 << 14);
   shadowOAM[i + 1].attr2 = (12)*32+(0);
  } else {
   shadowOAM[i + 1].attr0 = (2 << 8);
  }
 }


 for (int i = 0; i < 2; i++)
 {
  if (!bees[i].hide && !bees[i].destroyed)
  {
   shadowOAM[i + 5].attr0 = bees[i].row | (0 << 13);
   shadowOAM[i + 5].attr1 = bees[i].col | (1 << 14);
   shadowOAM[i + 5].attr2 = (16)*32+(0);
  } else {
   shadowOAM[i + 5].attr0 = (2 << 8);
  }
 }
}


void updatePots()
{
 if ((~(*(volatile unsigned int *)0x04000130) & ((1<<5))))
 {
  if (pooh.bigCol > 80)
  {
   for (int i = 0; i < 4; i++) {
    honeypots[i].col++;
   }
  }
 }
 if ((~(*(volatile unsigned int *)0x04000130) & ((1<<4))))
 {
  for (int i = 0; i < 4; i++) {
   honeypots[i].col--;
  }
 }

 for (int i = 0; i < 4; i++) {
  if (honeypots[i].col <= 0 || honeypots[i].col >= 240) {
   honeypots[i].hide = 1;
  } else {
   honeypots[i].hide = 0;
  }
 }
}


void updateBees()
{
 for (int i = 0; i < 2; i++) {
  bees[i].col -= bees[i].cdel;
  if (bees[i].col < 0)
  {
   bees[i].col = 240;
   bees[i].row = rand() % (160 - bees[i].height);
   bees[i].cdel = rand() % 3 + 1;
  }
 }
}
