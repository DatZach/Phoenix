/// @func hud_step_pause_menu()
/// Handles input for Pause Menu

switch (menuTab) {
	case PauseMenuTab.Inventory:
		hud_step_tab_inventory();
		break;
}
