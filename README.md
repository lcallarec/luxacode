# Vala-LibLuxafor

Vala-LibLuxafor library will give you control over Luxafor devices.
It is written in Vala, and designed to be compiled as shared library.

## Build the shared library

### Requirements

On apt based-systems :

```bash
sudo apt-get install vala libusb-1.0-0 libusb-1.0-0-dev libusb-dev(?)
```

## Vala API

```vala

Luxafor.Luxafor? luxafor;
public static int main(string[] args)
{
	LibUSB.Context context;
	LibUSB.Context.init(out context);	
	
	luxafor = new Luxafor.Luxafor(context);
	if (luxafor != null) {
		
		luxafor.send(new Luxafor.Effect.Color(255, 0, 0, 255));
		
		for(int i = 0;i < 500000000;i++) {}

		luxafor.send(new Luxafor.Effect.Shutdown());
		
	} else {
		stderr.printf("FAILED TO CREATE LUXAFOR\n");
	}
	
	return 0;
}
```
