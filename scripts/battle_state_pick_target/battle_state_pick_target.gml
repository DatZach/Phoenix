/// @func battle_state_pick_target();
/// STATE Pick Target

var trainer = trainers[@ stTurn_who];
var pickTarget = trainer[@ k_trainer.fn_pick_target];
script_execute(pickTarget);
