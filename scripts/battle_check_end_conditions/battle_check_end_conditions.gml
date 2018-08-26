/// @func battle_check_end_conditions();
/// @context mBattle
/// Checks for win/lose conditions and ends the battle if met

var isLose = true;
var isWin = true;

// Win Condition
var ranks = field[FIELD_FOE];
for (var i = 0; i < FIELD_RANKS; ++i) {
	var rank = ranks[@ i];
	if (rank != noone && rank[@ k_mon.dead])
		continue;
		
	isWin = false;
	break;
}

if (isWin) {
	battle_on_end(1);
	instance_destroy();
	return;
}

// Lose Condition
var ranks = field[FIELD_SELF];
for (var i = 0; i < FIELD_RANKS; ++i) {
	var rank = ranks[@ i];
	if (rank != noone && !rank[@ k_mon.dead])
		continue;
		
	isLose = false;
	break;
}

if (isLose) {
	battle_on_end(0);
	instance_destroy();
	return;
}
