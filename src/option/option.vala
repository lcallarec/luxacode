namespace Luxafor.Cli.Option {
	
	public abstract class Option : Object {
		
		public abstract string get_name();

		public abstract Effect.Effect get_effect();
		
		public abstract bool validate(string[] args);
	}
}
