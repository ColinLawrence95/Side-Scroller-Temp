speedScaling = 3;
patrolsp = 1;
walksp = 1;
vspJump = 7.5;
hp = 2;
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
detectionRange = 750;
attackRange = 40;
awareTime = 600;
hitFrom = 0;
idleToPatrol = 0;
foundPlayer = false;
enemeyDeathID = oGruntD;

function gruntAnimation()
{
	if (walksp = 0)
	{
		sprite_index = sGrunt;
	}
	else if (walksp !=0)
	{
		sprite_index = sGruntR;
	}
	if (enemyState = enemyStates.attack)
	{
		sprite_index = sGruntM;
		mask_index = sGruntM;
	}
	else
	{
		mask_index = sGrunt;
	}
}
