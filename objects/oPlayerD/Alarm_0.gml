/// @description reload room and set game speed
if instance_exists(oSpawnTacActive)
{
	game_set_speed(60,gamespeed_fps);
	instance_change(oPlayer,true);
	instance_create_layer(x,y,"Gun",oGun);
	instance_create_layer(x,y,"Mouse",oMouse);
	oPlayer.x = oSpawnTacActive.x;
	oPlayer.y = oSpawnTacActive.y - 50;
	oPersistent.tacSpawnUsed = true;
}
else
{
	Transition(TRANS_MODE.GOTO,room);
	game_set_speed(60,gamespeed_fps);
}

