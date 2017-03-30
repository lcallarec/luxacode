namespace Luxafor.Effect {

	/**
	 * @author Laurent Callarec <l.callarec@gmail.com>
	 */ 
	public interface Effect : Object {
		
		public abstract void handle(Luxafor luxafor) throws EffectError;
	}
}
