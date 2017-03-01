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
			foreach (Option option in options) {
				if (option.get_name() == name) {
					return true;
				}
			}
			
			return false;
		}
		
		public Effect.Effect? get_effect_for(string name) {
			foreach (Option option in options) {
				if (option.get_name() == name) {
					return option.get_effect();
				}
			}
			
			return null;
		}
	}
}
