namespace Luxacode.Device {

	/**
	 * @author Laurent Callarec <l.callarec@gmail.com>
	 */ 
	public class Luxafor {
		
		/** Luxafor device bInterfaceNumber */
		const int DEVICE_INTERFACE_NUMBER = 0;
							
		/** Number of times the lib retry claiming the device to the kernel */
		const int CLAIM_DEVICE_RETRIES = 5000;
		
		private LibUSB.DeviceHandle handle;
		private LibUSB.Device device;
		private static int INTERFACE_ID = 0;
		private static int WRITE_TIMEOUT = 10;
		private Finder.UsbDeviceFinder finder;
		private unowned LibUSB.Context context;

		public Luxafor(LibUSB.Context context) throws LuxaforError {
			this.context = context;
			
			this.finder = new Luxacode.Device.Finder.LuxaforFinder(context);
			
			try {
				this.device = finder.find();
			} catch (DeviceError error) {
				throw new LuxaforError.ERR_DEVICE_LOOKUP("LuxaforError.ERR_CONNECT_DEVICE (unrecoverable error) : \n%s".printf(error.message));
			}
		}
		
		public void close() {
			handle.detach_kernel_driver(Luxafor.INTERFACE_ID);
			handle = null;
		}
		
		public void write(uint8[] data) throws DeviceError {
			
			extract_handle();			
			claim_device();
			int len;
			handle.bulk_transfer(1, data, out len, Luxafor.WRITE_TIMEOUT);
		}
		
		public void send(Luxacode.Device.Effect.Effect effect) throws LuxaforError {
			try {
				effect.handle(this);
			}
			catch(EffectError error) {
				throw new LuxaforError.ERR_DEVICE_COM(error.message);
			}
		}
		
		private void extract_handle() throws DeviceError {
			
			int result = device.open(out handle);
			
			if (result != 0) {
				throw new DeviceError.ERROR_GET_DEVICE_HANDLE(
					"Error %d while calling `device.open(out handle)` to get back the DeviceHandle.\n".printf(result) +
					"Did you run your progam with sufficient privileges to access USB device ? If not, try running your program with su privileges.");
			}
		}
		
		private int claim_device() {

			handle.detach_kernel_driver(Luxafor.DEVICE_INTERFACE_NUMBER);
			
			int retries = Luxafor.CLAIM_DEVICE_RETRIES;
			
			int claim_device_result;
			while ((claim_device_result = handle.claim_interface(Luxafor.DEVICE_INTERFACE_NUMBER)) != 0 && retries-- > 0) {
				handle.detach_kernel_driver(Luxafor.DEVICE_INTERFACE_NUMBER);
			}
	 
			return claim_device_result;
		}
	}
}
