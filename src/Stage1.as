package  
{
	import org.flixel.*

	public class Stage1 extends BaseStage
	{
		
		override public function setData():void 
		{			
			floorCSV = data.floor1;
			interactiveCSV = data.interact1;
			backgroundCSV = data.background1;
			name = "Stage 1";
		}
		
	}

}