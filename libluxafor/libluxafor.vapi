/* libluxafor.vapi generated by valac 0.30.1, do not modify. */

namespace Luxacode {
	namespace Device {
		namespace Effect {
			[CCode (cheader_filename = "libluxafor.h")]
			public class Color : Luxacode.Device.Effect.Effect, GLib.Object {
				public Color (uint8 red, uint8 green, uint8 blue);
				public uint8 blue { get; set construct; }
				public uint8 green { get; set construct; }
				public uint8 red { get; set construct; }
			}
			[CCode (cheader_filename = "libluxafor.h")]
			public class FadeToColor : Luxacode.Device.Effect.Effect, GLib.Object {
				public FadeToColor (Luxacode.Device.Effect.Color color, uint8 speed);
				public uint8 speed { get; set construct; }
			}
			[CCode (cheader_filename = "libluxafor.h")]
			public class RandomColor : Luxacode.Device.Effect.Effect, GLib.Object {
				public RandomColor ();
			}
			[CCode (cheader_filename = "libluxafor.h")]
			public class Raw : Luxacode.Device.Effect.Effect, GLib.Object {
				protected uint8 blue;
				protected uint8[] bytes;
				protected uint8 green;
				public Raw (uint8[] bytes);
			}
			[CCode (cheader_filename = "libluxafor.h")]
			public class Shutdown : Luxacode.Device.Effect.Effect, GLib.Object {
				public Shutdown ();
			}
			[CCode (cheader_filename = "libluxafor.h")]
			public interface Effect : GLib.Object {
				public abstract void handle (Luxacode.Device.Luxafor luxafor) throws EffectError;
			}
		}
		namespace Finder {
			[CCode (cheader_filename = "libluxafor.h")]
			public class LuxaforFinder : Luxacode.Device.Finder.UsbDeviceFinder, GLib.Object {
				public LuxaforFinder (LibUSB.Context context);
			}
			[CCode (cheader_filename = "libluxafor.h")]
			public interface UsbDeviceFinder : GLib.Object {
				public abstract LibUSB.Device find () throws DeviceError;
			}
		}
		[CCode (cheader_filename = "libluxafor.h")]
		public class Luxafor {
			public Luxafor (LibUSB.Context context) throws LuxaforError;
			public void close ();
			public void send (Luxacode.Device.Effect.Effect effect) throws LuxaforError;
			public void write (uint8[] data) throws DeviceError;
		}
	}
}
[CCode (cheader_filename = "libluxafor.h")]
public errordomain LuxaforError {
	ERR_DEVICE_LOOKUP,
	ERR_DEVICE_COM
}
[CCode (cheader_filename = "libluxafor.h")]
public errordomain DeviceError {
	DEVICE_NOT_FOUND,
	ERROR_GET_DEVICE_HANDLE,
	WRITE_ERROR
}
[CCode (cheader_filename = "libluxafor.h")]
public errordomain EffectError {
	WRITE_ERROR
}