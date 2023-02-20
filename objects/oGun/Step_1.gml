//Making the shoulder cannon track with the player
x = oPlayer.x;
y = oPlayer.y;

//Aiming shoulder cannon with mouse
image_angle = point_direction(x,y,mouse_x,mouse_y)

//Firing shoulder cannon and adding cooldown and recoil
firingDelay = firingDelay - 1;
recoil = max(0,recoil - 0.5);



#region firing charge shot
with (oPersistent)
{
	if (pBluePower = true)
	{
		other.gBluePower = true;
	}
	if (pChargeShot = true)
	{
		other.gChargeShot = true;
	}
	else
	{
		other.gChargeShot = false;
	}
}
	
if (gBluePower = true) and (gChargeShot = true)
{
	if (mouse_check_button (mb_left)) and (firingDelay <0)
{
	recoil = 15;
	firingDelay = 100;
	ScreenShake(10,10);
	//Playing gunshot sfx
	audio_play_sound(sfxPlayer_Basic_Shot,7,false);
	
	with (instance_create_layer (x,y,"Bullets",oChargeShot)) 
	{
		speed = 50;
		direction = other.image_angle;
		image_angle = direction;
	}
}
	
	//Calculating recoil angle
	x = x - lengthdir_x(recoil,image_angle);
	y = y - lengthdir_y(recoil,image_angle);

	//Change shoulder cannon orientation depeding on direction player faces
	if (image_angle > 90) and (image_angle < 270)
	{
		image_yscale = -1.5;
	}
	else
	{
		image_yscale = 1.5;
	}	
}
#endregion

else
{
#region firing basic gun
{
	if (mouse_check_button (mb_left)) and (firingDelay <0)
	{
		recoil = 10;
		firingDelay = 50;
		ScreenShake(1,10);
		//Playing gunshot sfx
		audio_play_sound(sfxPlayer_Basic_Shot,7,false);
	
		with (instance_create_layer (x,y,"Bullets",oBullet)) 
		{
			speed = 15;
			direction = other.image_angle;
			image_angle = direction;
		}
	}
	
	//Calculating recoil angle
	x = x - lengthdir_x(recoil,image_angle);
	y = y - lengthdir_y(recoil,image_angle);

	//Change shoulder cannon orientation depeding on direction player faces
	if (image_angle > 90) and (image_angle < 270)
	{
		image_yscale = -1.5;
	}
	else
	{
		image_yscale = 1.5;
	}
}

#endregion
}

