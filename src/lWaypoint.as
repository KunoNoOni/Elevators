package
{
	import org.flixel.*;
	
	public class lWaypoint extends FlxSprite
	{
		public function lWaypoint(X:Number=0,Y:Number=0)
		{
			super(X*8,Y*8)
			loadGraphic(Registry.lWaypoint,false,false,8,8);
		}
		
		override public function update():void
		{
			super.update();
		}
	}
}