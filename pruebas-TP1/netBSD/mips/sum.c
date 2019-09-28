#include <unistd.h>
#include <stdio.h>


extern size_t sum(const int n,const int m,const int l);

int main(int argc, char * const argv[]){
	int n = 2;
	int m = 3;
	int l = 10;
	printf("suma=%d\n", sum(n,m,l));
	return 0;
}

