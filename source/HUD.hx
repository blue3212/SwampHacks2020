package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;


using flixel.util.FlxSpriteUtil;


class HUD extends FlxTypedGroup<FlxSprite>
{
    public var scoreText:FlxText;
    public var healthText:FlxText;
    override public function new() 
    {
        super();
        scoreText = new FlxText(FlxG.width - 160, 2, 160,"scoreText");
        healthText = new FlxText(FlxG.width - 100, 2, 160, "healthText");
        add(scoreText);
        add(healthText);
        forEach(function(sprite:FlxSprite)
        {
            sprite.scrollFactor.set(0,0);
        });
    }

}