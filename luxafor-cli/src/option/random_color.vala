/**
 * @author Laurent Callarec <l.callarec@gmail.com>
 */
namespace Luxafor.Cli.Option {
	
	public class RandomColor : Option {

		public override string get_name() {
			return "random-color";
		}

		public override Effect.Effect get_effect() {
			return new Effect.RandomColor();
		}
		
		public override bool validate(string[] args) {
			return true;
		}
	}
}
