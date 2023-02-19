/// @description Moves to room assigned to destination


with (oPlayer)
{
	if (hascontrol)
		{
			hascontrol = false;
			Transition(TRANS_MODE.GOTO,other.destination)
		}
}

