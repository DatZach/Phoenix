/// @func cpu_trainer_create();
/// Creates a CpuTrainer
/// @returns Trainer

var trainer = trainer_create();
	trainer[k_trainer.name] = "CPU"; // TODO Name
	trainer[k_trainer.fn_pick_move] = CpuTrainer_pick_move;
	trainer[k_trainer.fn_pick_target] = CpuTrainer_pick_target;
return trainer;
