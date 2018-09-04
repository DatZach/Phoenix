/// @func battle_state_round();
/// STATE Round

stTurn_monster = noone;

// Collapse ranks after monster deaths
for (var i = 0, ilen = array_length_1d(field); i < ilen; ++i) {
	var ranks = field[@ i];
	var ranksLength = array_length_1d(ranks);
	var newRanks = array_create(ranksLength, noone);
	for (var j = 0, k = 0; j < ranksLength; ++j) {
		if (ranks[@ j] != noone)
			newRanks[@ k++] = ranks[@ j];
	}
	
	field[@ i] = newRanks;
}

// Determine order
var queue = [];
var queueIdx = 0;
for (var i = 0, ilen = array_length_1d(field); i < ilen; ++i) {
	var ranks = field[@ i];
	for (var j = 0, jlen = array_length_1d(ranks); j < jlen; ++j) {
		var rank = ranks[@ j];
		if (rank == noone || array_in(stRound_finished, rank))
			continue;
		
		if (stTurn_monster == noone) {
			stTurn_monster = rank;
			stTurn_rank = j;
			stTurn_who = i;
		}
		else if (mon_get_stat(rank, k_stats.speed) > mon_get_stat(stTurn_monster, k_stats.speed)) {
			stTurn_monster = rank;
			stTurn_rank = j;
			stTurn_who = i;
		}
	}
}

if (stTurn_monster != noone) {
	array_add(stRound_finished, stTurn_monster);
	state_switch("BeginTurn");
}
else
	state_switch("BeginRound");
