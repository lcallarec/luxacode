# Luxafor-cli

Luxafor-cli is a command line tool to control your Luxafor USB device.

## Build

su access is needed to make libluxafor.so easily reachable at runtime and allow luxafor-cli to access USB devices in a one-line command. (accessing USB devices is always disabled by default for 'non-root' user on every Linux distributions).

```bash
$ valac --pkg libusb-1.0 lib/vala-libluxafor.vapi src/luxafor.vala src/option/color.vala -X lib/libluxafor.so -X -I. -o luxafor-cli
$ sudo bash -c "export LD_LIBRARY_PATH=lib/ && ./luxafor-cli color --intensity=255 --red=255"
```

If you need to contribute, it may be easier to compile with vala-libluxafor source code instead of the shared library.

In that case, symlink `lib/libluxafor` with the folder containing `vala-libluxafor` repository and run :

```bash
$ valac --pkg libusb-1.0 src/luxafor.vala src/option/color.vala lib/libluxafor/luxafor.vala lib/libluxafor/device/usb_device_finder.vala lib/libluxafor/device/luxafor_finder.vala \
lib/libluxafor/effect/effect.vala lib/libluxafor/effect/color.vala lib/libluxafor/effect/shutdown.vala -o luxafor-cli
$ sudo ./luxafor-cli color --intensity=255 --red=255"
```

## Usage

Inline help :

```bash
$ sudo ./luxafor-cli color --help
```

### Features

#### Changing Luxafor color

```bash
# Will activate an intense red color.
$ sudo ./luxafor-cli color --intensity=255 --red=255 --green=0 --blue=0
```

Default values :
```
--intensity=255
--red=0
--green=0
--blue=0
```

#### More features ?

Yes, likely from me. And from you ? Feel free to contribute, everyone is welcome !

