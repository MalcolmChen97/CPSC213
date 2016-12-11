#include <stdlib.h>
#include <string.h>
#include <stdio.h>

int a[10]={0,0,0,0,0,0,0,0,0,0};
int *p=a;


void hehe(int d0,int d1){
    p[d1]=p[d1]+d0;
}



int main (int argc, char** argv) {
    int a0=1;
    int a1=2;
    hehe(3,4);
    hehe(a0,a1);
    
    for(int i=0;i<10;i++){
        
        printf("%d\n",p[i]);
    }

}
