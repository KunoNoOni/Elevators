package
{
	import org.flixel.*;
	
	public class HorizEle extends FlxSprite
	{
		private var movingLeft:Boolean = true;
		private var movingRight:Boolean = false;
		
		public function HorizEle(X:Number=0,Y:Number=0)
		{
			super(X*16,Y*8)
			loadGraphic(Registry.velevator,false,false,16,8);
			
			this.maxVelocity.x = 15;
			this.drag.x = 400;
			
			this.solid = true;
			this.immovable = true;
			
		}
		
		override public function update():void
		{
			FlxG.overlap(this,Registry.lwaypoints,goRight);
			FlxG.overlap(this,Registry.rwaypoints,goLeft);
			
			this.acceleration.x = this.maxVelocity.x;
			
			if(movingLeft)
			{
				this.velocity.x = -this.maxVelocity.x;
			}
			if(movingRight)
			{
				this.velocity.x = this.maxVelocity.x;
			}	
			
			super.update();
		}	
		
		private function goRight(e:FlxSprite, w:FlxSprite):void
		{
			movingLeft = false;
			movingRight = true;
		}
		
		private function goLeft(e:FlxSprite, w:FlxSprite):void 
		{
			movingLeft = true;
			movingRight = false;
		}
	}
}