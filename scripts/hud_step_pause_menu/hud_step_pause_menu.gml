/// @func hud_step_pause_menu()
/// Handles input for Pause Menu

menuTab = clamp_wrap(
	menuTab + input_check_pressed(global.k_bumper_right) - input_check_pressed(global.k_bumper_left),
	0, PauseMenuTab._size - 1
);

switch (menuTab) {
	case PauseMenuTab.Inventory:
		hud_step_tab_inventory();
		break;
}
