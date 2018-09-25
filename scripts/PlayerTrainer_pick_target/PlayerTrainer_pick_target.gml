/// @func PlayerTrainer_pick_target();
/// STATE Pick Target

var abilities = stTurn_monster[@ k_mon.abilities];
var ability = abilities[@ stTurn_selectedAbility];
var targetMask = ability[@ Ability.TargetMask];

// Navigation
var dir = input_check_pressed(global.k_right) - input_check_pressed(global.k_left);
if (stTurn_targetField == FIELD_ALLY) dir *= -1;
if (stTurn_targetRank == noone) {
	if (stTurn_targetField == FIELD_ALLY) {
		stTurn_targetRank = stTurn_rank;
		dir = 0;
	}
	else {
		stTurn_targetRank = -1;
		dir = 1;
	}
}

var targetField = ability[@ Ability.TargetField];
var ranks = field[@ targetField];
for (var i = 0; i < FIELD_RANKS; ++i) {
	stTurn_targetRank += dir;
	
	if (stTurn_targetRank < 0)
		stTurn_targetRank = FIELD_RANKS - 1;
	else if (stTurn_targetRank > FIELD_RANKS - 1)
		stTurn_targetRank = 0;
	
	if (ranks[@ stTurn_targetRank] != noone)
		break;
}

// Select
if (input_check_pressed(global.k_back))
	state_switch("PickMove");
else if (input_check_pressed(global.k_action)) {
	if ((targetMask & (1<<stTurn_targetRank)) == 0)
		return;
	
	state_switch("UseAbility");
}
