/// @func PlayerTrainer_pick_target();
/// STATE Pick Target

var abilities = stTurn_monster[@ k_mon.abilities];
var ability = abilities[@ stTurn_selectedAbility];

// Navigation
if (keyboard_check_pressed(global.k_right))
	++stTurn_targetRank;
else if (keyboard_check_pressed(global.k_left))
	--stTurn_targetRank;

if (stTurn_targetRank < 0)
	stTurn_targetRank = 3;
else if (stTurn_targetRank > 3)
	stTurn_targetRank = 0;

// Select
if (keyboard_check_pressed(global.k_action)) {
	state_switch("UseAbility");
}
