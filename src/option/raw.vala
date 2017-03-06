namespace Luxafor.Cli.Option {
	
	private int a = -1; 
	private int b = -1;
	private int c = -1;
	private int d = -1;
	private int e = -1;
	private int f = -1;
	private int g = -1;
	
		
	public class Raw : Option {

		public override string get_name() {
			return "raw";
		}

		public override Effect.Effect get_effect() {
			return new Effect.Raw({(uint8) a, (uint8) b, (uint8) c, (uint8) d, (uint8) e, (uint8) f, (uint8) g});
		}
		
		public override bool validate(string[] args) {

			GLib.OptionEntry[] options = {
				OptionEntry() {
					long_name = "a",
					short_name = 'a',
					flags = 0,
					arg = OptionArg.INT,
					arg_data = &a,
					description = "First value [0-255]",
					arg_description = null
				},
				OptionEntry() {
					long_name = "b",
					short_name = 'b',
					flags = 0,
					arg = OptionArg.INT,
					arg_data = &b,
					description = "Second value [0-255]",
					arg_description = null
				},
				OptionEntry() {
					long_name = "c",
					short_name = 'c',
					flags = 0,
					arg = OptionArg.INT,
					arg_data = &c,
					description = "Third value [0-255]",
					arg_description = null
				},
				OptionEntry() {
					long_name = "d",
					short_name = 'd',
					flags = 0,
					arg = OptionArg.INT,
					arg_data = &d,
					description = "Fourth value [0-255]",
					arg_description = null
				},
				OptionEntry() {
					long_name = "e",
					short_name = 'e',
					flags = 0,
					arg = OptionArg.INT,
					arg_data = &e,
					description = "Fifth value [0-255]",
					arg_description = null
				},
				OptionEntry() {
					long_name = "f",
					short_name = 'f',
					flags = 0,
					arg = OptionArg.INT,
					arg_data = &f,
					description = "Sixth value [0-255]",
					arg_description = null
				},
				OptionEntry() {
					long_name = "g",
					short_name = 'g',
					flags = 0,
					arg = OptionArg.INT,
					arg_data = &g,
					description = "Seventh value [0-255]",
					arg_description = null
				},
			};

			try {
				var opt_context = new OptionContext("- Raw exemple");
				opt_context.set_help_enabled(true);
				opt_context.add_main_entries(options, null);
				opt_context.parse(ref args);
			} catch (OptionError e) {
				stderr.printf ("error: %s\n", e.message);
				stdout.printf ("Run '%s --help' to see a full list of available command line options.\n", args[0]);
				return false;
			}

			if (false == this.validate_8bits_inputs(7, a, b, c, d, e, f, g)) {
				//return false;
			}

			if (a < 0 || b < 0 || c < 0 || d < 0 || e < 0 || f < 0 || g < 0) {
				stderr.printf("You must at set each of the seven mandatory input args : -a -b -c -d -e -f -g).\n");
				return false;
			}
					
			return true;
		}
	}
}
