namespace Luxafor {

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
		private Device.UsbDeviceFinder finder;
		private unowned LibUSB.Context context;
		private bool is_ready = false;

		public Luxafor(LibUSB.Context context) {
			this.context = context;
			
			this.finder = new Device.LuxaforFinder(context);
			this.device = finder.find();
			
			is_ready = (device != null);
		}
		
		public bool is_ready() {
			return is_ready;
		}
		
		public void close() {
			handle.detach_kernel_driver(Luxafor.INTERFACE_ID);
			handle = null;
		}
		
		public void write(uint8[] data) {
			
			extract_handle();			
			claim_device();
			int len;
			handle.bulk_transfer(1, data, out len, Luxafor.WRITE_TIMEOUT);
		}
		
		public void send(Effect.Effect effect) {
			effect.handle(this);
		}
		
		private void extract_handle() {
			device.open(out handle);
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
