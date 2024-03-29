package  
{
	import org.flixel.*
	
	public class BaseStage extends FlxGroup
	{
		//the data of all the stages
		public var data:StageData;
		public var gfxdata:GfxData;
		
		//the CSV classes that get assigned data from StageData.as
		public var floorCSV:Class;
		public var interactiveCSV:Class;
		public var backgroundCSV:Class;
		
		//the Tilemaps for the floor
		public var floorMap:FlxTilemap;
		
		//the Tilemap used to generate the interactive elements
		public var interactiveMap:FlxTilemap;
		
		//the Tilemap for the background
		public var backgroundMap:FlxTilemap;
		
		//the interactive elements
		public var jumpPads:FlxGroup;
		public var spikes:FlxGroup;
		public var stageGoal:FlxGroup;
		public var crumblers:FlxGroup;
		public var sliders:FlxGroup;
		public var slidersLEFT:FlxGroup;


		//the player start position
		public var playerStartX:int;
		public var playerStartY:int;
		

		
		//the stage dimensions (in pixels)
		public var width:int;
		public var height:int;
		
		//the stage name
		public var name:String;
		
		public function BaseStage():void
		{
			data = new StageData();
			gfxdata = new GfxData();
			setData();
			createFloorMap();
			createBackgroundMap();
			createInteractiveElements();
			setDimensions();
			exists = true;
	
		}
		
		//this assigns the data to the variables used in map creation. Override it to generate different stages
		public function setData():void
		{
			floorCSV = data.floor1;
			interactiveCSV = data.interact1;
			backgroundCSV = data.background1;
			name = "Base Stage";
		}
		
		//this just loads the floorMap from whatever you set floorCSV to
		public function createFloorMap():void
		{
			floorMap = recycle(FlxTilemap) as FlxTilemap;
			floorMap.loadMap(new floorCSV, gfxdata.tilesPNG, 16, 16, 0, 0, 1, 1);
		}
		
		//this just loads the backgroundMap from whatever you set backgroundCSV to
		public function createBackgroundMap():void
		{
			backgroundMap = recycle(FlxTilemap) as FlxTilemap;
			backgroundMap.loadMap(new backgroundCSV, gfxdata.backgroundPNG, 32, 32, 0, 0, 1, 8);
			backgroundMap.scrollFactor.x = 0.5;
			backgroundMap.scrollFactor.y = 0.5;
		}
		
		//this runs a for loop that checks a map based on interactiveCSV
		//and creates an interactive element in it's respective FlxGroup based on the CSV data
		public function createInteractiveElements():void
		{
			interactiveMap = recycle(FlxTilemap) as FlxTilemap;
			interactiveMap.loadMap(new interactiveCSV, gfxdata.interactPNG, 16, 16);
			
			//initialize the interactive element FlxGroups
			jumpPads = recycle(FlxGroup) as FlxGroup;
		
			spikes = recycle(FlxGroup) as FlxGroup;
			stageGoal = recycle(FlxGroup) as FlxGroup;
			crumblers = recycle(FlxGroup) as FlxGroup;
			sliders = recycle(FlxGroup) as FlxGroup;
			slidersLEFT = recycle(FlxGroup) as FlxGroup;
			
			//scan the y axis
			for (var ty:int = 0; ty < interactiveMap.heightInTiles; ty++)
			{
				//scan the x axis
				for (var tx:int = 0; tx < interactiveMap.widthInTiles; tx++)
				{
					//check for the player start tile and store the values so the PlayState knows where to place the player on startup
					if (interactiveMap.getTile(tx, ty) == 1)
					{
						playerStartX = tx*16;
						playerStartY = ty*16;
					}
		
					//check for jumpapads and add them to the jumppads FlxGroup
					if (interactiveMap.getTile(tx, ty) == 4)
					{
						//this recycles the springs instead of adding new ones, hopefully saving on memory usage
						var tempJumpPad:JumpPad = recycle(JumpPad) as JumpPad;
						tempJumpPad.reset(tx * 16, ty * 16);
						jumpPads.add(tempJumpPad);
					}
					

					//check for slider and add them to the slider FlxGroup
					if (interactiveMap.getTile(tx, ty) == 24)
					{
						var tempSlider:Slider = recycle(Slider) as Slider;
						tempSlider.reset(tx * 16, ty * 16);
						sliders.add(tempSlider);
					}
					
							//check for Left slider and add them to the ice FlxGroup
					if (interactiveMap.getTile(tx, ty) == 25)
					{
						var tempSliderLEFT:SliderLEFT = recycle(SliderLEFT) as SliderLEFT;
						tempSliderLEFT.reset(tx * 16, ty * 16);
						slidersLEFT.add(tempSliderLEFT);
					}
					
					//check for spikes and add them to the spike FlxGroup
					if (interactiveMap.getTile(tx, ty) > 11 && interactiveMap.getTile(tx, ty) <16)
					{
						var tempSpike:Spike = recycle(Spike) as Spike;
						tempSpike.reset(tx * 16, ty * 16);
						tempSpike.setAngle(interactiveMap.getTile(tx, ty));
						spikes.add(tempSpike);
					}
					
					//check for goal tiles and add them to the stageGoal FlxGroup
					if (interactiveMap.getTile(tx, ty) == 36)
					{
						var tempGoal:Goal = recycle(Goal) as Goal;
						tempGoal.reset(tx * 16, (ty * 16)+8);
						stageGoal.add(tempGoal);
					}
					
					//check for crumblers and add them to the crumblers FlxGroup
					if (interactiveMap.getTile(tx, ty) == 16)
					{
						var tempCrumbler:Crumbler = recycle(Crumbler) as Crumbler;
						tempCrumbler.reset(tx * 16, ty * 16);
						crumblers.add(tempCrumbler);
					}
				}
			}
		}


		public function setDimensions():void
		{
			width = floorMap.width;
			height = floorMap.height;
		}
	}
}