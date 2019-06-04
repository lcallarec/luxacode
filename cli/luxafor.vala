using Luxacode;
using Luxacode.Device;	
using Luxacode.Device.Effect;	

namespace Luxacode.Cli {
		
	public class App : Object {

		private static Command.Commands commands = new Command.Commands();

		public static int main (string[] args) {
			
			commands.register(new Command.Color());
			commands.register(new Command.Shutdown());
			commands.register(new Command.RandomColor());
			commands.register(new Command.Raw());
			commands.register(new Command.FadeToColor());
			
			if (false == validate(args, commands)) {
				return 2;
			}
			
			LibUSB.Context context;			
			LibUSB.Context.init(out context); 

			try {
				Luxafor luxafor = new Luxafor(context);
				Luxacode.Device.Effect.Effect? effect = commands.get_effect_for(args[1]);
				if (effect != null) {
					luxafor.send(effect);	
				}
			} catch (LuxaforError error) {
				stderr.printf("Error : \n=======\n%s\n\nPlease eventually check :\n" +
				    "  - When you plugged the Luxafor, does it light from red to green during 2 seconds ? If not, try on another USB port\n" +
				    "  - Still not working ? Try another USB wire.\n", error.message
				);
				return 1;
			}
			
			return 0;
		}
		
		private static bool validate(string[] args, Command.Commands commands) {
			
			if(args[1] == null) {
				stderr.printf("Please try a valid command :\n");
				output_commands_help();
				return false;
			}
			
			if (args.length == 1) {
				stderr.printf("You must pass a valid command as first argument. Please try one command as following :\n");
				output_commands_help();
				return false;
			}

			
			if (false == commands.is_registered(args[1])) {
				stderr.printf("\"%s\" is not a known command. Please try a valid command :\n", args[1]);
				output_commands_help();
				return false;
			}
			
			return commands.validate(args[1], args);
		}
		
		private static void output_commands_help() {
			stdout.printf("luxafor color [--help]\n");
			stdout.printf("luxafor shutdown \n");			
			stdout.printf("luxafor random-color \n");
			stdout.printf("luxafor raw [--help]\n");
			stdout.printf("luxafor fade-to-color [--help]\n");			
		}
	}
}
