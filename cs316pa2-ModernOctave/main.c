#include <stdio.h>
#include "grammar.tab.h"

extern FILE* yyin;
extern FILE* yyout;

int yyerror(char* msg){
	fprintf(yyout, "Not accepted\n");
}

int main(int argc, char const *argv[])
{
	yyin = fopen(argv[1], "r");
	yyout = fopen(argv[2], "w");

	if (yyparse() == 0)
	{
		fprintf(yyout, "Accepted\n");
	}

	return 0;
}
