#include <stdio.h>

int main() {
  FILE *file;
  file = fopen("/etc/ctfconf", "r");
  char ch;
  printf("\nHere's your flag: ");
  while ((ch = fgetc(file)) != EOF) {
    printf("%c", ch);
  }
  fclose(file);
}
