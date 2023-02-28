//show_debug_message(deaditeGunState);
x = owner.x;
y = owner.y;
switch (deaditeGunState) 
{
    case deaditeGunStates.idle:
		deaditeGunIdleStateFunction();
		break;
	case deaditeGunStates.aware:
		deaditeGunAwareStateFunction();
		break;
	case deaditeGunStates.attack:
		deaditeGunAttackStateFunction();
		break;
}