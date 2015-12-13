package lime;


import lime.utils.Assets;


class AssetData {

	private static var initialized:Bool = false;
	
	public static var library = new #if haxe3 Map <String, #else Hash <#end LibraryType> ();
	public static var path = new #if haxe3 Map <String, #else Hash <#end String> ();
	public static var type = new #if haxe3 Map <String, #else Hash <#end AssetType> ();	
	
	public static function initialize():Void {
		
		if (!initialized) {
			
			path.set ("assets/data/data-goes-here.txt", "assets/data/data-goes-here.txt");
			type.set ("assets/data/data-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/ad1.jpg", "assets/images/ad1.jpg");
			type.set ("assets/images/ad1.jpg", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/ad2.png", "assets/images/ad2.png");
			type.set ("assets/images/ad2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/ad3.png", "assets/images/ad3.png");
			type.set ("assets/images/ad3.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/ad4.jpg", "assets/images/ad4.jpg");
			type.set ("assets/images/ad4.jpg", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Desktop.png", "assets/images/Desktop.png");
			type.set ("assets/images/Desktop.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/PopUp.png", "assets/images/PopUp.png");
			type.set ("assets/images/PopUp.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Spot.png", "assets/images/Spot.png");
			type.set ("assets/images/Spot.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Track.png", "assets/images/Track.png");
			type.set ("assets/images/Track.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Window.png", "assets/images/Window.png");
			type.set ("assets/images/Window.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/music/music-goes-here.txt", "assets/music/music-goes-here.txt");
			type.set ("assets/music/music-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/music/Panic.wav", "assets/music/Panic.wav");
			type.set ("assets/music/Panic.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/Destroy.wav", "assets/sounds/Destroy.wav");
			type.set ("assets/sounds/Destroy.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/Select.wav", "assets/sounds/Select.wav");
			type.set ("assets/sounds/Select.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/sounds-go-here.txt", "assets/sounds/sounds-go-here.txt");
			type.set ("assets/sounds/sounds-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/sounds/beep.ogg", "assets/sounds/beep.ogg");
			type.set ("assets/sounds/beep.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/flixel.ogg", "assets/sounds/flixel.ogg");
			type.set ("assets/sounds/flixel.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/fonts/nokiafc22.ttf", "assets/fonts/nokiafc22.ttf");
			type.set ("assets/fonts/nokiafc22.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("assets/fonts/arial.ttf", "assets/fonts/arial.ttf");
			type.set ("assets/fonts/arial.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			
			
			initialized = true;
			
		} //!initialized
		
	} //initialize
	
	
} //AssetData
