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
canDash = 0;
lastTouch = 0;

walksp = 4;
vspJump = 7.5;
playerHP = 3;
dashTime = 15;
dashSpeed = 10
dashHitWall = 0;

image_xscale = 2;
image_yscale = 2;

playerState = playerStates.idle;

