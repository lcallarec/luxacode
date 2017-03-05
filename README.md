# Luxafor-cli

Luxafor-cli is a command line tool written in Vala to control over your Luxafor USB device.

## Build

Make sure vala and libusb-dev are installed :
```bash
sudo apt-get install vala libusb-1.0-0 libusb-1.0-0-dev libusb-dev
```

Compile :
```bash
$ make compile
```

Execute :

For execution, `su` access is needed to make libluxafor.so easily reachable at runtime and allow luxafor-cli to access USB devices in a one-line command. (accessing USB devices is always disabled by default for 'non-root' user on every Linux distributions).

```bash
$ sudo bash -c "export LD_LIBRARY_PATH=lib/ && ./luxafor-cli color --red=255"
```

### Build from vala-libluxafor sources

If you need to contribute, it may be easier to compile with vala-libluxafor source code instead of the shared library.

In that case, symlink `lib/libluxafor` with the folder containing `vala-libluxafor` repository and run :

```bash
$ make
$ sudo ./luxafor-cli color --red=255"
```

## Usage

Inline help :

```bash
$ sudo ./luxafor-cli --help
```

### Features

#### Changing Luxafor color

```bash
# Will activate an intense red color.
$ sudo ./luxafor-cli color --intensity=255 --red=255 --green=0 --blue=0
```

Default values :
```
--red=0
--green=0
--blue=0
```
#### Shutdown the Luxafor

```bash
# Shutdown
$ sudo ./luxafor-cli shutdown
```

#### More features ?

Yes, likely from me. And from you ? Feel free to contribute, everyone is welcome !

