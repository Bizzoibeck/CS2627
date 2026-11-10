# Alle C-Dateien und die zugehörigen Objektdateien.
SOURCES := $(wildcard *.c)
ASM_SOURCES := $(wildcard *.S)
OBJECTS := $(SOURCES:.c=.o)
ASM_OBJECTS := $(ASM_SOURCES:.S=.o)
CC = clang
CFLAGS := -g -Wall -Wextra 
LDFLAGS := -g -Wall -Wextra 
ASMFLAGS := -f elf64 -g -F dwarf


main: $(OBJECTS) $(ASM_OBJECTS)
	$(CC) $(LDFLAGS) $(OBJECTS) $(ASM_OBJECTS) -o main
$(OBJECTS): $(SOURCES) 
	$(CC) $(CFLAGS) -c $(SOURCES) -o $(OBJECTS)
$(ASM_OBJECTS): $(ASM_SOURCES)
	nasm $(ASMFLAGS) $(ASM_SOURCES) -o $(ASM_OBJECTS) 
