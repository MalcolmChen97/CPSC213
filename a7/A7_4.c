#include <stdio.h>

int i[] = {0,0,0,0};

int c[4] ;

int foo(int a, int b, int c){
    switch(a){
        case 10: return b+c;
        case 12: return b-c;
        case 14: if(b>c )
                    return 1;
                 else
                    return 0;
        case 16: if(b<c)
                    return 1;
                 else
                    return 0;
        case 18: if(c==b)
                    return 1;
                 else
                    return 0;
            
        default: return 0;
        
    }
}


int main() {
  i[3] = foo(i[0], i[1], i[2]);
}
