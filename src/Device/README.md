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

### Init LibUSB submodule
```vala
LibUSB.Context context;
LibUSB.Context.init(out context);	
```

### Create and send a Luxafor command
```vala
Luxafor.Luxafor luxafor = new Luxafor.Luxafor(context);
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
luxafor.send(new Luxafor.Effect.Raw((uint8) 1, (uint8) 255, (uint8) 255, (uint8) 0, (uint8) 0, (uint8) 0, (uint8) 0));
```

### Fade to a color :
```
# Fade curent color
luxafor.send(new Effect.FadeTo(new Effect.Color((uint8) red [0-255], (uint8) green [0-255], (uint8) blue [0-255]), (uint8) speed [0-255]#0:fast,255:slow#));

# For exemple : fade curent color to a pure blue, very slowly :
luxafor.send(new Effect.FadeTo(new Effect.Color((uint8) 0, (uint8)  0, (uint8) 255), (uint8) 255));
```

### Shutdown the Luxafor :
```
luxafor.send(new Luxafor.Effect.Shutdown());
```

## Contribute

Feel free to contribute quicker and better than I can :p Any contributions are welcome, don't be shy !
