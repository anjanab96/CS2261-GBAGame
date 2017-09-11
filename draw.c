#include "myLib.h"
#include "draw.h"

extern OBJ_ATTR shadowOAM[];
extern SPRITE pooh;
extern SPRITE honeypots[];
extern SPRITE bees[];

void hideSprites()
{
    int i;for(i = 0; i < 128; i++)
    {
         shadowOAM[i].attr0 = ATTR0_HIDE;
    }
}

void updateOAM()
{
	//pooh bear
	shadowOAM[0].attr0 = pooh.row | ATTR0_4BPP | ATTR0_TALL;
	shadowOAM[0].attr1 = pooh.col | ATTR1_SIZE32 | pooh.hFlip;
	shadowOAM[0].attr2 = SPRITEOFFSET16(4*pooh.prevAniState,2*pooh.currFrame);

	//honey pots 
	for (int i = 0; i < 4; i++)
	{
		if (!honeypots[i].hide && !honeypots[i].destroyed) 
		{
			shadowOAM[i + 1].attr0 = honeypots[i].row | ATTR0_4BPP;
			shadowOAM[i + 1].attr1 = honeypots[i].col | ATTR1_SIZE16;
			shadowOAM[i + 1].attr2 = SPRITEOFFSET16(12,0);
		} else {
			shadowOAM[i + 1].attr0 = ATTR0_HIDE;
		}
	}

	//bees 
	for (int i = 0; i < 2; i++)
	{
		if (!bees[i].hide && !bees[i].destroyed) 
		{
			shadowOAM[i + 5].attr0 = bees[i].row | ATTR0_4BPP;
			shadowOAM[i + 5].attr1 = bees[i].col | ATTR1_SIZE16;
			shadowOAM[i + 5].attr2 = SPRITEOFFSET16(16,0);
		} else {
			shadowOAM[i + 5].attr0 = ATTR0_HIDE;
		}
	}
}

//moves the honey pots based on background movement, displays only the honey pots that are visible on the gameboy screen
void updatePots()
{
	if (BUTTON_HELD(BUTTON_LEFT))
	{
		if (pooh.bigCol > 80)
		{
			for (int i = 0; i < 4; i++) {
				honeypots[i].col++;
			}
		}
	}
	if (BUTTON_HELD(BUTTON_RIGHT))
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

//responsible for bee movement 
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