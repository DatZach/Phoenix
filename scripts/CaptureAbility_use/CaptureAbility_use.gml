/// @func CaptureAbility_use(ability, source, target);
/// @context mBattle
/// @param ability CaptureAbility
/// @param source Monster
/// @param target Monster

var ability = argument0;
var source = argument1;
var target = argument2;

// Cannot capture in trainer battle
if (battle_is_trainer_battle()) {
	show_message("Cannot capture another Trainer's monsters!");
	return;
}

// Cannot capture if more than 1 in battle
var count = 0;
var ranks = field[@ FIELD_FOE];
for (var i = 0; i < FIELD_RANKS; ++i) {
	var rank = ranks[@ i];
	if (rank != noone)
		++count;
}

if (count > 1) {
	show_message("There's too many! I can't get close!");
	return;
}

// TODO Cannot capture unless subbdued

// Capture

