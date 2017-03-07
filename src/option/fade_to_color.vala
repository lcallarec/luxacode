namespace Luxafor.Cli.Option {
	
	private int speed = 127;
		
	public class FadeToColor : Color {

		public override string get_name() {
			return "fade-to-color";
		}

		public override Effect.Effect get_effect() {
			return new Effect.FadeToColor(new Effect.Color((uint8) red, (uint8) green, (uint8) blue), (uint8) speed);
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
				},
				OptionEntry() {
					long_name = "blue",
					short_name = 'b',
					flags = 0,
					arg = OptionArg.INT,
					arg_data = &blue,
					description = "Blue layer [0-255]",
					arg_description = null
				},
				OptionEntry() {
					long_name = "speed",
					short_name = 's',
					flags = 0,
					arg = OptionArg.INT,
					arg_data = &speed,
					description = "Speed [0-255], from the fastest to the slowest",
					arg_description = null
				}
			};

			try {
				var opt_context = new OptionContext("- FadeToColor exemple");
				opt_context.set_help_enabled(true);
				opt_context.add_main_entries(options, null);
				opt_context.parse(ref args);
			} catch (OptionError e) {
				stderr.printf ("Error: %s\n", e.message);
				stdout.printf ("Run '%s --help' to see a full list of available command line options.\n", args[0]);
				return false;
			}

			if (false == this.validate_8bits_inputs(4, red, green, blue, speed)) {
				stderr.printf ("Error: arguments values must be an integer between 0 and 255.\n");
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
