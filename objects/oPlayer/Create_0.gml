enum playerStates
{
	idle,
	jumping,
	falling,
	walk,
	crouch,
	dash,
	death,
}

PlayerValues ={
	walksp : 4,
	vspJump : 7.5,
	playerHP : 3,
	invincable : 0,
	playerFlash  :0,
	canJump : 0,
	canDash : true,
	dashTime : 0.4,
	dashSpeed: 3
}

hsp = 0;
vsp = 0;
grv = 0.3;

playerState = playerStates.idle;
image_xscale = 2;
image_yscale = 2;
playerXScale = image_xscale;