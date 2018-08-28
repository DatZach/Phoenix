/// @func battle_check_end_conditions();
/// @context mBattle
/// Checks for win/lose conditions and ends the battle if met

var isLose = true;
var isWin = true;

// Win Condition
var ranks = field[@ FIELD_FOE];
for (var i = 0; i < FIELD_RANKS; ++i) {
	var rank = ranks[@ i];
	if (rank == noone)
		continue;
	
	var dead = rank[@ k_mon.dead];
	if (dead)
		continue;
		
	isWin = false;
	break;
}

if (isWin) {
	endStatus = 1;
	state_switch("End");
	return;
}

// Lose Condition
var ranks = field[@ FIELD_SELF];
for (var i = 0; i < FIELD_RANKS; ++i) {
	var rank = ranks[@ i];
	if (rank == noone)
		continue;
	
	var dead = rank[@ k_mon.dead];
	if (dead)
		continue;
		
	isLose = false;
	break;
}

if (isLose) {
	endStatus = 0;
	state_switch("End");
	return;
}
