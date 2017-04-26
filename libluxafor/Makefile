SHELL := /bin/bash

EXEC=libluxafor-so-create

all: $(EXEC)

libluxafor-so-create:
	-rm -rf libluxafor.vapi 
	-valac --pkg libusb-1.0 --library=libluxafor -H libluxafor.h $$(find src/ -type f -name "*.vala") -X -fPIC -X -shared -o libluxafor.so

libluxafor-so-test : libluxafor-so-create
	-valac --pkg libusb-1.0 libluxafor.vapi test.vala -X libluxafor.so -X -I. -o test-cli
	-sudo bash -c "export LD_LIBRARY_PATH=. && ./test-cli"
