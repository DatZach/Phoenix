/// @func battle_state_pick_move();
/// STATE Pick Move

// Initialize state
if (state_get_timer() == 0) {
	stTurn_selectedAbility = 0;
	
	var abilities = stTurn_monster[@ k_mon.abilities];
	abilities[@ 4] = move_ability_create(1); // TODO Populate Distance property
	abilities[@ 5] = skip_ability_create();
}

var trainer = trainers[@ stTurn_who];
var pickMove = trainer[@ k_trainer.fn_pick_move];
script_execute(pickMove);
