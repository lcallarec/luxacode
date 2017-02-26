namespace Luxafor.Device {

	/**
	 * @author Laurent Callarec <l.callarec@gmail.com>
	 */ 
	public interface UsbDeviceFinder : GLib.Object {
		public abstract LibUSB.Device? find();
	}
}
