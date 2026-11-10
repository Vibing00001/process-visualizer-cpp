CXX = g++
CXXFLAGS = -std=c++20 -Wall -Wextra -O2
LDLIBS = -lraylib -lGL -lm -lpthread -ldl -lrt -lX11

TARGET = process_visualizer
SRC = src/main.cpp

all: $(TARGET)

$(TARGET): $(SRC)
	$(CXX) $(CXXFLAGS) $(SRC) -o $(TARGET) $(LDLIBS)

clean:
	rm -f $(TARGET)

.PHONY: all clean
