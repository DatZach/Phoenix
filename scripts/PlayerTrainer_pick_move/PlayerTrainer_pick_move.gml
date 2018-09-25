/// @func PlayerTrainer_pick_move();
/// STATE Pick Move

// Navigation
var dir = input_check_pressed(global.k_right) - input_check_pressed(global.k_left);
var abilities = stTurn_monster[@ k_mon.abilities];
var ability;

for (var i = 0; i < ABILITY_SLOTS; ++i) {
	stTurn_selectedAbility += dir;
	
	if (stTurn_selectedAbility < 0)
		stTurn_selectedAbility = ABILITY_SLOTS - 1;
	else if (stTurn_selectedAbility > ABILITY_SLOTS - 1)
		stTurn_selectedAbility = 0;

	ability = abilities[@ stTurn_selectedAbility];
	if (ability != noone)
		break;
}

// Select
if (input_check_pressed(global.k_action)) {
	var rankMask = ability[@ Ability.RankMask];
	if ((rankMask & (1<<stTurn_rank)) == 0)
		return;
		
	stTurn_targetField = ability[@ Ability.TargetField];
	if (stTurn_targetField == FIELD_ALLY) {
		stTurn_targetRank = stTurn_rank;
	}
	
	state_switch("PickTarget");
}
