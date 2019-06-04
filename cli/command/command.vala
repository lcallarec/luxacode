using Luxacode.Device.Effect;

namespace Luxacode.Cli.Command {


	public abstract class Command : Object {
		
		public abstract string get_name();

		public abstract Luxacode.Device.Effect.Effect get_effect();
		
		public abstract bool validate(string[] args);
		
		/**
		 * @size parameter must equal the number of varargs, that's simpler to iterate through them
		 * @varargs uint8 inputss 
		 */ 
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
