%{
int yylex();
int yyerror(char* msg);
%}

%token PROGRAM _BEGIN END FUNCTION READ WRITE IF ELSE ENDIF WHILE ENDWHILE CONTINUE BREAK RETURN INT VOID STRING FLOAT
%token DEF ADD MINUS MULT DIV EQ NEQ LT GT OB CB COLON COMMA LEQ GEQ
%token IDENTIFIER INTLITERAL FLOATLITERAL STRINGLITERAL
%%

program: PROGRAM id _BEGIN pgm_body END
	;
id: IDENTIFIER
	;
pgm_body: decl func_declarations
	;
decl: string_decl decl
	| var_decl decl
	| %empty
	;

string_decl: STRING id DEF str COLON
	;
str: STRINGLITERAL
	;

var_decl: var_type id_list COLON
	;
var_type: FLOAT 
	| INT
	;
any_type: var_type 
	| VOID
	;
id_list: id id_tail
id_tail: COMMA id id_tail
	| %empty
	;

param_decl_list: param_decl param_decl_tail
	| %empty
	;
param_decl: var_type id
	;
param_decl_tail: COMMA param_decl param_decl_tail
	| %empty
	;

func_declarations: func_decl func_declarations
	| %empty
	;
func_decl: FUNCTION any_type id OB param_decl_list CB _BEGIN func_body END
	;
func_body: decl stmt_list
	;

stmt_list: stmt stmt_list 
	| %empty
	;
stmt: base_stmt 
	| if_stmt
	| while_stmt
	;
base_stmt: assign_stmt 
	| read_stmt 
	| write_stmt 
	| return_stmt
	;

assign_stmt: assign_expr COLON
	;
assign_expr: id DEF expr
	;
read_stmt: READ OB id_list CB COLON
	;
write_stmt: WRITE OB id_list CB COLON
	;
return_stmt: RETURN expr COLON
	;

expr: expr_prefix factor
	;
expr_prefix: expr_prefix factor addop
	| %empty
	;
factor: factor_prefix postfix_expr
	;
factor_prefix: factor_prefix postfix_expr mulop
	| %empty
	;
postfix_expr: primary 
	| call_expr
	;
call_expr: id OB expr_list CB
	;
expr_list: expr expr_list_tail
	| %empty
	;
expr_list_tail: COMMA expr expr_list_tail
	| %empty
	;
primary: OB expr CB
	| id
	| INTLITERAL
	| FLOATLITERAL
	;
addop: ADD 
	| MINUS
	;
mulop: MULT
	| DIV
	;

if_stmt: IF OB cond CB decl stmt_list else_part ENDIF
	;
else_part: ELSE decl stmt_list
	| %empty
	;
cond: expr compop expr
	;
compop: LT
	| GT
	| EQ
	| NEQ
	| LEQ
	| GEQ
	;

while_stmt: WHILE OB cond CB decl aug_stmt_list ENDWHILE

aug_stmt_list: aug_stmt aug_stmt_list
	| %empty
	;
aug_stmt: base_stmt
	| aug_if_stmt
	| while_stmt
	| CONTINUE COLON
	| BREAK COLON
	;

aug_if_stmt: IF OB cond CB decl aug_stmt_list aug_else_part ENDIF
	;

aug_else_part: ELSE decl aug_stmt_list
	| %empty
	;

%%
