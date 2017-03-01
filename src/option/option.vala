namespace Luxafor.Cli.Option {
	
	public abstract class Option : Object {
		
		public Option(string[] args) {

		}

		public abstract string get_name();

		public abstract Effect.Effect get_effect();
	}
}
