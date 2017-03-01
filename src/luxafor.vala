namespace Luxafor.Cli {
	
	public class LuxaforCli : Object {


		private static string[] commands = {
			"color"
		};


		public static int main (string[] args) {
			
			if (false == validate(args)) {
				return 2;
			}
			
			LibUSB.Context context;			
			LibUSB.Context.init(out context); 
			Luxafor luxafor = new Luxafor(context);
			if (luxafor.is_ready()) {
				
				Effect.Color? color = get_effect(args);
				if (color != null) {
					luxafor.send(color);	
				} else {
					stderr.printf("Unkown option.\n");
				}
				
			} else {
				stderr.printf("Luxafor not found.\nPlease check :\n" +
				    "  - When you plugged the Luxafor, does it light from red to green during 2 seconds ? If not, try on another USB port\n" +
				    "  - Still not working ? Try another USB wire.\n"
				);
				return 1;
			}
			
			return 0;
		}

		public static Effect.Color? get_effect(string[] args) {
			switch(args[1]) {
				case "color":
					var command = new Command.Color(args);
					return command.get_effect();
				default:
					return null;
			}
		}
		
		private static bool validate(string[] args) {
			if (args.length == 1) {
				stderr.printf("You must pass a valid command as first argument. Please try one command as following :\n");
				output_commands_help();
				return false;
			}
			
			bool is_command_registered = false;
			foreach (string command in commands) {
				if (command == args[1]) {
					is_command_registered = true;
				}
			}
			
			if (false == is_command_registered) {
				stderr.printf("\"%s\" is not a known command. Please try one command as following :\n", args[1]);
				output_commands_help();
				return false;
			}
			
			return true;
		}
		
		private static void output_commands_help() {
			stdout.printf("luxafor-cli color [--help]\n");
		}
		
	}
}
