compiler: grammar.y scanner.l main.c
	bison -d grammar.y
	flex scanner.l
	gcc lex.yy.c grammar.tab.c main.c -o $@

clean:
	rm lex.yy.c grammar.tab.c grammar.tab.h compiler

dev:
	@echo Om Patil
	@echo 200010036@iitdh.ac.in