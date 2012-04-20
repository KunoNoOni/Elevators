package
{
	import org.flixel.*;
	
	[SWF(width="400", height="400", backgroundColor="#000000")]
	[Frame(factoryClass="Preloader")]
	
	public class Elevators extends FlxGame
	{
		public function Elevators()
		{
			super(100,100,MenuState,4);
			//forceDebugger = true;
			//FlxG.visualDebug = true;
			//FlxG.debug = true;
		}
	}
}