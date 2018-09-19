/// @func battle_state_end()
/// STATE End

if (state_get_timer() != 0)
	return;

switch(endStatus) {
	case 0:
		show_message("Defeat!");
		break;
		
	case 1: {
		var ranks = field[@ FIELD_ALLY];
		for (var i = 0; i < FIELD_RANKS; ++i) {
			var rank = ranks[@ i];
			if (rank == noone)
				continue;
				
			if (currentRound < floor(expectedRounds/2))
				battle_awards_add(rank, BattleAward.ExpedientIII);
			else if (currentRound < expectedRounds)
				battle_awards_add(rank, BattleAward.ExpedientII);
			else
				battle_awards_add(rank, BattleAward.ExpedientI);
		}
		
		instance_create_layer(0, 0, LAYER_INSTANCES, oBattleVictoryOverlay);
		break;
	}
		
	case 2:
		show_message("Fled!");
		break;
}
