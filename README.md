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
$ ./luxafor color --red=255"
```

## Usage

Inline help :

```bash
$ ./luxafor --help
```

### Features

#### Changing Luxafor color

```bash
# Will activate a pure red color.
$ ./luxafor color --red=255 --green=0 --blue=0

# Short syntax
$ ./luxafor color -r 255 -g 0 -b 0
```

Default values :
```
--red=0
--green=0
--blue=0
```

At least one color channel must be set.

#### Shutdown the Luxafor

```bash
# Shutdown the Luxafor
$ ./luxafor shutdown
```

#### Random color

```bash
# Randomly change color
$ /luxafor random-color
```

#### Fade to color

```bash
# Fade to the given color (here, yellow), from the current Luxafor color.
#Default speed is 127 "medium", but you can specify a value between 0 (fastest) to 255 (slowest)
$ ./luxafor fade-to-color --red=255 --green=127 --speed=255

# Short syntax
$ ./luxafor fade-to-color -r 255 -g 127
```

Default values :
```
--speed=127
--red=0
--green=0
--blue=0
```

At least one color channel must be set.

#### More features ?

Yes, likely from me. And from you ? Feel free to contribute, everyone is welcome !

