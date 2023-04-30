CFLAGS = -Wall #-Wextra
GCC = gcc $(CFLAGS)

compiler: scanner
	

scanner: tmp scanner.l
	lex -o tmp/scanner.yy.c scanner.l
	$(GCC) -o scanner tmp/scanner.yy.c

dev:
	@echo Om Patil
	@echo 200010036@iitdh.ac.in

clean:
	rm -fr tmp

tmp:
	mkdir -p tmp

test: compiler
	./runme inputs/$(prog).micro tmp/out.txt
	diff -s tmp/out.txt outputs/$(prog).out