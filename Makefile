VERISON_MAJOR := 0
VERISON_MINOR := 1
VERISON_PATCH := 0
GIT_HASH := $(shell git rev-parse --short HEAD)

CC := gcc
SRCDIR := src
BUILDDIR := build
TARGETDIR := bin
TARGET := $(TARGETDIR)/chess
SRCEXT := c
SOURCES := $(shell find $(SRCDIR) -type f -name *.$(SRCEXT))
OBJECTS := $(patsubst $(SRCDIR)/%,$(BUILDDIR)/%,$(SOURCES:.$(SRCEXT)=.o))
CFLAGS := 
LIB := -L lib
INC := -I include
REV_FILE := include/version.h

PHONY := all
all: $(TARGET)

# Linking
$(TARGET): $(OBJECTS)
	mkdir -p $(TARGETDIR)
	$(CC) $^ -o $(TARGET) $(LIB) -O3

# Building
$(BUILDDIR)/%.o: $(SRCDIR)/%.$(SRCEXT) $(REV_FILE)
	mkdir -p $(BUILDDIR)
	$(CC) $(CFLAGS) $(INC) -c -o $@ $< -save-temps -O3

$(REV_FILE): Makefile
	./make_rev.pl $(VERISON_MAJOR) $(VERISON_MINOR) $(VERISON_PATCH) $(GIT_HASH)

PHONY += clean
clean:
	$(RM) -r $(BUILDDIR) $(TARGETDIR) $(REV_FILE)

.PHONY: $(PHONY)
