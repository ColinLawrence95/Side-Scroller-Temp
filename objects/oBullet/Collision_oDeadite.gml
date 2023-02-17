/// @description Bullet collision with Deadite

//Damaging Deadite and getting hitfrom value
with (other)
{
	hp = hp - 1;
	flash = 3;
	hitFrom = other.direction;
}

instance_destroy();