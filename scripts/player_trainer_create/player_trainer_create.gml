/// @func player_trainer_create();
/// Creates a Player Trainer
/// @returns Trainer

var trainer = trainer_create();
	trainer[k_trainer.name] = "Player"; // TODO Name
	trainer[k_trainer.fn_pick_move] = PlayerTrainer_pick_move;
	trainer[k_trainer.fn_pick_target] = PlayerTrainer_pick_target;
return trainer;
