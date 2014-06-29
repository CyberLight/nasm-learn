nasm -f elf print_hello_use_macro.asm
ld -m elf_i386 print_hello_use_macro.o -o print_hello_use_macro
