package
{
	import org.flixel.*;
	
	public class Hearts extends FlxSprite
	{
	
		public function Hearts(X:Number=0,Y:Number=0)
		{
			super(X*8,Y*8)
			loadGraphic(Registry.heart,false,false,8,8);
		}
		
		override public function update():void
		{
			super.update();
		}
	}
}