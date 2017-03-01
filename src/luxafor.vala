namespace Luxafor.Cli {
	
	public class LuxaforCli : Object {

		public static int main (string[] args) {
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
				    "  - When you plug the Luxafor, does it light from red to green during 2 seconds ? If not, try on another USB port\n" +
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
	}
}
