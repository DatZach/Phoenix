/// @func FleeAbility_use(ability, source, target);
/// @context mBattle
/// @param ability FleeAbility
/// @param source Monster
/// @param target Monster

var ability = argument0;
var source = argument1;
var target = argument2;

var foeField = stTurn_who == FIELD_ALLY ? FIELD_FOE : FIELD_ALLY;
var trainer = trainers[@ foeField];
if (trainer[@ k_trainer.trainer] != noone) {
	show_message("Cannot flee from trainers!");
	return;
}

var totalLevel = 0, allyLevel = 0;
for (var i = 0; i < array_length_1d(field); ++i) {
	var ranks = field[@ i];
	for (var j = 0; j < FIELD_RANKS; ++j) {
		var rank = ranks[@ j];
		if (rank == noone)
			continue;
			
		totalLevel += rank[@ k_mon.level];
		if (i == stTurn_who)
			allyLevel += rank[@ k_mon.level];
	}
}

var chance = floor(allyLevel / totalLevel * 100);
if (randchance(chance)) {
	show_message("Got away safely!");
	endStatus = 2;
	state_switch("End");
}
else {
	show_message("Foe prevented escape!");
}
