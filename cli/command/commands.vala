using Luxacode.Device.Effect;

namespace Luxacode.Cli.Command {
	
	private Command[] commands;
	
	public class Commands : Object {
		
 		public void register(Command command) {
			commands += command;
		}
		
		public bool is_registered(string name) {
			return null != find_option_from_name(name);
		}
		
		public Luxacode.Device.Effect.Effect? get_effect_for(string name) {
			
			Command? command = find_option_from_name(name);
			if (command != null) {
				return command.get_effect();
			}
		
			return null;
		}
		
		public bool validate(string name, string[] args) {
			Command? command = find_option_from_name(name);
			if (command != null) {
				return command.validate(args);
			}
			
			return false;
			
		}
		
		private Command? find_option_from_name(string name) {
			
			foreach (Command command in commands) {
				if (command.get_name() == name) {
					return command;
				}
			}	
			
			return null;
		}
	}
}
