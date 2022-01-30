//Goombas but reskinned 
abstract class BasicEnemy extends Entity
{
    
    override function update(elapsed:Float) 
        {
            if(isDying)
            {
                super.update(elapsed);
                return;
            }
            // Turn when hit wall 
            if(this.isTouching(LEFT))
            {
                facing = RIGHT;
            }
            if(this.isTouching(RIGHT))
            {
                facing = LEFT;
            }
    
            if(facing == LEFT)
            {
                velocity.x = -100;
            }
            else
            {
                velocity.x = 100;
            }
    
            super.update(elapsed);
    
        }
}