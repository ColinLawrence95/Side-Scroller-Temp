/// @description Insert description here
// You can write your code in this editor

x = mouse_x
y = mouse_y


if(xprevious == x){
	invisible_timer--;
	if(invisible_timer <= 0){
		image_alpha -= 0.05;
	}
}
else{
	image_alpha = 1;
	invisible_timer = invisible_time;
}