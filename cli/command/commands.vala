using Luxacode.Device.Effect;

namespace Luxacode.Cli.Command {
	
	private Command[] options;
	
	public class Commands : Object {
		
 		public void register(Command Command) {
			options += Command;
		}
		
		public bool is_registered(string name) {
			return null != find_option_from_name(name);
		}
		
		public Luxacode.Device.Effect.Effect? get_effect_for(string name) {
			
			Command? Command = find_option_from_name(name);
			if (Command != null) {
				return Command.get_effect();
			}
		
			return null;
		}
		
		public bool validate(string name, string[] args) {
			Command? Command = find_option_from_name(name);
			if (Command != null) {
				return Command.validate(args);
			}
			
			return false;
			
		}
		
		private Command? find_option_from_name(string name) {
			
			foreach (Command Command in options) {
				if (Command.get_name() == name) {
					return Command;
				}
			}	
			
			return null;
		}
	}
}
