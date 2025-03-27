ca65 source\main.asm -o build\main.o --debug-info -I source\ines 
ld65 build\main.o -o rom\MagicCarpet.nes -C source\config\mapper003.cfg --dbgfile  rom\MMagicCarpet.dbg