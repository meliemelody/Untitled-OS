@ECHO OFF

echo Compiler
echo     

C:\i686-elf-tools-windows\bin\i686-elf-as.exe kernel/boot.s -o kernel/boot.o

C:\i686-elf-tools-windows\bin\i686-elf-gcc.exe -c kernel/kernel.c -o kernel/kernel.o -std=gnu99 -ffreestanding -O2 -Wall -Wextra
C:\i686-elf-tools-windows\bin\i686-elf-gcc.exe -T linker.ld -o isodir/boot/fakyoy.bin -ffreestanding -O2 -nostdlib kernel/boot.o kernel/kernel.o -lgcc

C:\i686-elf-tools-windows\grub\grub-file.exe --is-x86-multiboot isodir/boot/fakyoy.bin

C:\i686-elf-tools-windows\qemu\qemu-system-i386.exe -kernel isodir/boot/fakyoy.bin
