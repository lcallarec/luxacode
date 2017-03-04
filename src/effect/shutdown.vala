namespace Luxafor.Effect {

	/**
	 * @author Laurent Callarec <l.callarec@gmail.com>
	 */ 
	public class Shutdown : Effect, Object {
		
		public void handle(Luxafor luxafor) throws EffectError {
			try {
				luxafor.write({1, 255, 0, 0, 0,0,0});
			} catch (DeviceError error) {
				throw new EffectError.WRITE_ERROR("Error writing 'Shutdown' effect : %s\n".printf(error.message));
			}
		}
	}
}
