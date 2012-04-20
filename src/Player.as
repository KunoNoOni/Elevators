package
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	
	public class Player extends FlxSprite
	{
		public function Player(X:Number=0, Y:Number=0)
		{
			super(X*8,Y*8);
			loadGraphic(Registry.player,true,true,8,8);
			addAnimation("walking",[0,1,2,3],10);
			addAnimation("jumping",[2],10);
			addAnimation("standing",[0],10);
					
			acceleration.y = 400;
			drag.x = 400;
			maxVelocity.x = 50;
			maxVelocity.y = 135;
					
		}
		
		override public function update():void
		{
			acceleration.x = 0;
			
			if(FlxG.keys.LEFT)
			{
				if(x > 0)
				{
					this.facing = LEFT;
					acceleration.x = -50;
				}
			}
			
			
			if(FlxG.keys.RIGHT)
			{
				if(x < (FlxG.stage.stageWidth-this.width))
				{					
					this.facing = RIGHT;
					acceleration.x = 50;
				}
			}
			
			if(FlxG.keys.justPressed('SPACE') && isTouching(DOWN))
			{
				FlxG.play(Registry.jump,.8);
				velocity.y = -135;
			}
			
			if(velocity.y != 0)
				play("jumping");
		
			if(velocity.x != 0)
				play("walking");
			else
				play("standing");
			
			super.update();
		}
	}
}