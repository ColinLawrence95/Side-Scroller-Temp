if (place_meeting(x, y - 1, oPlayer)) {
    playerTouched = true;
}

if(disappearTime != 0 && playerTouched == true){
		disappearTime--;
	}

if(disappearTime == 0){
	DisappearEffect();
	instance_destroy();
}