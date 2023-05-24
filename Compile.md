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


# Far Procedure Compile 

```asm
nasm -f elf64 file1.asm
nasm -f elf64 file2.asm

ld file1.o file2.o -o file
./file
```


to include
```asm

%include "macro.asm"

```


to export
```asm

global far_proc

```

to import
```asm

extern far_proc

```


