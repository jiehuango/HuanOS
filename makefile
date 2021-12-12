write_run:boot.bin kernel.bin loader.bin
	dd if=boot.bin of=/home/jiehuan/bochs/bin/a.img bs=512 count=1 conv=notrunc
	dd if=loader.bin of=/home/jiehuan/bochs/bin/a.img bs=512 count=1 seek=1 conv=notrunc
	dd if=kernel.bin of=/home/jiehuan/bochs/bin/a.img bs=512 count=1 seek=2 conv=notrunc

boot.bin:boot.asm
	nasm boot.asm -o boot.bin

kernel.bin:kernel.asm
	nasm kernel.asm -o kernel.bin

loader.bin:loader.asm
	nasm loader.asm -o loader.bin


