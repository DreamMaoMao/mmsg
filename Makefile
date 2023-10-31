BINS = dwlmsg

PREFIX ?= /usr/local
CFLAGS += -Wall -Wextra -Wno-unused-parameter -g

all: $(BINS)

clean:
	$(RM) $(BINS) *.o *-protocol.*

install: all
	install -D -t $(PREFIX)/bin $(BINS)

WAYLAND_PROTOCOLS=$(shell pkg-config --variable=pkgdatadir wayland-protocols)
WAYLAND_SCANNER=$(shell pkg-config --variable=wayland_scanner wayland-scanner)

dwlmsg: dwlmsg.o dwl-ipc-unstable-v2-protocol.o
	$(CC) $^ -lwayland-client -o $@

dwlmsg.o: dwlmsg.c dwl-ipc-unstable-v2-protocol.h

xdg-output-unstable-v1-protocol.h:
	$(WAYLAND_SCANNER) client-header \
		$(WAYLAND_PROTOCOLS)/unstable/xdg-output/xdg-output-unstable-v1.xml $@
xdg-output-unstable-v1-protocol.c:
	$(WAYLAND_SCANNER) private-code \
		$(WAYLAND_PROTOCOLS)/unstable/xdg-output/xdg-output-unstable-v1.xml $@

dwl-ipc-unstable-v2-protocol.h:
	$(WAYLAND_SCANNER) client-header \
		protocols/dwl-ipc-unstable-v2.xml $@
dwl-ipc-unstable-v2-protocol.c:
	$(WAYLAND_SCANNER) private-code \
		protocols/dwl-ipc-unstable-v2.xml $@
