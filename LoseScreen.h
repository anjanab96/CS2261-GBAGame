
//{{BLOCK(LoseScreen)

//======================================================================
//
//	LoseScreen, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 554 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 35456 + 2048 = 38016
//
//	Time-stamp: 2016-12-12, 00:12:30
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_LOSESCREEN_H
#define GRIT_LOSESCREEN_H

#define LoseScreenTilesLen 35456
extern const unsigned short LoseScreenTiles[17728];

#define LoseScreenMapLen 2048
extern const unsigned short LoseScreenMap[1024];

#define LoseScreenPalLen 512
extern const unsigned short LoseScreenPal[256];

#endif // GRIT_LOSESCREEN_H

//}}BLOCK(LoseScreen)
