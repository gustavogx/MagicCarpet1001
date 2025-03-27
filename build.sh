ca65 ./source/main.asm -o ./build/main.o --debug-info -I./include
ld65 ./build/main.o -o ./rom/MagicCarpet.nes -C ./source/config/mapper003.cfg --dbgfile  ./rom/MagicCarpet.dbg
rm ./build/main.o