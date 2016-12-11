#include <stdlib.h>
#include <stdio.h>



struct D{
    struct haha* d1;
    struct haha* d2;
};

struct haha{
    int a;
    int b;
};

struct D* hoho;

int main(int argc,char** argv){
    hoho=malloc(sizeof(struct D));
    hoho->d1=malloc(sizeof(struct haha));
    hoho->d2=malloc(sizeof(struct haha));
    hoho->d1->a=1;
    hoho->d1->b=2;
    hoho->d2->a=3;
    hoho->d2->b=4;
    int v0=atoi(argv[1]);
    int v1=atoi(argv[2]);
    int v2=atoi(argv[3]);
    int v3=atoi(argv[4]);
    hoho->d1->a=v0;
    hoho->d1->b=v1;
    hoho->d2->a=v2;
    hoho->d2->b=v3;
    hoho->d2->a=hoho->d1->b;
    hoho->d1->a=hoho->d2->b;
    printf("%d\n",hoho->d1->a);
    printf("%d\n",hoho->d1->b);
    printf("%d\n",hoho->d2->a);
    printf("%d\n",hoho->d2->b);

}
