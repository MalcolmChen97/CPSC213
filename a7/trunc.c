#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>
#include "list.h"
#include <string.h>




void print_char (element_t ev) {
    char *str=(char*) ev;
  printf ("%s\n", str);
}
void print_num(element_t ev){
    intptr_t hehe=(intptr_t) ev;
    printf ("%ld\n", hehe);
}

void step2(element_t* out, element_t in){
    char* rawString = (char*) in;
    intptr_t* o = (intptr_t*) out;
    char* str;
    
    *o = strtol(rawString, &str, 10);
    if (*str != '\0')
        *o = -1;
}

void step4(element_t* out, element_t a1, element_t a2){
    char** o = (char**)out;
    intptr_t a = (intptr_t) a1;
    if (a <0){
        *o = (char*)a2;
    }else{
        *o = (char*)NULL;
    }
}

void step6(element_t* out, element_t intPtr, element_t strInput){
    char** o = (char**)out;
    intptr_t i = (intptr_t) intPtr;
    char* str = (char*) strInput;
    int size = i < strlen(str) ? i : strlen(str);
    *o=malloc(size*sizeof(char)+1);
    strncpy(*o,str,size);

    
}

void maxvalue (element_t* rv, element_t av, element_t bv) {
    intptr_t  a = (intptr_t)  strlen(av);
    intptr_t  b = (intptr_t)  strlen(bv);
    char* c = (char*) bv;
    char** r = (char**) rv;
    if(a<b) *r =c;
}

int isn1(element_t haha){
    intptr_t a = (intptr_t) haha;
    
    return a!=-1;

}

int notNull(element_t haha){
    char* a=(char*) haha;
    return a!=NULL;
}

/**
 * Test filter, map, foldl, and foreach on two small integer lists.
 */
int main(int argc, char** argv) {
  
  
  struct list* l0 = list_create();
  list_append_array (l0, (element_t*) argv+1, argc-1);
    
    struct list* intlist = list_create();
    list_map1(step2, intlist, l0);
    
    struct list* onlynum = list_create();
    list_filter (isn1, onlynum, intlist);

    struct list* stringlist = list_create();
    list_map2(step4, stringlist, intlist, l0);
  
    struct list* onlystring = list_create();
    list_filter (notNull, onlystring, stringlist);
  
    struct list* result=list_create();
    list_map2(step6, result,onlynum  ,onlystring);
    
    
    
  list_foreach (print_char, result);
    char* s = "";
    list_foldl (maxvalue, (element_t*) &s, result);
    printf ("%ld\n", strlen(s));
    list_destroy (l0);
    list_destroy (intlist);
    list_destroy (onlynum);
    list_destroy (onlystring);
    list_destroy (stringlist);
    list_destroy (result);
    
}
