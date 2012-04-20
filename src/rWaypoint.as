package
{
	import org.flixel.*;
	
	public class rWaypoint extends FlxSprite
	{
		public function rWaypoint(X:Number=0,Y:Number=0)
		{
			super(X*8,Y*8)
			loadGraphic(Registry.rWaypoint,false,false,8,8);
		}
		
		override public function update():void
		{
			super.update();
		}
	}
}