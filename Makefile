TARGET = openjump

CXX = g++
SRC_DIR = src
OBJ_DIR = build

SRC_FILES = $(shell find $(SRC_DIR) -type f -name "*.cpp")
OBJ_FILES = $(patsubst $(SRC_DIR)%.cpp,$(OBJ_DIR)%.o,$(SRC_FILES))
DEP_FILES = $(patsubst $(SRC_DIR)%.cpp,$(OBJ_DIR)%.d,$(SRC_FILES))

OBJ_SUBDIRS = $(shell find $(SRC_DIR) -type d | sed -E 's/^$(SRC_DIR)/$(OBJ_DIR)/')

.PHONY: clean all

CFLAGS += -Wall -Wextra -pedantic -iquote src/ -std=c++17
LDFLAGS += -lraylib -Wl,-rpath /usr/local/lib64/

all: $(TARGET)

$(TARGET): $(OBJ_SUBDIRS) $(OBJ_FILES)
	$(CXX) $(OBJ_FILES) $(LDFLAGS) -o $@ 

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp
	$(CXX) -MMD -MD $(CFLAGS) -c $< -o $@ 

$(OBJ_SUBDIRS):
	mkdir -p $@

clean:
	rm -rf $(OBJ_SUBDIRS)

-include $(DEP_FILES)
