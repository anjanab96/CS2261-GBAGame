
//{{BLOCK(Instructions)

//======================================================================
//
//	Instructions, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 597 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 38208 + 2048 = 40768
//
//	Time-stamp: 2016-12-11, 19:23:20
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_INSTRUCTIONS_H
#define GRIT_INSTRUCTIONS_H

#define InstructionsTilesLen 38208
extern const unsigned short InstructionsTiles[19104];

#define InstructionsMapLen 2048
extern const unsigned short InstructionsMap[1024];

#define InstructionsPalLen 512
extern const unsigned short InstructionsPal[256];

#endif // GRIT_INSTRUCTIONS_H

//}}BLOCK(Instructions)
