/// @func battle_state_pick_move();
/// STATE Pick Move

var trainer = trainers[@ stTurn_who];
var pickMove = trainer[@ k_trainer.fn_pick_move];
script_execute(pickMove);
