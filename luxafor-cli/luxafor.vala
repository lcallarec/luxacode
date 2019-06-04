/**
 * @author Laurent Callarec <l.callarec@gmail.com>
 */
namespace Luxacode.Cli {

	using global::Luxacode;
	using global::Luxacode.Device;	
	using global::Luxacode.Device.Effect;	
	
	public class Cli : Object {

		private static Option.RegisterStack register_stack;

		public static int main (string[] args) {
			
			register_stack = new Option.RegisterStack();
			register_stack.register(new Option.Color());
			register_stack.register(new Option.Shutdown());
			register_stack.register(new Option.RandomColor());
			register_stack.register(new Option.Raw());
			register_stack.register(new Option.FadeToColor());
			
			if (false == validate(args, register_stack)) {
				return 2;
			}
			
			LibUSB.Context context;			
			LibUSB.Context.init(out context); 

			try {
				Luxafor luxafor = new Luxafor(context);
				Luxacode.Device.Effect.Effect? effect = register_stack.get_effect_for(args[1]);
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
		
		private static bool validate(string[] args, Option.RegisterStack register_stack) {
			
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

			
			if (false == register_stack.can_handle(args[1])) {
				stderr.printf("\"%s\" is not a known command. Please try a valid command :\n", args[1]);
				output_commands_help();
				return false;
			}
			
			return register_stack.validate(args[1], args);
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
