using global::Luxacode.Device;

namespace Luxacode.Device.Effect {

	/**
	 * @author Laurent Callarec <l.callarec@gmail.com>
	 */ 
	public interface Effect : Object {
		
		public abstract void handle(Luxafor luxafor) throws EffectError;
	}
}
