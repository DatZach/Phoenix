/// @func battle_state_init();
/// STATE Initialize Match

for (var i = 0; i < 2; ++i) {
	var fld = field[@ i];
	var trainer = trainers[@ i];
	var party = trainer[@ k_trainer.party];
	
	var jsize = min(FIELD_RANKS - 1, ds_list_size(party));
	
	var monTrainer = trainer[@ k_trainer.trainer];
	if (monTrainer != noone)
		fld[@ jsize] = monTrainer;
	
	for (var j = 0; j < jsize; ++j) {
		var mon = party[| j];
		fld[@ j] = mon;
	}
}

// Determine expected number of rounds
var totalFoeHp = 0;
var sumAvgAttack = 0;
var jj = 0;

var ranks = field[@ FIELD_FOE];
var ii = 0;
for (var i = 0; i < FIELD_RANKS; ++i) {
	var rank = ranks[@ i];
	if (rank == noone)
		continue;
	
	totalFoeHp += mon_get_max_hp(rank);
	++ii;
}

var ranks = field[@ FIELD_ALLY];
for (var i = 0; i < FIELD_RANKS; ++i) {
	var rank = ranks[@ i];
	if (rank == noone)
		continue;
	
	var highest = -1;
	var abilities = rank[@ k_mon.abilities];
	for (var j = 0; j < ABILITY_SLOTS; ++j) {
		var ability = abilities[@ j];
		if (ability[@ Ability.Type] == ABILITY_ATTACK) {
			// TODO Need a new algorithm because this is broken
			var dmgRange = attack_ability_get_damage_range(ability, rank, rank);
			var dmg = floor((dmgRange[1] - dmgRange[0]) * 0.66);
			if (highest < dmg)
				highest = dmg;
		}
	}
	
	if (highest > -1) {
		sumAvgAttack += highest;
		++jj;
	}
}

if (jj > 0) {
	sumAvgAttack /= jj;
	expectedRounds = floor(totalFoeHp / sumAvgAttack / ii);
}
else
	expectedRounds = 0;

trace("Expected Rounds = ", expectedRounds);

battle_awards_add(ranks[@ 0], BattleAward.VanquishFoeII);
battle_awards_add(ranks[@ 0], BattleAward.VanquishFoeI);
battle_awards_add(ranks[@ 0], BattleAward.VanquishFoeIII);
battle_awards_add(ranks[@ 0], BattleAward.VanquishFoeIII);
battle_awards_add(ranks[@ 0], BattleAward.VanquishFoeIII);
battle_awards_add(ranks[@ 0], BattleAward.VanquishFoeIII);
battle_awards_add(ranks[@ 0], BattleAward.VanquishFoeIII);
battle_awards_add(ranks[@ 0], BattleAward.VanquishFoeIII);
battle_awards_add(ranks[@ 0], BattleAward.DeathsDoor);
battle_awards_add(ranks[@ 0], BattleAward.DeathsDoor);
battle_awards_add(ranks[@ 0], BattleAward.VanquishFoeIII);
battle_awards_add(ranks[@ 1], BattleAward.VanquishFoeI);
battle_awards_add(ranks[@ 2], BattleAward.VanquishFoeI);
battle_awards_add(ranks[@ 2], BattleAward.DeathsDoor);
battle_awards_add(ranks[@ 3], BattleAward.ReviveI);
endStatus = 1;
state_switch("End");

//state_switch("Round");
