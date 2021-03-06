#include<stdio.h>
#include<stdlib.h>

int main(int argc, char **argv){
	if(argc != 2){
		fprintf(stderr, "引数の個数が正しくありません\n");
		return 1;
	}

	printf(".intel_syntax noprefix\n");
	printf(".globl main\n\n");
	printf("main:\n");

	char *p = argv[1];

	printf("\tmov rax, %ld\n", strtol(p, &p, 10));

	while(*p){
		if(*p == '+'){
			p++;
			printf("\tadd rax, %ld\n", strtol(p, &p, 10));
		}
		else if(*p == '-'){
			p++;
			printf("\tsub rax, %ld\n", strtol(p, &p, 10));
		}
		else{
			printf("コンパイル不能な文字'%c'が発見されました\n", *p);
			return 2;
		}
	}
	printf("\tret\n");

	return 0;
}
