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

hsp = 0;
vsp = 0;
grv = 0.3;

hascontrol = true;
invincable = 0;
playerFlash = 0;
canJump = 0;
canDash = true;

walksp = 4;
vspJump = 7.5;
playerHP = 3;
dashTime = 0.4;
dashSpeed = 3;

image_xscale = 2;
image_yscale = 2;

playerState = playerStates.idle;

