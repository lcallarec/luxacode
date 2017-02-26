namespace Luxafor.Device {

	/**
	 * @author Laurent Callarec <l.callarec@gmail.com>
	 */ 
	public class LuxaforFinder : UsbDeviceFinder, GLib.Object {
		
		/** Luxafor usb device vendor ID */
		const int LUXAFOR_VID = 0x04d8;
		/** Luxafor usb device product ID */
		const int LUXAFOR_PID = 0xf372;
		/** Luxafor device bInterfaceNumber */
		const int DEVICE_INTERFACE_NUMBER = 0;

		private unowned LibUSB.Context context;
		
		public LuxaforFinder(LibUSB.Context context) {
			this.context = context;
		} 
		
		public LibUSB.Device? find() {

			LibUSB.Device[] devices;
			context.get_device_list (out devices);
			return find_luxafor_device(devices);
				
		}
			
		private LibUSB.Device? find_luxafor_device(LibUSB.Device[] devices) {
			int i = 0;
			while (devices[i] != null)
			{
				var dev = devices[i];

				LibUSB.DeviceDescriptor desc = LibUSB.DeviceDescriptor (dev);
				if (desc.idVendor == LUXAFOR_VID && desc.idProduct == LUXAFOR_PID)
				{
					return dev;
				}
				i++;
			}

			return null;
		}
	}
}
