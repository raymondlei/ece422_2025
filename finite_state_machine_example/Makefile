CC := /c/msys64/ucrt64/bin/gcc.exe
RM := /usr/bin/rm
MKDIR := /usr/bin/mkdir
CFLAGS := -g -Wall -Wextra -std=c11 -Iapp_main -Icounter -Iunit_test
SRCS := main.c $(wildcard app_main/*.c) $(wildcard counter/*.c)
TARGET := build/main.exe
BUILD_DIR := build

.PHONY: all clean run

all: $(TARGET)

$(BUILD_DIR):
	@$(MKDIR) -p $(BUILD_DIR)

$(TARGET): $(SRCS) | $(BUILD_DIR)
	$(CC) $(CFLAGS) $(SRCS) -o $(TARGET)

run: $(TARGET)
	./$(TARGET)

clean:
	$(RM) -rf $(BUILD_DIR)
