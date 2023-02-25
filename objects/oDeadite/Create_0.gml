enum enemyStates
{
	patrol,
	aware,
	idle,
	jumping,
	falling,
	walk,
	death,
}

enemyValues ={
	walksp : 2,
	vspJump : 7.5,
	hp : 4,
	flash  : 0,
	canJump : 0,



}

hsp = 0;
vsp = 0;
grv = 0.3;

enemyState = playerStates.idle;
image_xscale = 2;
image_yscale = 2;
enemyXScale = image_xscale;
