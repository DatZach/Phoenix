/// @func battle_state_round();
/// STATE Round

stTurn_monster = noone;

var queue = [];
var queueIdx = 0;
for (var i = 0, ilen = array_length_1d(field); i < ilen; ++i) {
	var ranks = field[@ i];
	for (var j = 0, jlen = array_length_1d(ranks); j < jlen; ++j) {
		var rank = ranks[@ j];
		if (rank == noone || array_in(stRound_finished, rank))
			continue;
		
		if (stTurn_monster == noone)
			stTurn_monster = rank;
		else if (mon_get_stat(rank, k_stats.speed) > mon_get_stat(stTurn_monster, k_stats.speed))
			stTurn_monster = rank;
	}
}

if (stTurn_monster != noone) {
	array_add(stRound_finished, stTurn_monster);
	state_switch("Turn");
}
else
	state_switch("BeginRound");
