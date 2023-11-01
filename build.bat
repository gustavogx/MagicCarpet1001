ca65 source\main.asm -o build\main.o --debug-info -I source\ines 
ld65 build\main.o -o rom\MCRemake.nes -C source\config\mapper004.cfg --dbgfile  rom\MCRemake.dbg