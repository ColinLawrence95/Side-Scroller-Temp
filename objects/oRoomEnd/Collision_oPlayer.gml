/// @description Moves to next room

with (oPlayer)
{
	if (hascontrol)
		{
			hascontol = false;
			Transition(TRANS_MODE.GOTO,other.destination)
		}
}

