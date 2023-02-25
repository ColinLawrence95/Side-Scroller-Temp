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