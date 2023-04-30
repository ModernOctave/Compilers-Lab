%{
#include <string>
#include "grammar.tab.hpp"

int line = 1;
%}

LETTER		[a-zA-z]
NUMBER		[0-9]

%%
"\n" {
	line++;
}

" "|"\t" {
	// EOL
}

"//"[^\n]*	{
	// Comment
}

"PROGRAM" { return PROGRAM; }
"BEGIN" { return _BEGIN; }
"END" { return END; }
"FUNCTION" { return FUNCTION; }
"READ" { return READ; }
"WRITE" { return WRITE; }
"IF" { return IF; }
"ELSE" { return ELSE; }
"ENDIF" { return ENDIF; }
"WHILE" { return WHILE; }
"ENDWHILE" { return ENDWHILE; }
"BREAK" { return BREAK; }
"CONTINUE" { return CONTINUE; }
"RETURN" { return RETURN; }
"INT" { return INT; }
"VOID" { return VOID; }
"STRING" { return STRING; }
"FLOAT" { return FLOAT; }

":=" { return DEF; }
"+" { return ADD; }
"-" { return MINUS; }
"*" { return MULT; }
"/" { return DIV; }
"=" { return EQ; }
"!=" { return NEQ; }
"<" { return LT; }
">" { return GT; }
"(" { return OB; }
")" { return CB; }
";" { return COLON; }
"," { return COMMA; }
"<=" { return LEQ; }
">=" { return GEQ; }

{LETTER}({LETTER}|{NUMBER})*	{
	yylval.str = new std::pair<std::string, int>();
	yylval.str->first = yytext;
	yylval.str->second = line;
	return IDENTIFIER;
}

{NUMBER}+	{
	return INTLITERAL;
}

{NUMBER}*"."{NUMBER}+	{
	return FLOATLITERAL;
}

\"[^\"\n]*\"	{
	yylval.str = new std::pair<std::string, int>();
	yylval.str->first = yytext;
	yylval.str->second = line;
	return STRINGLITERAL;
}

%%

int yywrap() {
	return 1;
}
