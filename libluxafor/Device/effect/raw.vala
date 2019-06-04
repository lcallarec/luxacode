using global::Luxacode.Device;

namespace Luxacode.Device.Effect {

	/**
	 * This effect is used to send user-defined raw bytes to the Luxafor USB device.
	 * Send raw data - if you don't know what you are doing - may need a device restart (plug / unplug) is something goes wrong on the Luxafor side
	 * 
	 * @author Laurent Callarec <l.callarec@gmail.com>
	 */ 
	public class Raw : Effect, Object {
		
		protected uint8[] bytes;
		protected uint8 green;
		protected uint8 blue;

		public Raw(uint8[] bytes) {
			this.bytes = bytes;
		}
		
		public void handle(Luxafor luxafor) throws EffectError {
			try {
				luxafor.write(bytes);
			} catch (DeviceError error) {
				throw new EffectError.WRITE_ERROR(
				"Error writing 'Raw' effect with : {%d, %d, %d, %d, %d, %d, %d} values : %s\n".printf(
				bytes[0], bytes[1], bytes[2], bytes[3], bytes[4], bytes[5], bytes[6], error.message));
			}
		}
	}
}
