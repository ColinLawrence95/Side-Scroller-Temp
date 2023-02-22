x = owner.x;
y = owner.y;

image_xscale = abs(owner.image_xscale);
image_yscale = abs(owner.image_yscale);

if (instance_exists(oPlayer))
{
	if (oPlayer.x < x)
	{
		image_yscale = -image_yscale;
	}
	if (point_distance(oPlayer.x, oPlayer.y, x, y,) < 780)
	{
		image_angle = point_direction(x, y, oPlayer.x, oPlayer.y);
		countdown = countdown - 1;
		if(countdown <0)
		{
			countdown = countdownRate;
			if (!collision_line(x, y, oPlayer.x, oPlayer.y, oWall, false, false))
			{
				//Playing gunshot sfx
				audio_play_sound(sfxPlayer_Basic_Shot,7,false);
				with (instance_create_layer (x,y,"Effects",oDeaditeBullet)) 
				{
					spd = 10;
					direction = other.image_angle;
					image_angle = direction;
				}
			}
		}
				
	}
}	
	
