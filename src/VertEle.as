package
{
	import org.flixel.*;
	
	public class VertEle extends FlxSprite
	{
		private var movingUp:Boolean = true;
		private var movingDown:Boolean = false;
		
		public function VertEle(X:Number=0,Y:Number=0)
		{
			super(X*16,Y*8)
			loadGraphic(Registry.velevator,false,false,16,8);
			
			this.maxVelocity.y = 15;
			this.drag.y = 400;
			
			this.solid = true;
			this.immovable = true;
			
			
		}
		
		override public function update():void
		{
			FlxG.overlap(this,Registry.uwaypoints,goDown);
			FlxG.overlap(this,Registry.dwaypoints,goUp);
			
			this.acceleration.y = this.maxVelocity.y;
			
			if(movingDown)
			{
				this.velocity.y = -this.maxVelocity.y;
			}
			if(movingUp)
			{
				this.velocity.y = this.maxVelocity.y;
			}	
			
			super.update();
		}	
		
		private function goDown(e:FlxSprite, w:FlxSprite):void
		{
			movingUp = false;
			movingDown = true;
		}
		
		private function goUp(e:FlxSprite, w:FlxSprite):void 
		{
			movingUp = true;
			movingDown = false;
		}
	}
}