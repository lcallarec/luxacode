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
valac --pkg libusb-1.0 --library=vala-libluxafor -H libluxafor.h \
src/luxafor.vala src/device/usb_device_finder.vala src/device/luxafor_finder.vala \
src/effect/effect.vala src/effect/color.vala src/effect/shutdown.vala \
-X -fPIC -X -shared -o libluxafor.so

```

## Sandbox : main.vala && luxafor-cli

`su` access is needed to make `libluxafor.so` easily reachable at runtime and allow `luxafor-cli` to access USB devices.
(accessing USB devices is always disabled by default for 'non-root' user on every Linux distributions).

```bash
$ sudo su -
$ valac --pkg libusb-1.0 vala-libluxafor.vapi main.vala -X libluxafor.so -X -I. -o luxafor-cli
$ export LD_LIBRARY_PATH=. && ./luxafor-cli

```

## Vala API

Init LibUSB :
```vala
LibUSB.Context context;
LibUSB.Context.init(out context);	
```

Create Luxafor :
```vala
Luxafor.Luxafor? luxafor = new Luxafor.Luxafor(context);
if (luxafor != null) {
  //Do something...		
}
```

Send an effect, for exemple pure blue high-intensity color :
```vala
luxafor.send(new Luxafor.Effect.Color(255, 0, 0, 255));

```

Shutdown the Luxafor :
```
luxafor.send(new Luxafor.Effect.Shutdown());
```

There's not so many effects, for now. But feel free to contribute quicker and better than me :p

## Contribute

Any contributions are welcome, don't be shy !
