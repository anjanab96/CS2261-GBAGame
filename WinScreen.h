
//{{BLOCK(WinScreen)

//======================================================================
//
//	WinScreen, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 515 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 32960 + 2048 = 35520
//
//	Time-stamp: 2016-12-12, 00:02:04
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_WINSCREEN_H
#define GRIT_WINSCREEN_H

#define WinScreenTilesLen 32960
extern const unsigned short WinScreenTiles[16480];

#define WinScreenMapLen 2048
extern const unsigned short WinScreenMap[1024];

#define WinScreenPalLen 512
extern const unsigned short WinScreenPal[256];

#endif // GRIT_WINSCREEN_H

//}}BLOCK(WinScreen)
