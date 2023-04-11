package;

import openfl.filters.ShaderFilter;
import flixel.FlxCamera;
import flixel.text.FlxText;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;

class PlayState extends FlxState
{
	var office:FlxSprite;
	var shaderCam:FlxCamera;

	override public function create()
	{
		super.create();

		shaderCam = new FlxCamera();
		FlxG.cameras.add(shaderCam, false);

		// Create the office sprite
		office = new FlxSprite().loadGraphic("assets/images/office.png");
		office.screenCenter();
		add(office);

		var infoTxt:FlxText = new FlxText(10, 10, 0, "Press SPACE to toggle substate", 32);
		add(infoTxt);

		// Create shader and apply it to cam
		shaderCam.setFilters([new ShaderFilter(new PanoramicDistortionShader())]);
		office.cameras = [shaderCam];

	}

	var _t:Bool = false;
	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.keys.justPressed.SPACE) {
			openSubState(new TestSubstate());
		}
	}
}
