/*
Anjana Balamourougan 
CS 2261 FALL 2016 

GAME DESCRIPTION
----------------
This is a simple platform game where the main objective is to collect honey pots and avoid bees. 
You only have one life, so if you get hit by a bee once, you lose. Collect all 4 honey pots to win the game. Use 
left/right to move the player, and use up to jump. In the instructions screen, press A four times to enable the cheat.
The cheat disables the bee collisions, so pooh is invincible while collecting honey. 

KNOWN BUGS
----------
When the player moves left and right, the honey pots on the screen aren't updated properly, in that they don't disappear 
exactly when they reach the end of the screen. Additionally, the game is a little difficult to play because the gravity isn't 
as smooth as it could be, and the placement of the bees make it hard to play the game, but it's not impossible. Also, at 
the beginning of the game, you can't fall of the left edge of the left most platforms until you loop through the background 
once. Also, for some of the platforms, he seems to be standing a little above the platform instead of on the platform itself.

EXTRA CREDIT
-------------
I don't believe I did anything to deserve extra credit. 

*/
#include "myLib.h"
#include "StartScreen.h"
#include "GameScreen.h"
#include "PauseScreen.h"
#include "PoohBearSprites.h"
#include "FrontLayer.h"
#include "Instructions.h"
#include "CollisionMap.h"
#include "WinScreen.h"
#include "LoseScreen.h"
#include "HoneyPotSound.h"
#include "sound.h"
#include "GameSound.h"
#include "WinnieTitleSong.h"
#include "WinSound.h"
#include "LoseSound.h"
#include "Story1.h"
#include "StateFunctions.h"
#include "draw.h"

#include <time.h>
#include <stdlib.h>


unsigned int buttons;
unsigned int oldButtons;

int hOff = 0;
int vOff = 0;

OBJ_ATTR shadowOAM[128];

//SPRITES 
SPRITE pooh;
SPRITE honeypots[4];
SPRITE bees[2];

int points;

//Defines which way pooh bear faces 
enum {POOHLEFT, POOHRIGHT, POOHIDLE};

//GAME STATES
enum {START, STORY1, INSTRUCTIONS, GAME, PAUSE, LOSE, WIN};
int state;
int cheatState;

//sounds
SOUND soundA;
SOUND soundB;

#define ROWMASK 0xFF
#define COLMASK 0x1FF

//PROTOTYPES
void initGame();
void initStart();
void initPause();

int main()
{
	//Initializes start screen  
	initStart();
	//sound functions 
	setupSounds();
	setupInterrupts();	

	while(1) 
	{
		oldButtons = buttons;
		buttons = BUTTONS;

		switch(state)
		{
			case START:
			updateStart();
			break;
			case STORY1:
			story1();
			break;
			case INSTRUCTIONS:
			instructions();
			break;
			case GAME:
			updateGame();
			break;
			case PAUSE:
			updatePause();
			break;
			case WIN:
			win();
			break;
			case LOSE:
			lose();
			break;
		}
	}
	return 0;
}

//Initializes start screen background, begins playing title music, initializes vOff and hOff 
void initStart()
{
	
	hideSprites();
	REG_DISPCTL = MODE0  | BG1_ENABLE;
	REG_BG1CNT = CBB(0) | SBB(25) | BG_SIZE0 | COLOR256;
	//loads start screen palette 
	loadPalette(StartScreenPal);
	//loads start screen tiles and start screen map into appropriate charblocks/screenblocks 
    DMANow(3, StartScreenMap, &SCREENBLOCKBASE[25], StartScreenMapLen/2);
    DMANow(3, StartScreenTiles, &CHARBLOCKBASE[0], StartScreenTilesLen/2);
    REG_BG1HOFS = 0;
	REG_BG1VOFS = 0;
	hOff = 0;
	vOff = 0;
   	state = START;
   	//begins playing winnie the pooh title song 
   	playSoundA(WinnieTitleSong, WINNIETITLESONGLEN, WINNIETITLESONGFREQ, 1);
   	cheatState = 0;

}

void initGame()
{
	//set up for layered backgrounds 
	REG_DISPCTL = MODE0 | SPRITE_ENABLE | BG0_ENABLE | BG1_ENABLE;	
	REG_BG0CNT =  CBB(0) | SBB(27) | BG_SIZE0;
	REG_BG1CNT =  CBB(1) | SBB(25) | BG_SIZE1;

	//loads master palette 
	loadPalette(FrontLayerPal);
	//front layer background (the tree on the left side of the screen)
	DMANow(3, FrontLayerMap, &SCREENBLOCKBASE[27], FrontLayerMapLen/2);
	DMANow(3, FrontLayerTiles, &CHARBLOCKBASE[0], FrontLayerTilesLen/2);
	//back layer(the background forest)
	DMANow(3, GameScreenMap, &SCREENBLOCKBASE[25], GameScreenMapLen/2);
	DMANow(3, GameScreenTiles, &CHARBLOCKBASE[1], GameScreenTilesLen/2);

	//load sprites(Pooh bear, honey pots, bees)
	DMANow(3, PoohBearSpritesTiles, &CHARBLOCKBASE[4], PoohBearSpritesTilesLen/2);
    DMANow(3, PoohBearSpritesPal, SPRITE_PALETTE, PoohBearSpritesPalLen/2);

    //initializes points 
    points = 0;
    srand(time(NULL));

	hideSprites();

	state = GAME;
}

void initPause()
{
	REG_DISPCTL = MODE0 | BG0_ENABLE;	
	REG_BG0CNT =  CBB(0) | SBB(25) | BG_SIZE0;
	//load palette for pause screen
	loadPalette(PauseScreenPal);
	//load pause screen map and tiles 
    DMANow(3, PauseScreenMap, &SCREENBLOCKBASE[25], PauseScreenMapLen/2);
    DMANow(3, PauseScreenTiles, &CHARBLOCKBASE[0], PauseScreenTilesLen/2);
    //pauses game sounds
    pauseSound();

    state = PAUSE;
}






