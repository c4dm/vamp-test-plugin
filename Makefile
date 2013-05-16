
PLUGIN_LIBRARY_NAME := vamp-test-plugin

PLUGIN_SOURCES := VampTestPlugin.cpp plugins.cpp

PLUGIN_HEADERS := VampTestPlugin.h

VAMP_SDK_DIR := ../vamp-plugin-sdk


CXXFLAGS := -I$(VAMP_SDK_DIR) -Wall -fPIC
PLUGIN_EXT := .so
LDFLAGS := -shared -Wl,-soname=$(PLUGIN_LIBRARY_NAME)$(PLUGIN_EXT) $(VAMP_SDK_DIR)/libvamp-sdk.a -Wl,--version-script=vamp-plugin.map


PLUGIN_OBJECTS := $(PLUGIN_SOURCES:.cpp=.o)
PLUGIN_OBJECTS := $(PLUGIN_OBJECTS:.c=.o)

$(PLUGIN_LIBRARY_NAME)$(PLUGIN_EXT): $(PLUGIN_OBJECTS)
	   $(CXX) -o $@ $^ $(LDFLAGS)

$(PLUGIN_OBJECTS): $(PLUGIN_HEADERS)

clean:
	rm -f *.o

