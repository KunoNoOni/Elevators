package
{
	import org.flixel.*;

	public class Registry
	{
		//public static var levelIndex:int = 0;
		public static var currLvl:int = 1;
		public static var mapWidth:int = 50;
		public static var mapHeight:int = 100;
		public static var lwaypoints:FlxGroup = new FlxGroup();
		public static var rwaypoints:FlxGroup = new FlxGroup();
		public static var uwaypoints:FlxGroup = new FlxGroup();
		public static var dwaypoints:FlxGroup = new FlxGroup();
		
		[Embed(source = 'Res/Sprites/BuildTiles.png')] static public var buildTiles:Class; //main level tiles
		[Embed(source = 'Res/Sprites/BuildTiles2.png')] static public var buildTiles2:Class; //elevator tiles
		[Embed(source = 'Res/Sprites/BuildTiles3.png')] static public var buildTiles3:Class; //waypoint tiles
		[Embed(source = 'Res/Sprites/player.png')] static public var player:Class;
		[Embed(source = 'Res/Sprites/heart.png')] static public var heart:Class;
		[Embed(source = 'Res/Sprites/HElevator.png')] static public var helevator:Class;
		[Embed(source = 'Res/Sprites/VElevator.png')] static public var velevator:Class;
		[Embed(source = 'Res/Sprites/LeftWaypoint.png')] static public var lWaypoint:Class;
		[Embed(source = 'Res/Sprites/RightWaypoint.png')] static public var rWaypoint:Class;
		[Embed(source = 'Res/Sprites/UpWaypoint.png')] static public var uWaypoint:Class;
		[Embed(source = 'Res/Sprites/DownWaypoint.png')] static public var dWaypoint:Class;
		[Embed(source = 'Res/Sprites/background.png')] static public var bground:Class;
		[Embed(source = 'Res/Sprites/title.png')] static public var title:Class;
		
		[Embed(source = 'Res/Sounds/Jump2.mp3')] static public var jump:Class;
		[Embed(source = 'Res/Sounds/Pickup_Coin2.mp3')] static public var pc:Class;
		
		[Embed(source = 'Res/Levels/Level1.csv', mimeType = 'application/octet-stream')] static public var Level1:Class;
		[Embed(source = 'Res/Levels/Level1E.csv', mimeType = 'application/octet-stream')] static public var Level1E:Class;
		[Embed(source = 'Res/Levels/Level1W.csv', mimeType = 'application/octet-stream')] static public var Level1W:Class;
		
		//[Embed(source = 'sounds/jump.mp3')] static public var _jump:Class;
		
		public static var levels:Array = ["null","Level1"];
		public static var levelsE:Array = ["null","Level1E"];
		public static var levelsW:Array = ["null","Level1W"];
		
		public function Registry()
		{
		}
	}
}