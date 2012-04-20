package
{
	import org.flixel.*;
		
	public class MenuState extends FlxState
	{
		//Variables got here
		public var myTitle:Title = new Title();
		
		public function MenuState()
		{
			super();
		}
		
		override public function create():void
		{
			
			myTitle.loadGraphic(Registry.title,false,false);
			add(myTitle);
			
			
		}
		
		override public function update():void
		{
			if(FlxG.keys.justPressed("SPACE"))
				FlxG.switchState(new PlayState());	//<--- using new state change code for flixel 2.5		
			super.update();
		}
	}
}