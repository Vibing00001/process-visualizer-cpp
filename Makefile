CXX = g++
CXXFLAGS = -std=c++20 -Wall -Wextra -g -O0 -Isrc -MMD -MP
LDLIBS = -lraylib -lGL -lm -lpthread -ldl -lrt -lX11

OUT_DIR = compiled
OBJ_DIR = $(OUT_DIR)/obj
TARGET = $(OUT_DIR)/program

SRC = $(shell find src -name '*.cpp')
OBJ = $(patsubst src/%.cpp, $(OBJ_DIR)/%.o, $(SRC))
DEP = $(OBJ:.o=.d)

all: $(TARGET)

# Link all object files into the final executable
$(TARGET): $(OBJ)
	@mkdir -p $(@D)
	$(CXX) $(OBJ) -o $@ $(LDLIBS)

# Compile each .cpp file into a corresponding .o file
$(OBJ_DIR)/%.o: src/%.cpp
	@mkdir -p $(@D)
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Include auto-generated header dependency files
-include $(DEP)

clean:
	rm -rf $(OUT_DIR)

.PHONY: all clean

process-test:
	mkdir -p compiled
	$(CXX) $(CXXFLAGS) -DPROCESS_MANAGER_TEST src/process/ProcessManager.cpp -o compiled/process_test
	./compiled/process_test

.PHONY: process-test
