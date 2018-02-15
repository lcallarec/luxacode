SHELL := /bin/bash
ROOT_DIR:=$(shell pwd)
DEBIAN_DIR:=$(ROOT_DIR)/dist/pkg/DEBIAN

EXEC=all

all: libluxafor-so-create libluxafor-so-test luxafor-cli-compile

deb: libluxafor-so-create libluxafor-so-test luxafor-cli-compile
	-ln -s $(ROOT_DIR)/dist/luxafor-cli $(DEBIAN_DIR)/usr/local/bin/luxafor-cli
	-dpkg-deb --build $(DEBIAN_DIR)

libluxafor-so-create:
	-valac --pkg libusb-1.0 --vapi=$(ROOT_DIR)/dist/libluxafor.vapi \
	--library=libluxafor -H $(ROOT_DIR)/dist/libluxafor.h \
	$$(find $(ROOT_DIR)/libluxafor/src/ -type f -name "*.vala") \
	-X -fPIC -X -shared -o $(ROOT_DIR)/dist/libluxafor.so

libluxafor-so-test: libluxafor-so-create
	-valac --pkg libusb-1.0 $(ROOT_DIR)/dist/libluxafor.vapi libluxafor/test.vala \
		-X $(ROOT_DIR)/dist/libluxafor.so -X -I$(ROOT_DIR)/dist \
		-o $(ROOT_DIR)/dist/luxafor-cli-test
	-sudo bash -c "export LD_LIBRARY_PATH=$(ROOT_DIR)/dist \
		&& $(ROOT_DIR)/dist/luxafor-cli-test"

luxafor-cli-compile: libluxafor-so-create
	-valac --pkg libusb-1.0 $(ROOT_DIR)/dist/libluxafor.vapi \
		$$(find luxafor-cli/src/ -type f -name "*.vala") \
		-X $(ROOT_DIR)/dist/libluxafor.so -X -I$(ROOT_DIR)/dist \
		-o $(ROOT_DIR)/dist/luxafor-cli
	-@chmod +x $(ROOT_DIR)/dist/luxafor-cli
