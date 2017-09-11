#include "game.h"
#include "myLib.h"
#include "WinSound.h"
#include "LoseSound.h"
#include "HoneyPotSound.h"


extern SPRITE pooh;
extern SPRITE honeypots[];
extern SPRITE bees[];
extern enum {POOHLEFT, POOHRIGHT, POOHIDLE};
extern enum {START, STORY1, INSTRUCTIONS, GAME, PAUSE, LOSE, WIN};
extern int state; 
extern int points;

//initializes all pooh bear variables 
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

//initializes honey pot variables 
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

//initializes bee variables 
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
	/*bees[2].row = 100;
	bees[2].col = 240;
	bees[2].cdel = 3;
	bees[3].row = 75;
	bees[3].col = 240;
	bees[3].cdel = 4;*/
}

//Checks for player and honey pot collisions. Increments points based on collisions. 
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
				playSoundB(HoneyPotSound,HONEYPOTSOUNDLEN,HONEYPOTSOUNDFREQ, 0);
				points++;
				honeypots[i].destroyed = 1;
			}
		}
	}

	if (points >= 4) {
		state = WIN;
		stopSound(); 
    	playSoundB(WinSound, WINSOUNDLEN, WINSOUNDFREQ, 0);
	}				
}

//checks for player and bee collision. Moves to lose state if collision is detected. 
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
    			playSoundB(LoseSound, LOSESOUNDLEN, LOSESOUNDFREQ, 0);
			}
		}
}
