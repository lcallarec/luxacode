using global::Luxacode.Device;

namespace Luxacode.Device.Effect {

	/**
	 * @author Laurent Callarec <l.callarec@gmail.com>
	 */ 
	public class RandomColor : Effect, Object {
		
		public void handle(Luxafor luxafor) throws EffectError {
			try {
				luxafor.write({1, 255, (uint8) Random.int_range(0, 255), (uint8) Random.int_range(0, 255), (uint8) Random.int_range(0, 255), 0, 0});
			} catch (DeviceError error) {
				throw new EffectError.WRITE_ERROR("Error writing 'RandomColor' effect : %s\n".printf(error.message));
			}
		}
	}
}
