CXX := g++
CXXFLAGS := -std=c++11 -Wall -Wextra -pedantic
SDL2_LIB := $(shell pkg-config --libs sdl2)
SDL2_INCLUDE := $(shell pkg-config --cflags sdl2)

SRC_DIR := src
BUILD_DIR := build

SRCS := $(wildcard $(SRC_DIR)/*.cpp)
OBJS := $(SRCS:$(SRC_DIR)/%.cpp=$(BUILD_DIR)/%.o)

EXEC := tictac

.PHONY: all clean

$(BUILD_DIR)/$(EXEC): $(OBJS)
	$(CXX) $(CXXFLAGS) $^ -o $@ $(SDL2_LIB)

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.cpp | $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) $(SDL2_INCLUDE) -c $< -o $@

$(BUILD_DIR):
	mkdir -p $@

clean:
	rm -rf $(BUILD_DIR)

