/// @func PlayerTrainer_pick_move();
/// STATE Pick Move

// Navigation
var dir = keyboard_check_pressed(global.k_right) - keyboard_check_pressed(global.k_left);
var abilities = stTurn_monster[@ k_mon.abilities];
var ability;

for (var i = 0; i < ABILITY_SLOTS; ++i) {
	stTurn_selectedAbility += dir;
	
	if (stTurn_selectedAbility < 0)
		stTurn_selectedAbility = ABILITY_SLOTS;
	else if (stTurn_selectedAbility > ABILITY_SLOTS)
		stTurn_selectedAbility = 0;

	ability = abilities[@ stTurn_selectedAbility];
	if (ability != noone)
		break;
}

// Select
if (keyboard_check_pressed(global.k_action)) {
	var rankMask = ability[@ Ability.RankMask];
	if ((rankMask & (1<<stTurn_rank)) == 0)
		return;
		
	stTurn_targetField = ability[@ Ability.TargetField];
	
	state_switch("PickTarget");
}
