/// @func CaptureAbilitySub_use(ability, sub, source, target);
/// @context mBattle
/// @param ability Ability
/// @param sub CaptureAbilitySub
/// @param source Monster
/// @param target Monster

var ability = argument0;
var sub = argument1;
var source = argument2;
var target = argument3;

// Transfer parties
var foeTrainer = trainers[@ stTurn_who == 0 ? 1 : 0];
ds_list_delete_value(foeTrainer[@ k_trainer.party], target);

var selfTrainer = trainers[@ stTurn_who];
ds_list_add(selfTrainer[@ k_trainer.party], target);

// Transfer fields
var foeRanks = field[@ stTurn_targetField];
foeRanks[@ stTurn_targetRank] = noone;

var selfRanks = field[@ stTurn_who];
for (var i = 0; i < FIELD_RANKS; ++i) {
	if (selfRanks[@ i] != noone)
		continue;
	
	selfRanks[@ i] = target;
	break;
}

return true;
