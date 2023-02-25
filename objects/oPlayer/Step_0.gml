inputCheck();
movement();
applyGravity();
spriteOrientation();
godMode();


switch (playerState) 
{
    case playerStates.idle:
        idleStateFunction();
        break;
	case playerStates.walk:
		walkStateFunction();
        break;
	case playerStates.jumping:
        jumpingStateFunction();
        break;
	case playerStates.falling:
        fallingStateFunction();
        break;
	case playerStates.crouch:
		crouchStateFunction();
		break;
	case playerStates.dash:
		dashStateFunction();
		break;
	case playerStates.death:
		deathStateFunction();
		break;
}
