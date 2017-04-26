namespace Luxacode.Device.Finder {

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
		
		public LibUSB.Device find() throws DeviceError {
			
			LibUSB.Device[] devices;
			context.get_device_list (out devices);
			
			try {
				return find_luxafor_device(devices);
			} catch (DeviceError error) {
				throw error;
			}
		}
			
		private LibUSB.Device find_luxafor_device(LibUSB.Device[] devices) throws DeviceError {
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

			throw new DeviceError.DEVICE_NOT_FOUND("Luxafor USB Device with vendorID=%04x and productID=%04x wasn't found.".printf(LUXAFOR_VID, LUXAFOR_PID));
		}
	}
}
