/// @func PlayerTrainer_pick_move();
/// STATE Pick Move

// Navigation
if (keyboard_check_pressed(global.k_right))
	++stTurn_selectedAbility;
else if (keyboard_check_pressed(global.k_left))
	--stTurn_selectedAbility;
	
if (stTurn_selectedAbility < 0)
	stTurn_selectedAbility = 5;
else if (stTurn_selectedAbility > 5)
	stTurn_selectedAbility = 0;

// Select
if (keyboard_check_pressed(global.k_action)) {
	var abilities = stTurn_monster[@ k_mon.abilities];
	var ability = abilities[@ stTurn_selectedAbility];
	
	stTurn_targetField = ability[@ Ability.Type] == ABILITY_ATTACK ? FIELD_FOE : FIELD_FOE;
	stTurn_targetRank = 0; // TODO First viable rank
	
	state_switch("PickTarget");
}
