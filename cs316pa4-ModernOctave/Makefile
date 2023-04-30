compiler: micro.l micro.ypp main.cpp
	flex -o lex.yy.cpp micro.l
	bison -d micro.ypp
	g++ main.cpp lex.yy.cpp micro.tab.cpp -o $@

tiny: tinyNew.c
	g++ --std=c++0x tinyNew.c -o $@

clean:
	rm lex.yy.cpp micro.tab.cpp micro.tab.hpp compiler tiny a.out our.txt expected.txt

dev:
	@echo Om Patil
	@echo 200010036@iitdh.ac.in

test: compiler tiny
	./compiler inputs/test_${prog}.micro a.out
	./tiny a.out > our.txt
	./tiny outputs/test_${prog}.out > expected.txt
	diff -sy our.txt expected.txt