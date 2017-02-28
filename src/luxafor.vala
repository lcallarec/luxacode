namespace Luxafor.Cli {
	
	public class LuxaforCli : Object {

		public static int main (string[] args) {
			LibUSB.Context context;			
			LibUSB.Context.init(out context); 
			Luxafor? luxafor = new Luxafor(context);
			if (luxafor != null) {
				
				Effect.Color? color = get_effect(args);
				if (color != null) {
					luxafor.send(color);	
				} else {
					stderr.printf("Unkown option.");
				}
				
			} else {
				stderr.printf("Luxafor not found\n");
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
