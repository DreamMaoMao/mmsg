BINS = mmsg

PREFIX ?= /usr

PKG_CONFIG = pkg-config
PKGS = wayland-client
CFLAGS += `$(PKG_CONFIG) --cflags $(PKGS)`
LDLIBS += `$(PKG_CONFIG) --libs $(PKGS)`

all: $(BINS)

clean:
	rm -f $(BINS) *.o *-protocol.*

install: all
	mkdir -p $(PREFIX)/bin
	cp -f $(BINS) $(PREFIX)/bin

uninstall:
	rm -f $(PREFIX)/bin/$(BINS)

WAYLAND_PROTOCOLS=`pkg-config --variable=pkgdatadir wayland-protocols`
WAYLAND_SCANNER=`pkg-config --variable=wayland_scanner wayland-scanner`

mmsg: mmsg.o dwl-ipc-unstable-v2-protocol.o
	$(CC) mmsg.o dwl-ipc-unstable-v2-protocol.o $(CFLAGS) $(LDLIBS) -o $@

mmsg.o: mmsg.c dwl-ipc-unstable-v2-protocol.h

dwl-ipc-unstable-v2-protocol.h:
	$(WAYLAND_SCANNER) client-header \
		protocols/dwl-ipc-unstable-v2.xml $@
dwl-ipc-unstable-v2-protocol.c:
	$(WAYLAND_SCANNER) private-code \
		protocols/dwl-ipc-unstable-v2.xml $@
