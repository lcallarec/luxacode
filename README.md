# Vala-LibLuxafor

Vala-LibLuxafor library will give you control over Luxafor devices.
It is written in Vala, and designed to be compiled as shared library.

## Build the shared library

### Requirements

On apt based-systems :

```bash
sudo apt-get install vala libusb-1.0-0 libusb-1.0-0-dev libusb-dev
```

### Compile the shared library

```bash
$ make so

```

### Functionnal tests w/ Luxafor-cli sandbox :


The `luxafor-cli` is mainy used to execute functionnal test from the command-line. It is compiled against the libluxafor shared object.

`su` is needed to allow `luxafor-cli` to access USB devices.

```bash
$ make ftest
$ sudo su -
$ export LD_LIBRARY_PATH=. && ./luxafor-cli

```

## Vala API

Init LibUSB :
```vala
LibUSB.Context context;
LibUSB.Context.init(out context);	
```

Create and send a command Luxafor :
```vala
Luxafor.Luxafor luxafor = new Luxafor.Luxafor(context);
try {
	Luxafor luxafor = new Luxafor(context);
	luxafor.send(new Effect.Color((uint8) red, (uint8) green, (uint8) blue););	
} catch (LuxaforError error) {
	return 1;
}
```

Change the Color:
```
# Pure red color
luxafor.send(new Effect.Color((uint8) 255, (uint8) 0, (uint8) 0););	
```

Shutdown the Luxafor :
```
luxafor.send(new Luxafor.Effect.Shutdown());
```

There's not so many effects, for now. But feel free to contribute quicker and better than me :p

## Contribute

Any contributions are welcome, don't be shy !
