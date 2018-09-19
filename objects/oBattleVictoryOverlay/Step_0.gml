if (keyboard_check_pressed(global.k_action)) {
	with (mBattle) {
		battle_awards_distribute_experience();
		instance_destroy();
	}
}
