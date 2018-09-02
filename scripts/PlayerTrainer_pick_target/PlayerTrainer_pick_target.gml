/// @func PlayerTrainer_pick_target();
/// STATE Pick Target

var abilities = stTurn_monster[@ k_mon.abilities];
var ability = abilities[@ stTurn_selectedAbility];
var targetMask = ability[@ Ability.TargetMask];

// Navigation
var dir = keyboard_check_pressed(global.k_right) - keyboard_check_pressed(global.k_left);
if (stTurn_targetRank == noone) dir = 1;

for (var i = 0; i < FIELD_RANKS; ++i) {
	stTurn_targetRank += dir;
	
	if (stTurn_targetRank < 0)
		stTurn_targetRank = FIELD_RANKS - 1;
	else if (stTurn_targetRank > FIELD_RANKS - 1)
		stTurn_targetRank = 0;
	
	if ((targetMask & (1<<stTurn_targetRank)) != 0)
		break;
}

// Select
if (keyboard_check_pressed(global.k_back)) {
	state_switch("PickMove");
}
else if (keyboard_check_pressed(global.k_action)) {
	if ((targetMask & (1<<stTurn_targetRank)) == 0)
		return;
	
	state_switch("UseAbility");
}
