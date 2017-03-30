namespace Luxafor.Effect {

	/**
	 * @author Laurent Callarec <l.callarec@gmail.com>
	 */ 
	public class FadeToColor : Effect, Object {

		Color color;
		
		public uint8 speed {
			public get; construct set;
		}
		
		public FadeToColor(Color color, uint8 speed) {
			this.color = color;
			this.speed = speed;
		}
		
		public void handle(Luxafor luxafor) throws EffectError {
			try {
				luxafor.write({2, 255, color.red, color.green, color.blue, speed, 0});
			} catch (DeviceError error) {
				throw new EffectError.WRITE_ERROR("Error writing 'Color' effect : %s\n".printf(error.message));
			}
		}
	}
}
