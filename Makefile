#
# 
# 
# Type "make" to build the shell and driver
#
CC = /usr/bin/gcc
CFLAGS = -Wall -g -Werror -pthread


FILES = sdriver runtrace tsh myspin1 myspin2 myenv myintp myints mytstpp mytstps mysplit mysplitp mycat

all: $(FILES)

#
# Using link-time interpositioning to introduce non-determinism in the
# order that parent and child execute after invoking fork
#
tsh: tsh.c fork.c
	$(CC) $(CFLAGS)   -Wl,--wrap,fork -o tsh tsh.c fork.c csapp.c $(LIBS)

sdriver: sdriver.o
sdriver.o: sdriver.c config.h
runtrace.o: runtrace.c config.h

# Clean up
clean:
	rm -f $(FILES) *.o *~

