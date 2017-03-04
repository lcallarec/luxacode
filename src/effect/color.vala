namespace Luxafor.Effect {

	/**
	 * @author Laurent Callarec <l.callarec@gmail.com>
	 */ 
	public class Color : Effect, Object {
		
		protected uint8 red;
		protected uint8 green;
		protected uint8 blue;

		public Color(uint8 red, uint8 green, uint8 blue) {
			this.red    = red;
			this.green  = green;
			this.blue   = blue;
		}
		
		public void handle(Luxafor luxafor) throws EffectError {
			try {
				luxafor.write({1, 255, red, green, blue, 0, 0});
			} catch (DeviceError error) {
				throw new EffectError.WRITE_ERROR("Error writing 'Color' effect : %s\n".printf(error.message));
			}
		}
	}
}
