namespace Luxafor.Cli.Option {
	
	public abstract class Option : Object {
		
		public abstract string get_name();

		public abstract Effect.Effect get_effect();
		
		public abstract bool validate(string[] args);
		
		protected bool validate_8bits_inputs(...) {
			var l = va_list();

			for (int i = 0; i <3; i++) {
				int? _value = l.arg<int>();
				if (_value > 255 || _value < -1) {
					return false;
				}
			}
			
			return true;
		}
	}
}
