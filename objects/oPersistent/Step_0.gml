#region //Tracking Charge Shot toggle
key_chargeShot = keyboard_check_pressed(ord("1"));
if (key_chargeShot = 1)
{
	pChargeShot = !pChargeShot;
	show_debug_message(pChargeShot);
}
#endregion
