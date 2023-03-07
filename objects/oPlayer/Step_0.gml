inputCheck();
movement();
applyGravity();
spriteOrientation();
godMode();


show_debug_message(playerState);
show_debug_message(oPersistent.pAmmoCount);


switch (playerState) 
{
    case playerStates.idle:
        playerIdleState();
        break;
	case playerStates.walk:
		playerWalkState();
        break;
	case playerStates.jumping:
        playerJumpingState();
        break;
	case playerStates.falling:
        playerFallingState();
        break;
	case playerStates.crouch:
		playerCrouchState();
		break;
	case playerStates.dash:
		playerDashState();
		break;
	case playerStates.toss:
		playerTossState();
		break;
	case playerStates.death:
		playerDeathState();
		break;
}
