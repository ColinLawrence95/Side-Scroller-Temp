enum EnemyStates
{
	sleep,
	wakeup,
	die
}

enemyValues =
{
	walksp : 2
}

hsp = 0;
vsp = 0;
grv = 0.3;
enemyState = EnemyStates.sleep;
enemyScaleX = image_xscale * 2;
enemyScaleY = image_yscale * 2;

foundPlayer = false;
isDying = false;
foundPlayerToFollow = false;