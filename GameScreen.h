
//{{BLOCK(GameScreen)

//======================================================================
//
//	GameScreen, 512x256@4, 
//	+ palette 256 entries, not compressed
//	+ 604 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x32 
//	Total size: 512 + 19328 + 4096 = 23936
//
//	Time-stamp: 2016-12-12, 13:42:21
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_GAMESCREEN_H
#define GRIT_GAMESCREEN_H

#define GameScreenTilesLen 19328
extern const unsigned short GameScreenTiles[9664];

#define GameScreenMapLen 4096
extern const unsigned short GameScreenMap[2048];

#define GameScreenPalLen 512
extern const unsigned short GameScreenPal[256];

#endif // GRIT_GAMESCREEN_H

//}}BLOCK(GameScreen)
