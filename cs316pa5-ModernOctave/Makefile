compiler: micro.l micro.ypp main.cpp
	flex -o lex.yy.cpp micro.l
	bison -d micro.ypp
	g++ main.cpp lex.yy.cpp micro.tab.cpp -o $@

tiny: tinyNew.C
	g++ --std=c++0x tinyNew.C -o $@

clean:
	rm lex.yy.cpp micro.tab.cpp micro.tab.hpp compiler tiny a.out our.txt expected.txt

dev:
	@echo Om Patil
	@echo 200010036@iitdh.ac.in

test: compiler tiny
	./compiler ${prog} a.out
	./tiny outputs/$$(basename ${prog} .micro).out > expected.txt
	./tiny a.out > our.txt
	diff -sy our.txt expected.txt

testall: compiler tiny runall

runall: inputs/*
	@for file in $^ ; do \
		echo "Testing $${file}"; \
		./compiler $${file} a.out; \
		./tiny outputs/$$(basename $${file} .micro).out > expected.txt; \
		./tiny a.out > our.txt; \
		diff -sy our.txt expected.txt; \
		echo ""; echo ""; \
	done