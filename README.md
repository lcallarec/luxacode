# Luxacode project

## What is Luxacode project ?

**Luxacode project** is a suite that aims to provide apps, tools and libraries to interact with [Luxafor devices](http://www.luxafor.fr/).
It uses [Vala](https://wiki.gnome.org/Projects/Vala) as main programing language.

## Tools

* Libluxafor is a Vala library which provides a low-level API to access a **Luxafor** device.
* Luxafor is a command-line tool that aims to command your **Luxafor** device.

## Build

Make sure Vala, libusb-dev and Meson build are installed :
```bash
sudo apt-get install valac libusb-1.0-0 libusb-1.0-0-dev libusb-dev meson
```

```bash
$ meson build
$ cd build && ninja
```

Both luxafor executable and libluxafor.so are created in `build` dir.

## Run

`luxafor` still needs root permissions to access an USB devices.

```bash
$ sudo ./build/luxafor"
```

## Features

* changing color
* shutdown
* random color
* fade to color (at at given speed)

## Contribute

Feel free to contribute quicker and better than I can :p Any contributions are welcome, don't be shy !
