package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.group.FlxGroup;
import flixel.system.FlxSound;

using flixel.util.FlxSpriteUtil;

class PlayState extends FlxState{
	
	private var _trackRight:FlxSprite;
	private var _spotRight:FlxSprite;

	private var _trackLeft:FlxSprite;
	private var _spotLeft:FlxSprite;

	private var _desktop:FlxSprite;
	private var _window:FlxSprite;

	//sounds
	private var _destroy:FlxSound;

	//hud
	private var _hud:FlxGroup;
	private var _score:FlxText;
	private var _health:FlxText;

	public var ads:FlxGroup;

	//values
	public var score:Int = 0;

	//lost snafu
	public var lost:Bool = false;
	public var lostText:FlxText;

	//health kind of...
	public var adsPass:Int = 0;

	override public function create():Void{
		_trackRight = new FlxSprite(Std.int(FlxG.width/2 - 60), 0, "assets/images/Track.png");
		_trackLeft = new FlxSprite(Std.int(FlxG.width/2 + 60), 0, "assets/images/Track.png");
		_trackRight.immovable = _trackLeft.immovable = true;

		_spotRight = new FlxSprite(0, FlxG.height - 32, "assets/images/Spot.png");
		_spotRight.x = _trackLeft.x + 1.5 - _spotRight.width / 2;

		_spotLeft = new FlxSprite(0, FlxG.height - 32, "assets/images/Spot.png");
		_spotLeft.x = _trackRight.x + 1.5 - _spotLeft.width / 2;

		_desktop = new FlxSprite(0, 0, "assets/images/Desktop.png");
		_window = new FlxSprite(0, 10, "assets/images/Window.png");

		_window.screenCenter(true, false);

		_hud = new FlxGroup();

		_score = new FlxText(0, 20, FlxG.width, "SCORE: 0");
		_score.alignment = "center";

		_health = new FlxText(0, 30, FlxG.width, "0 / 5");
		_health.alignment = "center";

		_hud.add(_score);
		_hud.add(_health);

		_destroy = FlxG.sound.load("assets/sounds/Destroy.wav");
		_destroy.volume = 0.5;

		ads = new FlxGroup();

		add(_desktop);
		add(_window);
		add(_trackRight);
		add(_trackLeft);
		add(_spotRight);
		add(_spotLeft);
		add(ads);
		add(_hud);

		super.create();
	}
	
	override public function destroy():Void{
		ads.destroy();
		ads = null;

		_trackRight.destroy();
		_trackLeft.destroy();

		_trackRight = null;
		_trackLeft = null;

		super.destroy();
	}

	override public function update():Void{
		_score.text = "SCORE: " + score;

		if(!lost){
			control();
		}

		generateAds();

		super.update();

		if(lost){
			if(lostText == null){
				lostText = new FlxText(0, 0, FlxG.width/2, "You failed to protect yourself from the corporate onslaught.");
				lostText.screenCenter(true, true);
				lostText.size = 16;
				lostText.alignment = "center";
				lostText.color = flixel.util.FlxColor.BLACK;
				lostText.setBorderStyle(FlxText.BORDER_OUTLINE, flixel.util.FlxColor.YELLOW, 1);
				add(lostText);
			}
		}

		_health.text = "BREACH COUNT: " + adsPass;

	}	

	public function addRight():Void{
		var _ad:Ad = new Ad(0, this);
		if((flixel.util.FlxRandom.float() * 2) > 1){
			_ad.loadGraphic("assets/images/ad1.jpg");
		}else{
			_ad.loadGraphic("assets/images/ad2.png");
		}

		_ad.x = Std.int(_trackLeft.x - _ad.width/2);
		ads.add(_ad);
	}

	public function addLeft():Void{
		var _ad:Ad = new Ad(0, this);
		if((flixel.util.FlxRandom.float() * 2) > 1){
			_ad.loadGraphic("assets/images/ad3.png");
		}else{
			_ad.loadGraphic("assets/images/ad4.jpg");
		}

		_ad.x = Std.int(_trackRight.x - _ad.width/2);
		ads.add(_ad);
	}

	public function generateAds():Void{
		if(Math.floor(flixel.util.FlxRandom.float() * 100) == 3){
			addRight();
		}

		if(Math.floor(flixel.util.FlxRandom.float() * 100) == 8){
			addLeft();
		}
	}

	public function control():Void{
		if(FlxG.keys.justPressed.D){
			_spotRight.color = flixel.util.FlxColor.YELLOW;
			FlxG.overlap(_spotRight, ads, removeAd);

			if(!FlxG.overlap(_spotRight, ads)){
				score -= 25;
			}
		}else{
			_spotRight.color = flixel.util.FlxColor.WHITE;
		}

		if(FlxG.keys.justPressed.A){
			_spotLeft.color = flixel.util.FlxColor.YELLOW;
			FlxG.overlap(_spotLeft, ads, removeAd);

			if(!FlxG.overlap(_spotLeft, ads)){
				score -= 25;
			}
		}else{
			_spotLeft.color = flixel.util.FlxColor.WHITE;
		}
	}

	public function removeAd(a:flixel.FlxObject, b:flixel.FlxObject):Void{
		b.destroy();
		_destroy.play();

		score += 50;
		//dank effects?
	}
}