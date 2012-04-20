package
{
	import org.flixel.*;
	
	public class uWaypoint extends FlxSprite
	{
		public function uWaypoint(X:Number=0,Y:Number=0)
		{
			super(X*8,Y*8)
			loadGraphic(Registry.uWaypoint,false,false,8,8);
		}
		
		override public function update():void
		{
			super.update();
		}
	}
}