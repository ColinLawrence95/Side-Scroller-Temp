enum enemyStates
{
	idle,
	patrol,
	aware,
	attack,
	jumping,
	falling,
	death,
}
speedScaling = 1;
patrolsp = 1;
walksp = 1;
vspJump = 7.5;
hp = 4;
flash = 0;
canJump = 0;
hsp = 0;
vsp = 0;
grv = 0.3;
enemyState = enemyStates.idle;
image_xscale = 2;
image_yscale = 2;
enemyXScale = image_xscale;
idleMinTime = 60;
idleMaxTime = 300;
patrolMinTime = 60;
patrolMaxTime = 300;
detectionRange = 725;
attackRange = 700;
awareTime = 600;
hitFrom = 0;
deaditeGun = oDeaditeGun;
idleToPatrol = 0;
foundPlayer = false;
enemeyDeathID = oDeaditeD;
enemyType = 0;

function deaditeAnimation()
{
	if (walksp = 0)
	{
		sprite_index = sDeadite;
	}
	else if (walksp !=0)
	{
		sprite_index = sDeaditeR;
	}
}

myGun = instance_create_layer(x,y,"Gun",oDeaditeGun);
with (myGun)
{
owner = other.id;
}