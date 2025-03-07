BINS = mmsg

PREFIX ?= /usr/local
CFLAGS += -Wall -Wextra -Wno-unused-parameter -g

all: $(BINS)

clean:
	$(RM) $(BINS) *.o *-protocol.*

install: all
	install -D -t $(PREFIX)/bin $(BINS)
uninstall:
	rm -f $(PREFIX)/bin/$(BINS)

WAYLAND_PROTOCOLS=$(shell pkg-config --variable=pkgdatadir wayland-protocols)
WAYLAND_SCANNER=$(shell pkg-config --variable=wayland_scanner wayland-scanner)

mmsg: mmsg.o dwl-ipc-unstable-v2-protocol.o
	$(CC) $^ -lwayland-client -o $@

mmsg.o: mmsg.c dwl-ipc-unstable-v2-protocol.h

dwl-ipc-unstable-v2-protocol.h:
	$(WAYLAND_SCANNER) client-header \
		protocols/dwl-ipc-unstable-v2.xml $@
dwl-ipc-unstable-v2-protocol.c:
	$(WAYLAND_SCANNER) private-code \
		protocols/dwl-ipc-unstable-v2.xml $@
