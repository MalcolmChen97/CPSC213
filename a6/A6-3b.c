#include <stdlib.h>
#include <string.h>
#include <stdio.h>

int x[8]={1,2,3,-1,-2,0,184,340057058};
int y[8]={0,0,0,0,0,0,0,0};

int f(int a){
	int b = 0;
	while(a !=0){
		int c = a & 0x80000000;
		if(c !=0){
			b = b+1;
		}
		a = a<<1;
	}
	return b;
}

int main() {
	int i = 8;
	while(i){
		i--;
		y[i] = f(x[i]);
	}
	for (int i=0; i<8; i++) {
    printf("%d\n", x[i]);
    }
    for (int i=0; i<8; i++) {
        printf("%d\n",y[i]);
    }
}
