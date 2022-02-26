

CC = gcc
CFLAGS = -Wall -Wextra -Werror -std=c11 -pedantic -ggdb

PROG = rho

all: $(PROG)

$(PROG): $(PROG).c
	$(CC) $(CFLAGS) -o $@ $^

test:
	make $(PROG)
	./testing.sh

clean:
	rm -f $(PROG)
	rm -f *.o

.PHONY: all test clean
