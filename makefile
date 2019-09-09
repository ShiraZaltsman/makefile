

# all .cpp files in this directory are my sources
TARGET=main

SOURCES=books.c Genre.c local_library.c main.c 

OBJS=$(SOURCES:.c=.o)

$(TARGET): $(OBJS)

INC_DIR=../include
CC=gcc
CFLAGS= -c -pedantic -Wall -Wconversion -ansi -g -I$(INC_DIR)
CXXFLAGS=$(CFLAGS)
LDFLAGS= -g

.PHONY: clean run gdb

include .depends

.depends:
	$(CC) -MM -I$(INC_DIR) $(SOURCES) > .depends

clean:
	rm -f $(OBJS) $(TARGET) .depends

run: $(TARGET)
	./$(TARGET)

# Do not forget to add '-g' to CFLAGS
gdb: $(TARGET)
	gdb -q ./$(TARGET)
