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
		
		battle_awards_distribute_experience();
		show_message("Victory!");
		break;
	}
		
	case 2:
		show_message("Fled!");
		break;
}

//instance_destroy();
game_end();