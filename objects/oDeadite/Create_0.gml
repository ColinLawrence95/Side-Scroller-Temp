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
patrolsp = 1;
walksp = 1;
vspJump = 7.5;
hp = 4;
flash = 0;
canJump = 0;
hsp = 0;
vsp = 0;
grv = 0.3;
enemyState = playerStates.idle;
image_xscale = 2;
image_yscale = 2;
enemyXScale = image_xscale;
idleMinTime = 60;
idleMaxTime = 300;
patrolMinTime = 60;
patrolMaxTime = 300;
detectionRange = 500;
attackRange = 400;
awareTime = 600;
hitFrom = 0;
deaditeGun = oDeaditeGun;
idleToPatrol = 0;
foundPlayer = false;

function deaditeAnimation()
{
	if (enemyState = enemyStates.idle) or (enemyState = enemyStates.attack)
	{
		sprite_index = sDeadite;
	}
	else if (enemyState = enemyStates.patrol)
	{
		sprite_index = sDeaditeR;
	}
}