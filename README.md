# Luxacode project

## What is Luxacode project ?

**Luxacode project** is a suite that aims to provide apps, tools and libraries to interact with [Luxafor devices](http://www.luxafor.fr/).
It uses [Vala](https://wiki.gnome.org/Projects/Vala) as main programing language.

## Tools

* [Libluxafor](#luxafor-cli) is a Vala library which provides a low-level API to access a **Luxafor** device.
* [Luxafor-cli](#libLuxafor) is a high-level command-line tool that aims to command your **Luxafor** device.

# Luxafor-cli

Luxafor-cli is a command line tool written in Vala to control over your Luxafor USB device.

## Build

Make sure vala and libusb-dev are installed :
```bash
sudo apt-get install valac libusb-1.0-0 libusb-1.0-0-dev libusb-dev
```

Compile :
```bash
$ make luxafor-cli-compile
```

Execute :

For execution, `su` access is needed to make libluxafor.so easily reachable at runtime and allow luxafor-cli to access USB devices in a one-line command. (accessing USB devices is always disabled by default for 'non-root' user on every Linux distributions).

```bash
$ sudo ./dist/luxafor-cli color --red=255"
```

## Usage

Inline help :

```bash
$ sudo ./dist/luxafor-cli --help
```

### Features

#### Changing Luxafor color

```bash
# Will activate a pure red color.
$ sudo ./dist/luxafor-cli color --red=255 --green=0 --blue=0

# Short syntax
$ sudo ./dist/luxafor-cli color -r 255 -g 0 -b 0
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
$ sudo ./luxafor-cli shutdown
```

#### Random color

```bash
# Randomly change color
$ sudo ./dist/luxafor-cli random-color
```

#### Fade to color

```bash
# Fade to the given color (here, yellow), from the current Luxafor color.
#Default speed is 127 "medium", but you can specify a value between 0 (fastest) to 255 (slowest)
$ sudo ./dist/luxafo-clir fade-to-color --red=255 --green=127 --speed=255

# Short syntax
$ sudo ./dist/luxafor-cli fade-to-color -r 255 -g 127
```

Default values :
```
--speed=127
--red=0
--green=0
--blue=0
```

At least one color channel must be set.

# Libluxafor

Libluxafor is a library written in Vala which exposes an API to give you access to Luxafor devices.

## Build the shared library

### Requirements

On apt based-systems :

```bash
sudo apt-get install vala libusb-1.0-0 libusb-1.0-0-dev libusb-dev
```

### Compile the shared library

```bash
$ make libluxafor-so-create

```

### Functionnal tests w/ Luxafor-cli sandbox :

The `test-cli` is mainy used to execute functionnal test from the command-line. It is compiled against the libluxafor shared object.

`su` is needed to allow `test-cli` to access USB devices.

```bash
$ make libluxafor-so-test 
$ sudo su -
$ export LD_LIBRARY_PATH=. && ./dist/test-cli

```

## Vala API

### Init LibUSB submodule
```vala
LibUSB.Context context;
LibUSB.Context.init(out context);	
```

### Create and send a Luxafor command
```vala
using global::Luxacode.Device;
try {
	Luxafor luxafor = new Luxafor(context);
	luxafor.send(new Effect.Color((uint8) red, (uint8) green, (uint8) blue););	
} catch (LuxaforError error) {
	return 1;
}
```

### Change the Color
```
# Pure red color
luxafor.send(new Effect.Color((uint8) 255, (uint8) 0, (uint8) 0););	
luxafor.send(new Luxafor.Effect.RandomColor());
```

### Send raw values
* This effect is used to send user-defined raw bytes to the Luxafor USB device.
* Send raw data - if you don't know what you are doing - may need a device restart (plug / unplug) is something goes wrong on the Luxafor side
```
using global::Luxacode.Device;
luxafor.send(new Effect.Raw((uint8) 1, (uint8) 255, (uint8) 255, (uint8) 0, (uint8) 0, (uint8) 0, (uint8) 0));
```

### Fade to a color :
```
# Fade curent color
using global::Luxacode.Device;
luxafor.send(new Effect.FadeTo(new Effect.Color((uint8) red [0-255], (uint8) green [0-255], (uint8) blue [0-255]), (uint8) speed [0-255]#0:fast,255:slow#));

# For exemple : fade curent color to a pure blue, very slowly :
luxafor.send(new Effect.FadeTo(new Effect.Color((uint8) 0, (uint8)  0, (uint8) 255), (uint8) 255));
```

### Shutdown the Luxafor :
```
using global::Luxacode.Device;
luxafor.send(new Effect.Shutdown());
```

# Contribute

Feel free to contribute quicker and better than I can :p Any contributions are welcome, don't be shy !

# More features ?

Yes, likely from me. And what about _from_ **you** ? Feel free to contribute, everyone is welcome !

# Coming soon

* Reorganize the repository in packages
* Create a DBUS server implementation to access **Luxafor** device

