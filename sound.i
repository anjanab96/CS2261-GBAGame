# 1 "sound.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "sound.c"
# 1 "sound.h" 1

void setupSounds();
void playSoundA();
void playSoundB();
void pauseSound();
void unPauseSound();
void stopSounds();
void interruptHandler();
void setupInterrupts();
# 2 "sound.c" 2
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
# 3 "sound.c" 2

extern SOUND soundA;
extern SOUND soundB;


void setupSounds()
{
    *(volatile u16 *)0x04000084 = (1<<7);

    *(volatile u16*)0x04000082 = (1<<1) |
                     (1<<2) |
                     (3<<8) |
                     (0<<10) |
                     (1<<11) |
                     (1<<3) |
                     (3<<12) |
                     (1<<14) |
                     (1<<15);

    *(u16*)0x04000080 = 0;
}

void playSoundA(const unsigned char* sound, int length, int frequency, int loops) {

        dma[1].cnt = 0;

        int ticks = (16777216)/frequency;

        DMANow(1, sound, (u16*)0x040000A0, (2 << 21) | (3 << 28) | (1 << 25) | (1 << 26));

        *(volatile unsigned short*)0x4000102 = 0;

        *(volatile unsigned short*)0x4000100 = -ticks;
        *(volatile unsigned short*)0x4000102 = (1<<7);



        soundA.data = sound;
        soundA.vbCount = 0;
        soundA.duration = (((59.727) * length)/frequency);
        soundA.loops = loops;
        soundA.isPlaying = 1;
}


void playSoundB( const unsigned char* sound, int length, int frequency, int loops) {

        dma[2].cnt = 0;

        int ticks = (16777216)/frequency;

        DMANow(2, sound, (u16*)0x040000A4, (2 << 21) | (3 << 28) | (1 << 25) | (1 << 26));

        *(volatile unsigned short*)0x4000106 = 0;

        *(volatile unsigned short*)0x4000104 = -ticks;
        *(volatile unsigned short*)0x4000106 = (1<<7);



        soundB.data = sound;
        soundB.vbCount = 0;
        soundB.duration = (((59.727) * length)/frequency);
        soundB.loops = loops;
        soundB.isPlaying = 1;

}

void pauseSound()
{

    soundA.isPlaying = 0;
    soundB.isPlaying = 0;
    *(volatile unsigned short*)0x4000102 = 0;
    *(volatile unsigned short*)0x4000106 = 0;


}

void unpauseSound()
{

    soundA.isPlaying = 1;
    soundB.isPlaying = 1;
    *(volatile unsigned short*)0x4000102 = (1<<7);
    *(volatile unsigned short*)0x4000106 = (1<<7);


}

void stopSound()
{

    dma[1].cnt = 0;
    dma[2].cnt = 0;
    soundA.isPlaying = 0;
    soundB.isPlaying = 0;
    *(volatile unsigned short*)0x4000102 = 0;
    *(volatile unsigned short*)0x4000106 = 0;

}

void setupInterrupts()
{
    *(unsigned short*)0x4000208 = 0;



    *(unsigned int*)0x3007FFC = (unsigned int) interruptHandler;

    *(unsigned short*)0x4000200 |= 1 << 0;
    *(unsigned short*)0x4000004 |= 1 << 3;
    *(unsigned short*)0x4000208 = 1;
}

void interruptHandler()
{
    *(unsigned short*)0x4000208 = 0;
    if(*(volatile unsigned short*)0x4000202 & 1 << 0)
    {


        if(soundA.isPlaying)
        {
            soundA.vbCount++;
            if(soundA.vbCount >= soundA.duration)
            {
                if(soundA.loops)
                {
                    playSoundA(soundA.data, soundA.length, soundA.frequency, soundA.loops);
                } else {
                    dma[1].cnt = 0;
                    soundA.isPlaying = 0;
                    *(volatile unsigned short*)0x4000102 = 0;
                }
            }
        }

        if(soundB.isPlaying)
        {
            soundB.vbCount++;
            if(soundB.vbCount >= soundB.duration)
            {
                if(soundB.loops)
                {
                    playSoundB(soundB.data, soundB.length, soundB.frequency, soundB.loops);
                } else {
                    dma[2].cnt = 0;
                    soundB.isPlaying = 0;
                    *(volatile unsigned short*)0x4000106 = 0;
                }
            }
        }


        *(volatile unsigned short*)0x4000202 = 1 << 0;
    }

    *(unsigned short*)0x4000208 = 1;
}
