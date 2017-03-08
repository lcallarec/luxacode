/**
 * @author Laurent Callarec <l.callarec@gmail.com>
 */
namespace Luxafor.Cli.Option {
	
	public abstract class Option : Object {
		
		public abstract string get_name();

		public abstract Effect.Effect get_effect();
		
		public abstract bool validate(string[] args);
		
		protected bool validate_8bits_inputs(uint8 size, ...) {
			
			var list = va_list();

			for (int i = 0; i < size; i++) {
				int? _value = list.arg<int>();
				if (_value > 255 || _value < -1) {
					return false;
				}
			}
			
			return true;
		}
	}
}
