namespace Luxafor.Cli.Command {
	
	private int intensity = 255;
	private int red   = 0; 
	private int green = 0;
	private int blue  = 0;
		
	public class Color : Object {
		
		public Color(string[] args) {

			GLib.OptionEntry[] options = {
				OptionEntry() {
					long_name = "intensity",
					short_name = 'i',
					flags = 0,
					arg = GLib.OptionArg.INT,
					arg_data = &intensity,
					description = "Light intensity [0-255]",
					arg_description = "INTENSITY"
				},
				OptionEntry() {
					long_name = "red",
					short_name = 'r',
					flags = 0,
					arg = OptionArg.INT,
					arg_data = &red,
					description = "Red layer [0-255]",
					arg_description = null
				},
				OptionEntry() {
					long_name = "green",
					short_name = 'g',
					flags = 0,
					arg = OptionArg.INT,
					arg_data = &green,
					description = "Green layer [0-255]",
					arg_description = null
				}	,
				OptionEntry() {
					long_name = "blue",
					short_name = 'b',
					flags = 0,
					arg = OptionArg.INT,
					arg_data = &blue,
					description = "Blue layer [0-255]",
					arg_description = null
				}
			};

			try {
				var opt_context = new OptionContext("- Color exemple");
				opt_context.set_help_enabled(true);
				opt_context.add_main_entries(options, null);
				opt_context.parse(ref args);
			} catch (OptionError e) {
				stderr.printf ("error: %s\n", e.message);
				stdout.printf ("Run '%s --help' to see a full list of available command line options.\n", args[0]);
			}
	
		}

		public Effect.Color? get_effect() {
			return new Effect.Color((uint8) intensity, (uint8) red, (uint8) green, (uint8) blue);
		}
	}
}
