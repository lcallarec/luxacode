namespace Luxafor.Cli.Option {
	
	public abstract class Option : Object {
		
		private bool _is_valid;
		
		public Option(string[] args) {
			_is_valid = validate();
		}

		public bool is_valid() {
			return _is_valid;
		}

		public abstract string get_name();

		public abstract Effect.Effect get_effect();
		
		public abstract bool validate();
	}
}
