if (place_meeting(x, y - 1, oPlayer)) {
    playerTouched = true;
}

if(disappearTime != 0 && playerTouched == true){
		disappearTime--;
		image_speed = 1;
		if (sprite_index = 5)
		{
			image_speed = 0;
		}
	}

if(disappearTime == 0){
	DisappearEffect();
	instance_destroy();
}