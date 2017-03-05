namespace Luxafor.Cli.Option {
	
	public class Shutdown : Option {

		public override string get_name() {
			return "shutdown";
		}

		public override Effect.Effect get_effect() {
			return new Effect.Shutdown();
		}
		
		public override bool validate(string[] args) {
			return true;
		}
	}
}
