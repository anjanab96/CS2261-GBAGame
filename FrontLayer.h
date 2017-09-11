
//{{BLOCK(FrontLayer)

//======================================================================
//
//	FrontLayer, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 296 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 9472 + 2048 = 12032
//
//	Time-stamp: 2016-12-05, 18:39:10
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_FRONTLAYER_H
#define GRIT_FRONTLAYER_H

#define FrontLayerTilesLen 9472
extern const unsigned short FrontLayerTiles[4736];

#define FrontLayerMapLen 2048
extern const unsigned short FrontLayerMap[1024];

#define FrontLayerPalLen 512
extern const unsigned short FrontLayerPal[256];

#endif // GRIT_FRONTLAYER_H

//}}BLOCK(FrontLayer)
