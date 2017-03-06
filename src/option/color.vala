namespace Luxafor.Cli.Option {
	
	private int red   = -1; 
	private int green = -1;
	private int blue  = -1;
		
	public class Color : Option {

		public override string get_name() {
			return "color";
		}

		public override Effect.Effect get_effect() {
			return new Effect.Color((uint8) red, (uint8) green, (uint8) blue);
		}
		
		public override bool validate(string[] args) {

			GLib.OptionEntry[] options = {
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
				return false;
			}

			if (false == this.validate_8bits_inputs(3, red, green, blue)) {
				return false;
			}

			if (red < 0 && green < 0 && blue < 0) {
				stderr.printf("You must at least set one color : --red=[0-255], --green[0-255] or --blue[0-255] (-r [0-255], -g [0-255] -b [0-255]).\n");
				return false;
			}
			
			if (red < 0) {
				red = 0;
			}
			
			if (green < 0) {
				green = 0;
			}
			
			if (blue < 0) {
				blue = 0;
			}
			
			return true;
		}
	}
}
