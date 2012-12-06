package  
{
	
	/**
	 * ...
	 * @author cld
	 */
	public class StageData
	{
		[Embed(source = "../data/maps/mapCSV_Stage_1_Floor.csv", mimeType = "application/octet-stream")] public var floor1:Class;
		[Embed(source = "../data/maps/mapCSV_Stage_1_Interactive.csv", mimeType = "application/octet-stream")] public var interact1:Class;
		[Embed(source = "../data/maps/mapCSV_Stage_1_Background.csv", mimeType = "application/octet-stream")] public var background1:Class;
		
		[Embed(source = "../data/maps/mapCSV_Stage_2_Floor.csv", mimeType = "application/octet-stream")] public var floor2:Class;
		[Embed(source = "../data/maps/mapCSV_Stage_2_Interactive.csv", mimeType = "application/octet-stream")] public var interact2:Class;
		[Embed(source = "../data/maps/mapCSV_Stage_2_Background.csv", mimeType = "application/octet-stream")] public var background2:Class;

	}

}