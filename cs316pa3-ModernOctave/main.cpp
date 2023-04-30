#include <stdio.h>
#include <string>
#include "grammar.tab.hpp"

extern FILE* yyin;
extern FILE* yyout;

void yyerror(const char* msg)
{
	fprintf(yyout, msg);
	exit(0);
}

int main(int argc, char const *argv[])
{
	yyin = fopen(argv[1], "r");
	yyout = fopen(argv[2], "w");

	yyparse();

	return 0;
}
