/// @func battle_state_init();
/// STATE Initialize Match

for (var i = 0; i < 2; ++i) {
	var fld = field[@ i];
	var trainer = trainers[@ i];
	var party = trainer_get_party(trainer);
	array_copy(fld, 0, party, 0, array_length_1d(party));
	//var party = trainer[@ k_trainer.party];
	
	//var jsize = min(FIELD_RANKS - 1, ds_list_size(party));
	
	//var monTrainer = trainer[@ k_trainer.trainer];
	//if (monTrainer != noone)
	//	fld[@ jsize] = monTrainer;
	
}

// Determine expected number of rounds
// TODO Implement correctly
expectedRounds = 5;
trace("Expected Rounds = ", expectedRounds);

state_switch("Round");
