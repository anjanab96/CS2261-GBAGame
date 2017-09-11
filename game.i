# 1 "game.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "game.c"
# 1 "game.h" 1

void beeCollision();
void honeyPotCollision();
void initPlayer();
void initHoneyPots();
void initBees();
# 2 "game.c" 2
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
# 3 "game.c" 2
# 1 "WinSound.h" 1
# 20 "WinSound.h"
extern const unsigned char WinSound[18202];
# 4 "game.c" 2
# 1 "LoseSound.h" 1
# 20 "LoseSound.h"
extern const unsigned char LoseSound[13035];
# 5 "game.c" 2
# 1 "HoneyPotSound.h" 1
# 20 "HoneyPotSound.h"
extern const unsigned char HoneyPotSound[11758];
# 6 "game.c" 2


extern SPRITE pooh;
extern SPRITE honeypots[];
extern SPRITE bees[];
extern enum {POOHLEFT, POOHRIGHT, POOHIDLE};
extern enum {START, STORY1, INSTRUCTIONS, GAME, PAUSE, LOSE, WIN};
extern int state;
extern int points;


void initPlayer()
{
 hideSprites();
 pooh.width = 16;
 pooh.height = 32;
 pooh.rdel = 0;
 pooh.cdel = 1;
 pooh.row = 130;
 pooh.col = 120;
 pooh.bigRow = 130;
 pooh.bigCol = 120;
 pooh.racc = 1;
 pooh.aniCounter = 0;
 pooh.currFrame = 0;
 pooh.aniState = POOHRIGHT;

}


void initHoneyPots()
{

 for (int i = 0; i < 4; i++)
 {
  honeypots[i].height = 16;
  honeypots[i].width = 16;
  honeypots[i].hide = 0;
  honeypots[i].destroyed = 0;
 }

 honeypots[0].row = 104;
 honeypots[0].col = 90;

 honeypots[1].row = 54;
 honeypots[1].col = 84;

 honeypots[2].row = 74;
 honeypots[2].col = 205;

 honeypots[3].row = 34;
 honeypots[3].col = 320;

}


void initBees()
{
 for (int i = 0; i < 2; i++)
 {
  bees[i].height = 16;
  bees[i].width = 16;
  bees[i].hide = 0;
 }

 bees[0].row = 130;
 bees[0].col = 240;
 bees[0].cdel = 1;
 bees[1].row = 84;
 bees[1].col = 240;
 bees[1].cdel = 2;






}


void honeyPotCollision()
{
 for (int i = 0; i < 4; i++)
 {
  if ((honeypots[i].col >= pooh.col && honeypots[i].col <= pooh.col + pooh.width ||
   honeypots[i].col + honeypots[i].width >= pooh.col && honeypots[i].col + honeypots[i].width <= pooh.col + pooh.width) &&
   (honeypots[i].row >= pooh.row && honeypots[i].row <= pooh.row + pooh.height ||
   honeypots[i].row + honeypots[i].height >= pooh.row && honeypots[i].row + honeypots[i].height <= pooh.row + pooh.height))
  {
   if (!honeypots[i].destroyed)
   {
    playSoundB(HoneyPotSound,11758,11025, 0);
    points++;
    honeypots[i].destroyed = 1;
   }
  }
 }

 if (points >= 4) {
  state = WIN;
  stopSound();
     playSoundB(WinSound, 18202, 11025, 0);
 }
}


void beeCollision()
{
 for (int i = 0; i < 2; i++)
  {
   if ((bees[i].col >= pooh.col && bees[i].col + 5 <= pooh.col + pooh.width ||
    bees[i].col + bees[i].width - 5 >= pooh.col && bees[i].col + bees[i].width - 5 <= pooh.col + pooh.width) &&
    (bees[i].row >= pooh.row && bees[i].row + 5 <= pooh.row + pooh.height ||
    bees[i].row + bees[i].height >= pooh.row && bees[i].row + bees[i].height <= pooh.row + pooh.height))
   {
    state = LOSE;
    stopSound();
       playSoundB(LoseSound, 13035, 11025, 0);
   }
  }
}
