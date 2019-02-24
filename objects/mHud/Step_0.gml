/// @desc Input

if (input_check_pressed(global.k_toggle_pause_menu)) {
	pauseMenuActive = !pauseMenuActive;
	targetIntensity = pauseMenuActive ? 0.7 : 0;
}

if (pauseMenuActive)
	hud_step_pause_menu();
else {
	// Overworld
	var dir = input_check_pressed(global.k_bumper_left) - input_check_pressed(global.k_bumper_right);
	if (dir != 0) {
		var party = trainer_get_party(oPlayer.trainer);
		var partySize = array_length_1d(party);

		var i = 0;
		for (; i < partySize; ++i) {
			if (party[@ i] == oPlayer.activeMonster)
				break;
		}

		i = clamp_wrap(i + dir, 0, partySize - 1);
		oPlayer.activeMonster = party[@ i];
	}
}
