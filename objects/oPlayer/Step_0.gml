#region Player Input

if (hascontrol)
{
	key_left = keyboard_check(vk_left) or keyboard_check(ord("A"));
	key_right = keyboard_check(vk_right) or keyboard_check(ord("D"));
	key_jump = keyboard_check_pressed (vk_space);
	key_god = keyboard_check_pressed(ord("L"));
}
else
{
	key_right = 0;
	key_left = 0;
	key_jump = 0;
	key_god = 0;
}

#endregion

//States
stateMain();
stateOnGround();
stateJump();
stateInAir();
stateGod();
stateDead();