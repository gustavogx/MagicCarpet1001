ca65 main.asm -o main.o --debug-info -I include 
ld65 main.o -o mc-003.nes -C mapper003.cfg 
del main.o
