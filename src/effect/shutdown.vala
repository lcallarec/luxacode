namespace Luxafor.Effect {

	/**
	 * 
	 * @author Laurent Callarec <l.callarec@gmail.com>
	 */ 
	public class Shutdown : Effect {
		
		public void handle(Luxafor luxafor) {
			luxafor.write({1, 255, 0, 0, 0,0,0});
		}
	}
}
