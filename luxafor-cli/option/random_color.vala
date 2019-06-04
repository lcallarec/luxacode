/**
 * @author Laurent Callarec <l.callarec@gmail.com>
 */
namespace Luxacode.Cli.Option {
	
	using global::Luxacode.Device.Effect;
	
	public class RandomColor : Option {

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
