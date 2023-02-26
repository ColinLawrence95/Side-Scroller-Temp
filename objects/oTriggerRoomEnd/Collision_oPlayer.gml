with (oPlayer)
{
	if (hascontrol)
		{
			show_debug_message("Got here")
			hascontrol = false;
			Transition(TRANS_MODE.GOTO,other.destination)
		}
}