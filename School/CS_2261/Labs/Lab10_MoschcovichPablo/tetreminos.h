
//{{BLOCK(tetreminos)

//======================================================================
//
//	tetreminos, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 1024 tiles not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 32768 + 2048 = 35328
//
//	Time-stamp: 2021-03-22, 00:08:57
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_TETREMINOS_H
#define GRIT_TETREMINOS_H

#define tetreminosTilesLen 32768
extern const unsigned short tetreminosTiles[16384];

#define tetreminosMapLen 2048
extern const unsigned short tetreminosMap[1024];

#define tetreminosPalLen 512
extern const unsigned short tetreminosPal[256];

#endif // GRIT_TETREMINOS_H

//}}BLOCK(tetreminos)
