package  
{
	import org.flixel.*;

	[SWF(width = "640", height = "480", backgroundColor = "#ffffff")]
	
	public class DeadlyFalls extends FlxGame
	{
		
		public function DeadlyFalls():void 
		{
			super(320, 240, MainMenu, 2);
			forceDebugger = false;
		}
		
	}

}