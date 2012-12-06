package  
{
	import org.flixel.*
	
	/**
	 * ...
	 * @author cld
	 */
	public class JumpPad extends FlxSprite
	{
		//the graphic for the jumpPad
		public var gfxdata:GfxData;
		public var snddata:SndData;
		public var boingSND:FlxSound;
		
		public function JumpPad() 
		{
			gfxdata = new GfxData();
			snddata = new SndData();
			
			super(x * 16, y * 16);
			
			//make the JumpPad collidable and immovable (so it doesn't fly away when you hit it)
			solid = true;
			immovable = true;
			
			//animaaaaaaations
			loadGraphic(gfxdata.interactPNG, true, false, 16, 16);
			addAnimation("idle", [4]);
			addAnimation("boing", [7, 6, 4, 5, 4, 5, 4], 15, false);
			
			play("idle");
			
			boingSND = new FlxSound();
			boingSND.loadEmbedded(snddata.springSFX, false, false);
			
		}
		
		override public function update():void
		{
			super.update();
			//play("idle");
		}
		
		//when the player collides with a jumpPad, this gets called
		public function boing():void {
			play("boing");
			boingSND.play();
		}
		
	}

}