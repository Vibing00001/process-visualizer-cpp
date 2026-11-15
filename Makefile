CXX = g++
CXXFLAGS = -std=c++20 -Wall -Wextra -g -O0 -Isrc -save-temps=obj -fverbose-asm
LDLIBS = -lraylib -lGL -lm -lpthread -ldl -lrt -lX11

OUT_DIR = compiled
TARGET = $(OUT_DIR)/program
SRC = $(shell find src -name '*.cpp')
HEADERS = $(shell find src -name '*.h')

all: $(TARGET)

$(TARGET): $(SRC) $(HEADERS)
	@mkdir -p $(OUT_DIR)
	$(CXX) $(CXXFLAGS) $(SRC) -o $(TARGET) $(LDLIBS)

clean:
	rm -rf $(OUT_DIR)

.PHONY: all clean
