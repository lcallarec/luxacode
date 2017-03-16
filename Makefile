SHELL := /bin/bash

EXEC=so

all: $(EXEC)

so:
	-rm -rf vala-libluxafor.vapi 
	-valac --pkg libusb-1.0 --library=vala-libluxafor -H libluxafor.h \
		$$(find src/ -type f -name "*.vala") 
		-X -fPIC -X -shared \
		-o libluxafor.so

test : so
	-valac --pkg libusb-1.0 vala-libluxafor.vapi ftest.vala -X libluxafor.so -X -I. -o test-cli
	-sudo bash -c "export LD_LIBRARY_PATH=. && ./test-cli"
