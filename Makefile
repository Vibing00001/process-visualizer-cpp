CXX = g++
CXXFLAGS = -std=c++20 -Wall -Wextra -O2
LDLIBS = -lraylib -lGL -lm -lpthread -ldl -lrt -lX11

OUT_DIR = compiled
TARGET = $(OUT_DIR)/process_visualizer
SRC = $(shell find src -name '*.cpp')

all: $(TARGET)

$(TARGET): $(SRC)
	@mkdir -p $(OUT_DIR)
	$(CXX) $(CXXFLAGS) $(SRC) -o $(TARGET) $(LDLIBS)

clean:
	rm -rf $(OUT_DIR)

.PHONY: all clean
