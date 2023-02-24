draw_self();

if (PlayerValues.playerFlash > 0)
{
	PlayerValues.playerFlash = PlayerValues.playerFlash - 1;
	shader_set(shRed);
	draw_self();
	shader_reset();
}