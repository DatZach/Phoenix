/// @func trainer_create();
/// Creates an empty Trainer
/// @returns Trainer

enum k_trainer {
	name,
	trainer,
	party,
	max_hp,
	hp,
	
	fn_pick_move,
	fn_pick_target,
	
	_size
}

var trainer = array_create(k_trainer._size);
	trainer[k_trainer.name] = "<Nameless>";
	trainer[k_trainer.trainer] = noone;
	trainer[k_trainer.party] = ds_list_create();
	trainer[k_trainer.max_hp] = 20;
	trainer[k_trainer.hp] = 20;
return trainer;
