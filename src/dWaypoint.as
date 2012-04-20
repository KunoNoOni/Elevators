package
{
	import org.flixel.*;
	
	public class dWaypoint extends FlxSprite
	{
		public function dWaypoint(X:Number=0,Y:Number=0)
		{
			super(X*8,Y*8)
			loadGraphic(Registry.dWaypoint,false,false,8,8);
		}
		
		override public function update():void
		{
			super.update();
		}
	}
}