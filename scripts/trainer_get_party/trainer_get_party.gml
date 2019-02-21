/// @func trainer_get_party(trainer);
/// Returns the full trainer's party in order
/// @returns Array<Monster>

var trainer = argument0;

var party = trainer[@ k_trainer.party];
var monTrainer = trainer[@ k_trainer.trainer];

var hasTrainer = monTrainer != noone;
var size = min(FIELD_RANKS, ds_list_size(party) + hasTrainer);

var result = array_create(size);
if (hasTrainer) result[@ size - 1] = monTrainer;
for (var i = 0; i < size - hasTrainer; ++i)
	result[i] = party[| i];

return result;
