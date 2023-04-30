compiler: micro.l micro.ypp main.cpp
	flex -o lex.yy.cpp micro.l
	bison -d micro.ypp
	g++ -Wall main.cpp lex.yy.cpp micro.tab.cpp -o $@

clean:
	rm lex.yy.cpp micro.tab.cpp micro.tab.hpp compiler tiny a.out our.txt expected.txt

dev:
	@echo Om Patil
	@echo 200010036@iitdh.ac.in

# -------------- Targets for Automated Testing --------------
compile: compiler
	./compiler inputs/${prog}.micro a.out

tiny: tinyNew.C
	g++ --std=c++0x -w tinyNew.C -o $@

test: compile tiny
	cat inputs/${prog}.input | ./tiny outputs/${prog}.out nostats mix > expected.txt
	cat inputs/${prog}.input | ./tiny a.out nostats mix > our.txt
	diff -sy our.txt expected.txt

runall: inputs/*.micro
	@for file in $^ ; do \
		echo "Testing $${file}"; \
		./compiler $${file} a.out; \
		if [ -f inputs/$$(basename $${file} .micro).input ]; then \
			cat inputs/$$(basename $${file} .micro).input | ./tiny outputs/$$(basename $${file} .micro).out nostats mix > expected.txt; \
			cat inputs/$$(basename $${file} .micro).input | ./tiny a.out nostats mix > our.txt; \
		else \
			./tiny outputs/$$(basename $${file} .micro).out nostats mix > expected.txt; \
			./tiny a.out nostats mix > our.txt; \
		fi; \
		diff -sy our.txt expected.txt; \
		echo ""; echo ""; \
	done

testall: compiler tiny runall

runcomp: complete/inputs/*.micro
	@for file in $^ ; do \
		echo "Testing $${file}"; \
		./compiler $${file} a.out; \
		if [ -f complete/inputs/$$(basename $${file} .micro).input ]; then \
			cat complete/inputs/$$(basename $${file} .micro).input | ./tiny complete/outputs/$$(basename $${file} .micro).out nostats mix > expected.txt; \
			cat complete/inputs/$$(basename $${file} .micro).input | ./tiny a.out nostats mix > our.txt; \
		else \
			./tiny complete/outputs/$$(basename $${file} .micro).out nostats mix > expected.txt; \
			./tiny a.out nostats mix > our.txt; \
		fi; \
		diff -s our.txt expected.txt; \
		echo ""; echo ""; \
	done

testcomp: compiler tiny runcomp