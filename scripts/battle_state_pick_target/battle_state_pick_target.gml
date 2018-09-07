/// @func battle_state_pick_target();
/// STATE Pick Target

// Initialize state
if (state_get_timer() == 0) {
	stTurn_targetRank = noone;
	
	if (stTurn_targetField == FIELD_NONE) {
		state_switch("UseAbility");
		return;
	}
}

var trainer = trainers[@ stTurn_who];
var pickTarget = trainer[@ k_trainer.fn_pick_target];
script_execute(pickTarget);
