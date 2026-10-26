# Alle C-Dateien und die zugehörigen Objektdateien.
SOURCES := $(wildcard *.c)
OBJECTS := $(SOURCES:.c=.o)

# Warnungen, Debug-Informationen und Laufzeitprüfungen (Aufgabe 4).
CFLAGS := -g -Wall -Wextra -fsanitize=address,undefined
LDFLAGS := -g -Wall -Wextra -fsanitize=address,undefined

# Erstes Ziel: alle Objektdateien zum Demo-Programm linken.
demo: $(OBJECTS)
	clang $(LDFLAGS) $(OBJECTS) -o demo

# Jede C-Datei übersetzen; bei Headeränderungen erneut übersetzen.
# $< ist die C-Datei, $@ die zu erzeugende Objektdatei.
%.o: %.c $(wildcard *.h)
	clang $(CFLAGS) -c $< -o $@
