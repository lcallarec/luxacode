namespace Luxafor.Cli.Option {
	
	using global::Luxafor.Effect;
	
	private Option[] options;
	
	public class RegisterStack : Object {
		
		public RegisterStack() {
	
		}

		public void register(Option option) {
			options += option;
		}
		
		public bool can_handle(string name) {
			return null != find_option_from_name(name);
		}
		
		public Effect.Effect? get_effect_for(string name) {
			
			Option? option = find_option_from_name(name);
			if (option != null) {
				return option.get_effect();
			}
		
			return null;
		}
		
		public bool validate(string name) {
			Option? option = find_option_from_name(name);
			if (option != null) {
				return option.is_valid();
			}
			
			return false;
			
		}
		
		private Option? find_option_from_name(string name) {
			
			foreach (Option option in options) {
				if (option.get_name() == name) {
					return option;
				}
			}	
			
			return null;
		}
	}
}
