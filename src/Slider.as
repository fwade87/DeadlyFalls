package  
{
	import org.flixel.FlxSprite;
	
	public class Slider extends FlxSprite
	{
		public var gfxdata:GfxData;
		public var sliding:Boolean = false;
		
		public function Slider() 
		{
			gfxdata = new GfxData();
			super(x * 16, y * 16);
			

			solid = true;
			immovable = true;
			

			loadGraphic(gfxdata.interactPNG, true, false, 16, 16);
			addAnimation("idle", [24]);
			play("idle");
			
			
			//audio
			
		}
		
		override public function update():void
		{
			super.update();
		

		}
				//when the player collides with a crumbler, this gets called
		public function slide():void 
		{
			
		}
		
		
	}

}
		
