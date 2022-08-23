@ECHO OFF

set directory=C:\i686-elf-tools-windows

echo Compiler
echo     

%directory%\bin\i686-elf-as.exe kernel/boot.s -o kernel/boot.o

%directory%\bin\i686-elf-gcc.exe -c kernel/kernel.c -o kernel/kernel.o -std=gnu99 -ffreestanding -O2 -Wall -Wextra
%directory%\bin\i686-elf-gcc.exe -T linker.ld -o isodir/boot/fakyoy.bin -ffreestanding -O2 -nostdlib kernel/boot.o kernel/kernel.o -lgcc

%directory%\grub\grub-file.exe --is-x86-multiboot isodir/boot/fakyoy.bin

%directory%\qemu\qemu-system-i386.exe -kernel isodir/boot/fakyoy.bin
