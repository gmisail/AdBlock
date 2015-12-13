package;

import flixel.FlxSprite;

class Ad extends FlxSprite{

	private var state:PlayState;

	private var isDead:Bool = false;

	public function new(x:Int, state:PlayState){
		super(x, 17);

		this.state = state;

		velocity.y = (100 + Std.int(flixel.util.FlxRandom.float() * 100)) + (state.score)/100;
	}

	override public function update(){

		if(!this.isOnScreen() && !isDead){
			state.adsPass++;

			if(state.adsPass == 5){
				state.lost = true;
			}

			isDead = true;
		}

		super.update();
	}

}