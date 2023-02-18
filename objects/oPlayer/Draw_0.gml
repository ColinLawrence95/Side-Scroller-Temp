///@desc Setting hit flash
		draw_self();

		if (playerFlash > 0)
		{
			playerFlash = playerFlash - 1;
			shader_set(shRed);
			draw_self();
			shader_reset();
		}