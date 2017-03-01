namespace Luxafor.Cli {
	
	public class LuxaforCli : Object {

		private static Option.RegisterStack register_stack;

		public static int main (string[] args) {
			
			register_stack = new Option.RegisterStack();
			register_stack.register(new Option.Color(args)); 
			
			if (false == validate(args)) {
				return 2;
			}
			
			LibUSB.Context context;			
			LibUSB.Context.init(out context); 
			Luxafor luxafor = new Luxafor(context);
			if (luxafor.is_ready()) {
				luxafor.send(register_stack.get_effect_for(args[1]));	
			} else {
				stderr.printf("Luxafor not found.\nPlease check :\n" +
				    "  - When you plugged the Luxafor, does it light from red to green during 2 seconds ? If not, try on another USB port\n" +
				    "  - Still not working ? Try another USB wire.\n"
				);
				return 1;
			}
			
			return 0;
		}
		
		private static bool validate(string[] args) {
			if (args.length == 1) {
				stderr.printf("You must pass a valid command as first argument. Please try one command as following :\n");
				output_commands_help();
				return false;
			}
			
			if (false == register_stack.can_handle(args[1])) {
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
