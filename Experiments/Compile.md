<h1>For 32 BIT</h1>


```asm
nasm -f elf32 -o Conversion.o Conversion.asm
ld -m elf_i386 -o Conversion Conversion.o
./Conversion
```


<h1>For 64 BIT</h1><br>

```asm
nasm -f elf64 Conversion.asm
ld -o Conversion Conversion.o
./Conversion
```
