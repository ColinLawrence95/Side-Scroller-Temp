#region //Tracking Charge Shot toggle
key_chargeShot = keyboard_check_pressed(ord("1"));
if (key_chargeShot = 1)
{
	pFlamethrower = false;
	pAcid = false;
	pIceBeam = false;
	pChargeShot = !pChargeShot;
}
key_Flamethrower = keyboard_check_pressed(ord("2"));
if (key_Flamethrower = 1)
{
	pChargeShot = false;
	pAcid = false;
	pIceBeam = false;
	pFlamethrower = !pFlamethrower;
}
key_Acid = keyboard_check_pressed(ord("3"));
if (key_Acid = 1)
{
	pChargeShot = false;
	pFlamethrower = false;
	pIceBeam = false;
	pAcid = !pAcid;
}
key_IceBeam = keyboard_check_pressed(ord("4"));
if (key_IceBeam = 1)
{
	pChargeShot = false;
	pFlamethrower = false;
	pAcid = false;
	pIceBeam = !pIceBeam;
}
#endregion
