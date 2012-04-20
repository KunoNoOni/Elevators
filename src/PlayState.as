package
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	
	public class PlayState extends FlxState
	{
		//Variables go here
		public var level:FlxTilemap;
		public var levelE:FlxTilemap;
		public var levelW:FlxTilemap;
		private var HEle:HorizEle;
		private var VEle:VertEle;
		private var hearts:FlxGroup = new FlxGroup();
		private var vElevators:FlxGroup = new FlxGroup();
		private var hElevators:FlxGroup = new FlxGroup();
		private var heart:Hearts;
		private var player:Player;
		private var lwaypoint:lWaypoint;
		private var rwaypoint:rWaypoint;
		private var uwaypoint:uWaypoint;
		private var dwaypoint:dWaypoint;
		private var bg:FlxSprite = new FlxSprite();
		private var score:FlxText;
		private var currScore:int = 0;
		private var totalHearts:int=0;
		private var collectedHearts:int=0;
		private var winL1:FlxText;
		private var winL2:FlxText;
		private var timerSet:Boolean = false;
		private var wonGame:Boolean = false;
		private var t:FlxTimer = new FlxTimer();
	
				
		override public function create():void
		{	
			//Create a new tilemap using our level data
			level = new FlxTilemap();
			levelE = new FlxTilemap();
			levelW = new FlxTilemap();
			level.loadMap(new Registry[Registry.levels[Registry.currLvl]],Registry.buildTiles,8,8,0,0,3,6);
			levelE.loadMap(new Registry[Registry.levelsE[Registry.currLvl]],Registry.buildTiles2,16,8,0,0,1,1);
			levelW.loadMap(new Registry[Registry.levelsW[Registry.currLvl]],Registry.buildTiles3,8,8,0,0,2,2);
			bg.loadGraphic(Registry.bground,false,false,400,800);
			add(bg);
			add(level);
			swapTileForSprite();
			HUD();
			add(levelE);
			add(levelW);
			player = new Player(0,98);
			add(player);

			FlxG.camera.setBounds(0,0,level.width,level.height);
			FlxG.worldBounds = new FlxRect(0,0, 400, 800);
			FlxG.camera.follow(player, FlxCamera.STYLE_PLATFORMER);
		}	
		
		private function swapTileForSprite():void
		{
			var i:int;
			var ii:int;
			
			//for hearts
			for(i=0;i<Registry.mapWidth;i++)
			{
				for(ii=0;ii<Registry.mapHeight;ii++)
				{
					if(level.getTile(i,ii) == 5)
					{
						level.setTile(i,ii,0);
						totalHearts++;
						heart = new Hearts(i,ii);
						hearts.add(heart);
						add(heart);			
					}
				}
			}
			
			//for Vertical Elevator
			for(i=0;i<Registry.mapWidth;i++)
			{
				for(ii=0;ii<Registry.mapHeight;ii++)
				{
					if(levelE.getTile(i,ii) == 1)
					{
						levelE.setTile(i,ii,0);
						VEle = new VertEle(i,ii);
						vElevators.add(VEle);
						add(VEle);
					}
				}
			}
			
			//for Horizontal Elevator
			for(i=0;i<Registry.mapWidth;i++)
			{
				for(ii=0;ii<Registry.mapHeight;ii++)
				{
					if(levelE.getTile(i,ii) == 2)
					{
						levelE.setTile(i,ii,0);
						HEle = new HorizEle(i,ii);
						hElevators.add(HEle);
						add(HEle);
					}
				}
			}
			
			//for left waypoint
			for(i=0;i<Registry.mapWidth;i++)
			{
				for(ii=0;ii<Registry.mapHeight;ii++)
				{
					if(levelW.getTile(i,ii) == 2)
					{
						levelW.setTile(i,ii,0);
						lwaypoint = new lWaypoint(i,ii);
						Registry.lwaypoints.add(lwaypoint);
						add(lwaypoint);
						lwaypoint.visible = false;
					}
				}
			}
			
			//for right waypoint
			for(i=0;i<Registry.mapWidth;i++)
			{
				for(ii=0;ii<Registry.mapHeight;ii++)
				{
					if(levelW.getTile(i,ii) == 3)
					{
						levelW.setTile(i,ii,0);
						rwaypoint = new rWaypoint(i,ii);
						Registry.rwaypoints.add(rwaypoint);
						add(rwaypoint);
						rwaypoint.visible = false;
					}
				}
			}
			
			//for up waypoint
			for(i=0;i<Registry.mapWidth;i++)
			{
				for(ii=0;ii<Registry.mapHeight;ii++)
				{
					if(levelW.getTile(i,ii) == 4)
					{
						levelW.setTile(i,ii,0);
						uwaypoint = new uWaypoint(i,ii);
						Registry.uwaypoints.add(uwaypoint);
						add(uwaypoint);
						uwaypoint.visible = false;
					}
				}
			}
			
			//for down waypoint
			for(i=0;i<Registry.mapWidth;i++)
			{
				for(ii=0;ii<Registry.mapHeight;ii++)
				{
					if(levelW.getTile(i,ii) == 5)
					{
						levelW.setTile(i,ii,0);
						dwaypoint = new dWaypoint(i,ii);
						Registry.dwaypoints.add(dwaypoint);
						add(dwaypoint);
						dwaypoint.visible = false;
					}
				}
			}
		}
		
		private function HUD():void
		{
			score = new FlxText(0,0,100,"SCORE: "+currScore);
			score.setFormat(null,8,0xFFFFFF);
			add(score);
			score.scrollFactor.x = score.scrollFactor.y = 0;
		}
		
		
		override public function update():void
		{
			FlxG.overlap(hearts, player, removeHearts);
			
			if(wonGame)
			{
				delay();
				if(!timerSet)
				{
					resetGame();
				}
			}

			super.update();
			
			FlxG.collide(level, player);
			FlxG.collide(vElevators, player);
			FlxG.collide(hElevators, player);
		}
		
		private function removeHearts(h:FlxSprite, p:FlxSprite):void
		{
			h.kill();
			currScore += 10;
			collectedHearts++;
			score.text = "SCORE: "+currScore;
			FlxG.play(Registry.pc,.8);
			//trace("Collected Hearts: " +collectedHearts+" "+"Total Hearts: "+totalHearts);
			if(collectedHearts == totalHearts)
			{
				winGame();
			}
		}
		
		private function winGame():void
		{
			//trace("displaying winGame Text");
			winL1 = new FlxText(0,20,100,"Level Cleared!");
			winL1.setFormat(null,8,0xFFFFFF, "center");
			add(winL1);
			winL1.scrollFactor.x = winL1.scrollFactor.y = 0;
			winL2 = new FlxText(0,30,100,"Let's do it again!");
			winL2.setFormat(null,8,0xFFFFFF, "center");
			add(winL2);
			winL2.scrollFactor.x = winL2.scrollFactor.y = 0;
			wonGame = true;
		}
		
		private function delay():void
		{	
			if(!timerSet)
			{
				t.start(1);
			}
			timerSet = true;
			//trace("Timer has "+FlxU.floor(t.timeLeft)+" seconds left");
			if(t.finished)
			{
				t.stop();
				//trace("setting text to invisible");
				winL1.visible = false;
				winL2.visible = false;
				timerSet = false;
				wonGame = false;
			}			
		}
		
		private function resetGame():void
		{
			//trace("GAME RESET!");
			FlxG.resetState();
		}
		
	}
}
