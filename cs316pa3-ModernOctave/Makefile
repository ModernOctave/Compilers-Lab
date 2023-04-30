compiler: scanner.l grammar.ypp main.cpp
	flex -o lex.yy.cpp scanner.l
	bison -d grammar.ypp
	g++ main.cpp lex.yy.cpp grammar.tab.cpp -o $@

clean:
	rm lex.yy.cpp grammar.tab.cpp grammar.tab.hpp compiler

dev:
	@echo Om Patil
	@echo 200010036@iitdh.ac.in

test: compiler
	./compiler inputs/test${num}.micro test.txt
	diff -s test.txt outputs/test${num}.out