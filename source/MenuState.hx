package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;

using flixel.util.FlxSpriteUtil;

class MenuState extends FlxState{
	
	private var title:FlxText;
	private var text:FlxText;
	private var desktop:FlxSprite;
	private var window:FlxSprite;
	private var select:flixel.system.FlxSound;

	override public function create():Void{
		FlxG.mouse.useSystemCursor = true;
		FlxG.sound.playMusic("assets/music/Panic.wav", 5, true);

		title = new FlxText(0, 50, FlxG.width, "AD BLOCK", 16);
		title.alignment = "center";
		title.color = flixel.util.FlxColor.BLACK;
		title.screenCenter(true, false);

		text = new FlxText(0, 70, FlxG.width, "  Press [A] or [D] to begin  \n\n   To destroy an ad,   \n  press [A] if its on the left,  \n [D] if its on the right, \n while it is over the circle. \n\n If you let 5 ads get past, \n YOU LOSE! \n\n You gain 25 points per ad, \n but you lose 25 per miss! ");
		text.alignment = "center";
		text.color = flixel.util.FlxColor.BLACK;
		text.screenCenter(true, false);

		desktop = new FlxSprite(0, 0, "assets/images/Desktop.png"); 
		window = new FlxSprite(0, 0, "assets/images/PopUp.png");
		window.screenCenter(true, true);

		select = FlxG.sound.load("assets/sounds/Select.wav");

		add(desktop);
		add(window);
		add(text);
		add(title);

		super.create();
	}
	
	override public function destroy():Void{
		super.destroy();
	}

	override public function update():Void{
		if(FlxG.keys.pressed.A || FlxG.keys.pressed.D){
			FlxG.switchState(new PlayState());
		}

		super.update();
	}	
}