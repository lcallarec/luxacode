# Luxacode project

## What is Luxacode project ?

**Luxacode project** is a suite that aims to provide apps, tools and libraries to interact with [Luxafor devices](http://www.luxafor.fr/).

## Tools

* **Libluxafor** is a library written in [Vala](https://wiki.gnome.org/Projects/Vala). It provides a low-level access to **Luxafor** device.
* **Luxafor-cli** is a high-level command-line tool that aims to command your **Luxafor** device.

## Per-project documentations

* [Libluxafor](https://github.com/lcallarec/luxacode/blob/master/libluxafor/README.md)
* [Luxafor-cli](https://github.com/lcallarec/luxacode/blob/master/luxafor-cli/README.md)

## Coming soon

* Different apps may naturally be able to share their code. For instance, **luxafor-cli** couyld (shouyld ?) be compiled against libluxafor native code instead of the shared library
* Have a root *Makefile* to manage all applications & libraries lifecycles which wraps all specific
* Create a DBUS server implementation to access **Luxafor** device

