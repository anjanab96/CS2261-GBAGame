
//{{BLOCK(StartScreen)

//======================================================================
//
//	StartScreen, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 574 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 36736 + 2048 = 39296
//
//	Time-stamp: 2016-12-11, 18:12:36
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_STARTSCREEN_H
#define GRIT_STARTSCREEN_H

#define StartScreenTilesLen 36736
extern const unsigned short StartScreenTiles[18368];

#define StartScreenMapLen 2048
extern const unsigned short StartScreenMap[1024];

#define StartScreenPalLen 512
extern const unsigned short StartScreenPal[256];

#endif // GRIT_STARTSCREEN_H

//}}BLOCK(StartScreen)
