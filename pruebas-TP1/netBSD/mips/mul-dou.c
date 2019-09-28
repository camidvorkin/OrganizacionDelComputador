#include <unistd.h>
#include <stdio.h>


extern double mul_dou(double n,double m);

int main(int argc, char * const argv[]){
	double n = 2;
	double m = 3;
	char *msg = "mul= %lf\n";
	printf(msg, mul_dou(n,m));
	return 0;
}

