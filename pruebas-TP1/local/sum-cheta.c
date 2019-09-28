#include <unistd.h>
#include <stdio.h>

struct point {
	int x;
	int y;
	int z;
};

extern size_t sum(struct point *p);

int main(int argc, char * const argv[]){
	struct point p = {3, 8, 1000};
	char *msg = "suma= %d\n";
	printf(msg, sum(&p));
	printf("z=%d\n", p.z);
	return 0;
}
