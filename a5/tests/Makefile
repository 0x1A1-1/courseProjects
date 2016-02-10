C_FILES := $(wildcard *.c)
TARGETS := ${C_FILES:.c=}

all: ${TARGETS}

%: %.c
	gcc -g -m32 -L.. -lmem -Xlinker -rpath=. -o $@ $<

clean:
	rm -rf ${TARGETS} *.o

mem: mem.c mem.h
	gcc -c -Wall -m32 -fpic mem.c -O
	gcc -shared -Wall -m32 -o libmem.so mem.o -O
 
cleanm:
	rm -rf mem.o libmem.so
