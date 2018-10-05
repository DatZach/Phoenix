/// @func FleeAbilitySub_use(ability, sub, source, target);
/// @context mBattle
/// @param ability Ability
/// @param sub FleeAbilitySub
/// @param source Monster
/// @param target Monster

var ability = argument0;
var sub = argument1;
var source = argument2;
var target = argument3;

if (battle_is_trainer_battle()) {
	show_message("Cannot flee from trainers!");
	return false;
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

return false;
