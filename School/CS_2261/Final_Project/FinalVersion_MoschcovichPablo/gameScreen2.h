
//{{BLOCK(gameScreen2)

//======================================================================
//
//	gameScreen2, 1024x256@4, 
//	+ palette 256 entries, not compressed
//	+ 8 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 128x32 
//	Total size: 512 + 256 + 8192 = 8960
//
//	Time-stamp: 2022-05-01, 16:55:09
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_GAMESCREEN2_H
#define GRIT_GAMESCREEN2_H

#define gameScreen2TilesLen 256
extern const unsigned short gameScreen2Tiles[128];

#define gameScreen2MapLen 8192
extern const unsigned short gameScreen2Map[4096];

#define gameScreen2PalLen 512
extern const unsigned short gameScreen2Pal[256];

#endif // GRIT_GAMESCREEN2_H

//}}BLOCK(gameScreen2)
