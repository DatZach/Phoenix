/// @func PlayerTrainer_pick_move();
/// STATE Pick Move

var ABILITY_SLOTS = 5;
var ABILITY_SLOT_MOVE = 4;
var ABILITY_SLOT_SKIP = 5;

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
	
	if (stTurn_selectedAbility == ABILITY_SLOT_MOVE ||
		stTurn_selectedAbility == ABILITY_SLOT_SKIP)
		break;
	
	ability = abilities[@ stTurn_selectedAbility];
	if (ability != noone)
		break;
}

// Select
if (keyboard_check_pressed(global.k_action)) {
	if (stTurn_selectedAbility == ABILITY_SLOT_MOVE)
		state_switch("Round"); // TODO Implement
	if (stTurn_selectedAbility == ABILITY_SLOT_SKIP)
		state_switch("Round");
	else {
		var rankMask = ability[@ Ability.RankMask];
		if ((rankMask & (1<<stTurn_rank)) == 0)
			return;
		
		stTurn_targetField = ability[@ Ability.TargetField];
	
		state_switch("PickTarget");
	}
}
