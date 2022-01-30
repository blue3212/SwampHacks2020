package;
import flixel.FlxG;
import flixel.util.FlxTimer;
import flixel.FlxSprite;


abstract class Entity extends FlxSprite
{
    private var isDying:Bool = false;
    public var hp:Int;
    public var damageDealt:Int;
    override public function new(X:Float = 0, Y:Float = 0, ?SimpleGraphic:flixel.system.FlxAssets.FlxGraphicAsset)
    {
        super(X,Y,SimpleGraphic);

        //Gravity
        acceleration.y = 800;

        //Friction
        drag.x = maxVelocity.x * 4;    

    }
    override function update(elapsed:Float) 
    {
        if(y > FlxG.worldBounds.bottom)
        {
            takeDamage(hp);
        }
        super.update(elapsed);
        if(isDying && animation.curAnim == animation.getByName("die") && animation.curAnim.finished)
        {
            kill();
        }
        if(hp <= 0 && !isDying)
        {
            animation.play("die");
            if(Std.isOfType(this,Player))
            {
                new FlxTimer().start(1,function(tmr:FlxTimer)
                {
                    if(tmr.loopsLeft == 0)
                    {
                        //this.reset(FlxG.width / 2 - 5,0);
                        PlayState.resetState();
                    }
                },6);
            }
            isDying = true;
        }
    }

    public function takeDamage(damage:Int = 1)
    {
        if(isDying)
        {
            return;
        }
        if(animation.getByName("hurt") != null)
        {
            animation.play("hurt");
        }
        hp -= damage;
    }

}