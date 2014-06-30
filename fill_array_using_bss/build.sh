nasm -f elf fill_array_using_bss.asm
ld -m elf_i386 fill_array_using_bss.o -o fill_array_using_bss
