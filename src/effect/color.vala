namespace Luxafor.Effect {

	/**
	 * 
	 * @author Laurent Callarec <l.callarec@gmail.com>
	 */ 
	public class Color : Effect {
		
		protected uint8 intensity;
		protected uint8 red;
		protected uint8 green;
		protected uint8 blue;

		public Color(uint8 intensity, uint8 red, uint8 green, uint8 blue) {
			this.intensity = intensity;
			
			this.red    = red;
			this.green  = green;
			this.blue   = blue;
		}
		
		public void handle(Luxafor luxafor) {
			luxafor.write({1, intensity, red, green, blue, 0, 0});
		}
	}
}
