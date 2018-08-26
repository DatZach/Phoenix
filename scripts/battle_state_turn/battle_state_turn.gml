/// @func battle_state_turn();
/// STATE Turn

// Begin Turn
if (stTurn_monster[@ k_mon.dead]) {
	stTurn_monster[@ k_mon.dead_cooldown] -= 5;
	if (stTurn_monster[@ k_mon.dead_cooldown] == 0) {
		var ranks = field[@ stTurn_targetField];
		ranks[@ stTurn_targetRank] = noone;
	}
	
	state_switch("Round");
}

// TODO Tick status effects

state_switch("PickMove");
