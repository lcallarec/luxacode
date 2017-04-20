namespace Luxacode.Device.Finder {

	/**
	 * @author Laurent Callarec <l.callarec@gmail.com>
	 */ 
	public interface UsbDeviceFinder : GLib.Object {
		public abstract LibUSB.Device find() throws DeviceError;
	}
}
