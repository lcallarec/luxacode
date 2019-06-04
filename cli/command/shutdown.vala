using Luxacode.Device.Effect;

namespace Luxacode.Cli.Command {

	public class Shutdown : Command {

		public override string get_name() {
			return "shutdown";
		}

		public override Luxacode.Device.Effect.Effect get_effect() {
			return new Luxacode.Device.Effect.Shutdown();
		}
		
		public override bool validate(string[] args) {
			return true;
		}
	}
}
