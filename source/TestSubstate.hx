package;

import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.FlxSprite;
import flixel.FlxSubState;

class TestSubstate extends FlxSubState
{
    public function new() 
    {
        super();

        // Create black overlay on half of the screen
        var overlay:FlxSprite = new FlxSprite().makeGraphic(Std.int(FlxG.width / 2), FlxG.height, FlxColor.BLACK);
        add(overlay);
    }

    override function update(e:Float):Void
    {
        if (FlxG.keys.justPressed.SPACE)
            close();

        super.update(e);
    }
}