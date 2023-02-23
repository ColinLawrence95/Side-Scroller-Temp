#region Player Input

if (hascontrol)
{
	key_left = keyboard_check(vk_left) or keyboard_check(ord("A"));
	key_right = keyboard_check(vk_right) or keyboard_check(ord("D"));
	key_jump = keyboard_check_pressed (vk_space);
	key_dash = keyboard_check_pressed (vk_shift);
	key_god = keyboard_check_pressed(ord("L"));
	key_crouch = keyboard_check(ord("S"));
}
else
{
	key_right = 0;
	key_left = 0;
	key_jump = 0;
	key_dash = 0;
	key_god = 0;
	key_crouch = 0;
}

#endregion

//player States
playerMain();
playerOnGround();
playerJump();
playerDash();
playerInAir();
playerGod();
playerCrouch();
playerDead();
