enum playerStates
{
	idle,
	jumping,
	falling,
	walk,
	crouch,
	dash,
	toss,
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
footStepPlayed = false;
lastFootstepSound = noone;
wallSlideEffect = 1;
tacThrown = false;

walksp = 4;
vspJump = 7.5;
playerHP = 3;
playerHPCurrent = playerHP;
healthbar_width = 100;
healthbar_height = 11.5;
healthbar_x = 50;
healthbar_y = 50;
dashTime = 15;
dashSpeed = 10
dashHitWall = 0;

image_xscale = 2;
image_yscale = 2;

playerState = playerStates.idle;

