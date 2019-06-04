using Luxacode.Device.Effect;

namespace Luxacode.Cli.Command {

	public class RandomColor : Command {

		public override string get_name() {
			return "random-color";
		}

		public override Luxacode.Device.Effect.Effect get_effect() {
			return new Luxacode.Device.Effect.RandomColor();
		}
		
		public override bool validate(string[] args) {
			return true;
		}
	}
}
