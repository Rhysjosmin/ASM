<h1>For 32 BIT</h1>


```asm
nasm -f elf32 -o Programm.o Conversion.asm
ld -m elf_i386 -o Programm Programm.o
./Programm
```


<h1>For 64 BIT</h1><br>

```asm
nasm -f elf64 exp5.asm
ld -o Programm exp5.o
./Programm
```
