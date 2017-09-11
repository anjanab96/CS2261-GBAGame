#include "myLib.h"
#include "stateFunctions.h"
#include "Story1.h"
#include "Instructions.h"
#include "CollisionMap.h"
#include "WinScreen.h"
#include "LoseScreen.h"
#include "sound.h"
#include "GameSound.h"

extern enum{START, STORY1, INSTRUCTIONS, GAME, PAUSE, LOSE, WIN};
extern enum {POOHLEFT, POOHRIGHT, POOHIDLE};
extern int state; 
extern int cheatState; 
extern OBJ_ATTR shadowOAM[128];
extern SPRITE pooh; 
extern int hOff;
extern int vOff;

//loads story screen 
void story1()
{
	REG_DISPCTL = MODE0 | BG1_ENABLE;
	REG_BG1CNT = CBB(0) | SBB(23) | BG_SIZE0 | COLOR256;

	loadPalette(Story1Pal);
    DMANow(3, Story1Map, &SCREENBLOCKBASE[23], Story1MapLen/2);
    DMANow(3, Story1Tiles, &CHARBLOCKBASE[0], Story1TilesLen/2);

    REG_BG1HOFS = 0;
	REG_BG1VOFS = 0;

	if (BUTTON_PRESSED(BUTTON_START))
	{
		state = INSTRUCTIONS;
		
	}
}

//loads instructions screen. Cheat is enabled in this screen. 
void instructions() 
{
	REG_DISPCTL = MODE0 | BG1_ENABLE;
	REG_BG1CNT = CBB(0) | SBB(25) | BG_SIZE0 | COLOR256;

	loadPalette(InstructionsPal);
    DMANow(3, InstructionsMap, &SCREENBLOCKBASE[25], InstructionsMapLen/2);
    DMANow(3, InstructionsTiles, &CHARBLOCKBASE[0], InstructionsTilesLen/2);
    REG_BG1HOFS = 0;
	REG_BG1VOFS = 0;

	if (BUTTON_PRESSED(BUTTON_A))
	{
		cheatState++;
	}
	
	if (BUTTON_PRESSED(BUTTON_B) ||
		BUTTON_PRESSED(BUTTON_SELECT) ||
		BUTTON_PRESSED(BUTTON_RIGHT) ||
		BUTTON_PRESSED(BUTTON_LEFT) ||
		BUTTON_PRESSED(BUTTON_UP) ||
		BUTTON_PRESSED(BUTTON_DOWN) ||
		BUTTON_PRESSED(BUTTON_R) ||
		BUTTON_PRESSED(BUTTON_L))
	{
		cheatState = 0;
	}


    if (BUTTON_PRESSED(BUTTON_START))
    {

    	state = GAME;
    	initGame();  
    	initPlayer();
    	initHoneyPots();
    	initBees();
    	stopSound();
		playSoundA(GameSound, GAMESOUNDLEN, GAMESOUNDFREQ, 1);
    }

}

//updates game based on player movement & collisions 
void updateGame() 
{

	if(BUTTON_PRESSED(BUTTON_SELECT)) 
	{
		initPause();
	}

	REG_BG1HOFS = hOff;
	REG_BG1VOFS = vOff;
	
	updatePlayer();
	updatePots();
	updateBees();
	honeyPotCollision();
	if (cheatState != 4) {
		beeCollision();
	}
	updateOAM();
	DMANow(3, shadowOAM, OAM, 512);

	waitForVblank();
	
}

void updateStart()
{

    if (BUTTON_PRESSED(BUTTON_START))
    {
    	state = STORY1;
    }

    waitForVblank();
	
}

void updatePause()
{
	if(BUTTON_PRESSED(BUTTON_SELECT))
	{
		state = GAME;
		initGame();
		unpauseSound();
	}

	if(BUTTON_PRESSED(BUTTON_START))
	{
		initStart();
	}
	waitForVblank();
}

//Responsible for player movement 
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

    if(BUTTON_HELD(BUTTON_LEFT))
	{
		pooh.aniState = POOHLEFT;
		/*pooh.col--; 

		if (pooh.col < 22) 
		{
			pooh.col = 22;
			hOff--;

		} else {
			pooh.bigCol -= 2;
			hOff--;
		}*/

		if (pooh.bigCol > 80) {
			hOff--;
			pooh.bigCol--;
		}

	}

	if(BUTTON_HELD(BUTTON_RIGHT))
	{
		pooh.aniState = POOHRIGHT;
		/*pooh.col++;
		if (pooh.col > 120)
		{
			pooh.bigCol++;
			pooh.col = 120;
			hOff++;

		} else {
			pooh.bigCol += 2;
			hOff++;
		}*/

		hOff++;
		pooh.bigCol++;
	}

	if (BUTTON_PRESSED(BUTTON_UP)) 
	{

		pooh.rdel = -10;
		
	}


	if (pooh.rdel >= 0) 
	{
		if (CollisionMapBitmap[OFFSET(pooh.row + pooh.height, pooh.bigCol + 1, 512)] == BLACK ||
				CollisionMapBitmap[OFFSET(pooh.row + pooh.height, pooh.bigCol + pooh.width + 1, 512)] == BLACK) {
			//try find floor function 
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
//loads win screen and win music 
void win()
{
	REG_DISPCTL = MODE0 | BG1_ENABLE;
	REG_BG1CNT = CBB(0) | SBB(25) | BG_SIZE0 | COLOR256;

	loadPalette(WinScreenPal);
    DMANow(3, WinScreenMap, &SCREENBLOCKBASE[25], WinScreenMapLen/2);
    DMANow(3, WinScreenTiles, &CHARBLOCKBASE[0], WinScreenTilesLen/2);
    REG_BG1VOFS = 0; 
    REG_BG1HOFS = 0; 


    if (BUTTON_PRESSED(BUTTON_START))
    {
    	initStart();
    	state = START;
    	
    }
}
//loads lose screen and lose music 
void lose()
{
	REG_DISPCTL = MODE0 | BG1_ENABLE;
	REG_BG1CNT = CBB(0) | SBB(25) | BG_SIZE0 | COLOR256;
	loadPalette(LoseScreenPal);
    DMANow(3, LoseScreenMap, &SCREENBLOCKBASE[25], LoseScreenMapLen/2);
    DMANow(3, LoseScreenTiles, &CHARBLOCKBASE[0], LoseScreenTilesLen/2);
    REG_BG1VOFS = 0; 
    REG_BG1HOFS = 0; 
    
    if (BUTTON_PRESSED(BUTTON_START))
    {
    	initStart();
    	state = START;
    	
    }
}
