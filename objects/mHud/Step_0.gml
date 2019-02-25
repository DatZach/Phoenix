/// @desc Input

if (input_check_pressed(global.k_toggle_pause_menu)) {
	pauseMenuActive = !pauseMenuActive;
	targetIntensity = pauseMenuActive ? 0.7 : 0;
}

if (pauseMenuActive)
	hud_step_pause_menu();
else {
	
}
