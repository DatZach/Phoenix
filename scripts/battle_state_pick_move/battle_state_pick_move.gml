/// @func battle_state_pick_move();
/// STATE Pick Move

// Initialize state
if (state_get_timer() == 0) {
	stTurn_selectedAbility = 0;
}

var trainer = trainers[@ stTurn_who];
var pickMove = trainer[@ k_trainer.fn_pick_move];
script_execute(pickMove);
