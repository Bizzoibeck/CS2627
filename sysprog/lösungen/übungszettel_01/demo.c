#include <assert.h>
#include <stdio.h>
#include <string.h>

#include "mystring.h"

/* Mehrere Testblöcke können gleichzeitig aktiv sein und laufen nacheinander.
 * Zum Aktivieren die Überschrift in einen //-Kommentar umwandeln
 * und das zugehörige abschließende Blockkommentarzeichen entfernen.
 * assert prüft die Bedingung und bricht bei einem Fehler mit Zeilenangabe ab.
 * Die Standardfunktionen dienen hier nur zum Prüfen der eigenen Funktionen.
 * Keine NULL-Zeiger, zu kleinen Zielpuffer oder überlappenden Speicherbereiche:
 * Solche Aufrufe wären außerhalb der Voraussetzungen dieser Funktionen.
 * Für mymemcpy und mymemset zuerst die Deklarationen in mystring.h ergänzen.
 */
int main(void)
{
    // Test: mystrlen
    {
        char empty[] = "";
        char single[] = "a";
        char text[] = "Hallo Welt!";
        char embedded[] = {'a', 'b', '\0', 'c', '\0'};
        char long_text[1025];
        memset(long_text, 'x', sizeof long_text - 1);
        long_text[sizeof long_text - 1] = '\0';

        assert(mystrlen(empty) == 0);
        assert(mystrlen(single) == 1);
        assert(mystrlen(text) == 11);
        assert(mystrlen(embedded) == 2);
        assert(mystrlen(long_text) == 1024);
        puts("mystrlen: OK");
    }
   

    // Test: mystrcpy
    {
        char dest[16];
        char src[] = "Hallo";
        char embedded[] = {'a', '\0', 'b', '\0'};
        char exact[4];

        memset(dest, '#', sizeof dest);
        assert(mystrcpy(dest, src) == dest);
        assert(memcmp(dest, "Hallo", 6) == 0);
        assert(dest[6] == '#');
        assert(strcmp(src, "Hallo") == 0);

        assert(mystrcpy(dest, "") == dest);
        assert(dest[0] == '\0');
        assert(dest[1] == 'a');

        memset(dest, '#', sizeof dest);
        assert(mystrcpy(dest, embedded) == dest);
        assert(dest[0] == 'a' && dest[1] == '\0');
        assert(dest[2] == '#');

        assert(mystrcpy(exact, "abc") == exact);
        assert(memcmp(exact, "abc", sizeof exact) == 0);
        puts("mystrcpy: OK");
    }
   

    // Test: mystrcat
    {
        char dest[16] = "Hallo";
        char src[] = " Welt";
        char empty_dest[4] = "";
        char exact[5] = "ab";
        char embedded[] = {'x', '\0', 'y', '\0'};
        char stopped[8] = {'a', '\0', '#', '#', '#', '#', '#', '#'};

        assert(mystrcat(dest, src) == dest);
        assert(strcmp(dest, "Hallo Welt") == 0);
        assert(strcmp(src, " Welt") == 0);
        assert(mystrcat(dest, "") == dest);
        assert(strcmp(dest, "Hallo Welt") == 0);

        assert(mystrcat(empty_dest, "") == empty_dest);
        assert(empty_dest[0] == '\0');
        assert(mystrcat(empty_dest, "abc") == empty_dest);
        assert(strcmp(empty_dest, "abc") == 0);

        assert(mystrcat(exact, "cd") == exact);
        assert(memcmp(exact, "abcd", sizeof exact) == 0);

        assert(mystrcat(stopped, embedded) == stopped);
        assert(memcmp(stopped, "ax", 3) == 0);
        assert(stopped[3] == '#');
        puts("mystrcat: OK");
    }
   

    // Test: mystrcmp
    {
        char high[] = {(char)0x80, '\0'};
        char low[] = {(char)0x7f, '\0'};
        char a[] = {'a', '\0', 'x', '\0'};
        char b[] = {'a', '\0', 'y', '\0'};

        // Nur das Vorzeichen zählt, nicht ein bestimmter Rückgabewert!
        assert(mystrcmp("", "") == 0);
        assert(mystrcmp("abc", "abc") == 0);
        assert(mystrcmp("", "a") < 0);
        assert(mystrcmp("a", "") > 0);
        assert(mystrcmp("abc", "abcd") < 0);
        assert(mystrcmp("abcd", "abc") > 0);
        assert(mystrcmp("abc", "abd") < 0);
        assert(mystrcmp("abd", "abc") > 0);
        assert(mystrcmp("z", "aaa") > 0);
        assert(mystrcmp(a, b) == 0);
        assert(mystrcmp(high, low) > 0);
        assert(mystrcmp(low, high) < 0);
        puts("mystrcmp: OK");
    }
   

    /* Test: mymemcpy
    {
        unsigned char src[] = {0x00, 0x80, 0xff, 0x42};
        unsigned char dest[6];
        unsigned char exact[4];
        unsigned char expected[] = {0x55, 0x00, 0x80, 0xff, 0x42, 0x55};

        memset(dest, 0x55, sizeof dest);
        assert(mymemcpy(dest + 1, src, sizeof src) == dest + 1);
        assert(memcmp(dest, expected, sizeof dest) == 0);
        assert(src[0] == 0 && src[1] == 0x80);
        assert(src[2] == 0xff && src[3] == 0x42);

        assert(mymemcpy(exact, src, sizeof src) == exact);
        assert(memcmp(exact, src, sizeof src) == 0);

        assert(mymemcpy(dest, src, 0) == dest);
        assert(memcmp(dest, expected, sizeof dest) == 0);
        assert(mymemcpy(dest, src, 1) == dest);
        assert(dest[0] == 0 && dest[1] == 0);
        puts("mymemcpy: OK");
    }
    */

    /* Test: mymemset
    {
        unsigned char dest[6];
        unsigned char expected[] = {0x55, 0xab, 0xab, 0xab, 0xab, 0x55};
        unsigned char zeros[6] = {0};
        unsigned char ones[] = {0xff, 0xff, 0xff, 0xff, 0xff, 0xff};

        memset(dest, 0x55, sizeof dest);
        assert(mymemset(dest + 1, 0xab, 4) == dest + 1);
        assert(memcmp(dest, expected, sizeof dest) == 0);

        assert(mymemset(dest, 0, 0) == dest);
        assert(memcmp(dest, expected, sizeof dest) == 0);
        assert(mymemset(dest, 0, sizeof dest) == dest);
        assert(memcmp(dest, zeros, sizeof dest) == 0);

        assert(mymemset(dest, -1, sizeof dest) == dest);
        assert(memcmp(dest, ones, sizeof dest) == 0);
        assert(mymemset(dest, 0x123, 1) == dest);
        assert(dest[0] == 0x23 && dest[1] == 0xff);
        puts("mymemset: OK");
    }
    */

    puts("Alle aktivierten Tests bestanden (ohne aktivierte Tests: keine Prüfung).");
    return 0;
}
