/**
 * @author Laurent Callarec <l.callarec@gmail.com>
 */
namespace Luxacode.Cli.Option {
	
	using global::Luxacode.Device.Effect;
	
	public class Shutdown : Option {

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
