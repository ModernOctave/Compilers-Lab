%option noyywrap
LETTER		[a-zA-z]
NUMBER		[0-9]

%%

" "|"\n"|"\t" {
	// EOL
}

"//"[^\n]*	{
	// Comment
}

"PROGRAM"|"BEGIN"|"END"|"FUNCTION"|"READ"|"WRITE"|"IF"|"ELSE"|"ENDIF"|"WHILE"|"ENDWHILE"|"BREAK"|"CONTINUE"|"RETURN"|"INT"|"VOID"|"STRING"|"FLOAT"	{
	fprintf(yyout, "Token Type: %s\nValue: %s\n", "KEYWORD", yytext);
}

":="|"+"|"-"|"*"|"/"|"="|"!="|"<"|">"|"("|")"|";"|","|"<="|">="	{
	fprintf(yyout, "Token Type: %s\nValue: %s\n", "OPERATOR", yytext);
}

{LETTER}({LETTER}|{NUMBER})*	{
	fprintf(yyout, "Token Type: %s\nValue: %s\n", "IDENTIFIER", yytext);
}

{NUMBER}+	{
	fprintf(yyout, "Token Type: %s\nValue: %s\n", "INTLITERAL", yytext);
}

{NUMBER}*"."{NUMBER}+	{
	fprintf(yyout, "Token Type: %s\nValue: %s\n", "FLOATLITERAL", yytext);
}

\"[^\"\n]*\"	{
	fprintf(yyout, "Token Type: %s\nValue: %s\n", "STRINGLITERAL", yytext);
}

%%

int main(int argc, char *argv[])
{
	++argv, --argc;
	if ( argc == 2 )
	{
		yyin = fopen(argv[0], "r" );
		yyout = fopen(argv[1], "w");
	}
    else
	{
		printf("No files specified, using defaults\n");
		yyin = stdin;
	}
    yylex();
	return 0;
}
