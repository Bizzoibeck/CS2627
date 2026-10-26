#include "mystring.h" 

size_t mystrlen(char *str){
  int i=0;
  while (str[i] !=0){
    i++;
  } 
  return i;
}


char *mystrcpy(char* dest, const char *src){
  int i =0;
  while (src[i]!=0){
    dest[i]=src[i];
    i++; 
  }
  dest[i]=0;
  return dest;
  
  
}

char *mystrcat(char* dest, const char *src){
  int start = mystrlen(dest);
  int i =0;
  while(src[i]!=0){
    dest[start+i]=src[i];
    i++;
  }
  dest[start +i]=0;
  return dest;
}

int mystrcmp(const char *s1, const char *s2){
  int i = 0;
  while (1){
    if(s1[i]==0 && s2[i]==0){return 0;}
    if(s1[i]==0){return -1;}
    if(s2[i]==0){return 1;} 
    int diff = (unsigned char)s1[i]-(unsigned char)s2[i];
    if(diff!=0){return diff;}
    i++;
  }
}

