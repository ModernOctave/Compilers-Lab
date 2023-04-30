compiler: micro.l micro.ypp main.cpp
	flex -o lex.yy.cpp micro.l
	bison -d micro.ypp
	g++ main.cpp lex.yy.cpp micro.tab.cpp -o $@

clean:
	rm -f lex.yy.cpp micro.tab.cpp micro.tab.hpp compiler tiny a.out our.txt expected.txt

dev:
	@echo Om Patil
	@echo 200010036@iitdh.ac.in

# -------------- Targets for Automated Testing --------------
compile: compiler
	./compiler inputs/${prog}.micro a.out

tiny: tiny4regs.C
	g++ --std=c++0x tiny4regs.C -o tiny

tinyNew: tinyNew.C
	g++ --std=c++0x tinyNew.C -o tinyNew

test: compile tiny tinyNew
	@if [ -f inputs/${prog}.input ]; then \
		cat inputs/${prog}.input | ./tinyNew outputs/${prog}.out nostats mix > expected.txt; \
		cat inputs/${prog}.input | ./tiny a.out nostats mix > our.txt; \
	else \
		./tinyNew outputs/${prog}.out nostats mix > expected.txt; \
		./tiny a.out nostats mix > our.txt; \
	fi; \
	echo "";
	diff -sy our.txt expected.txt;

runall: inputs/*.micro
	@for file in $^ ; do \
		echo "Testing $${file}"; \
		./compiler $${file} a.out; \
		if [ -f inputs/$$(basename $${file} .micro).input ]; then \
			cat inputs/$$(basename $${file} .micro).input | ./tinyNew outputs/$$(basename $${file} .micro).out nostats mix > expected.txt; \
			cat inputs/$$(basename $${file} .micro).input | ./tiny a.out nostats mix > our.txt; \
		else \
			./tinyNew outputs/$$(basename $${file} .micro).out nostats mix > expected.txt; \
			./tiny a.out nostats mix > our.txt; \
		fi; \
		diff -s our.txt expected.txt; \
		echo ""; echo ""; \
	done

testall: compiler tiny tinyNew runall

otestall: compiler tiny tinyNew runall