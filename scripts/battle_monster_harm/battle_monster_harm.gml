/// @func battle_monster_harm(target, dmg)
/// Substracts dmg points from monster's hp. Kills if needed. Recalculates end conditions.
/// @context mBattle
/// @param target Monster
/// @param dmg real integer of harm points

var target = argument0;
var dmg = floor(argument1);

// HACK? stTurn_who might not actually be a safe variable to check to answer the
//		question "Am I harming a friend or foe?"
if (stTurn_who == FIELD_ALLY) {
	// Player attacks Foe
	target[@ k_mon.hp] -= dmg;
	if (target[@ k_mon.hp] <= 0) {
		if (target[@ k_mon.dead]) {
			var ranks = field[@ stTurn_targetField];
			ranks[@ stTurn_targetRank] = noone;
		}
		else {
			target[@ k_mon.dead] = true;
			target[@ k_mon.hp] = mon_get_max_hp(target);
		}
	}
	
	fx_battle_indicator(target, IndType.Damage, dmg);
}
else {
	// Foe attacks Player
	if (target[@ k_mon.hp] <= 0) {
		if (randchance(100 - mon_get_stat(target, k_stats.death_blow_resist))) {
			target[@ k_mon.dead] = true;
			var ranks = field[@ stTurn_targetField];
			ranks[@ stTurn_targetRank] = noone;
		}
		else
			fx_battle_indicator(target, IndType.DeathsDoor, dmg);
	}
	else {
		target[@ k_mon.hp] -= dmg;
		if (target[@ k_mon.hp] < 0)
			target[@ k_mon.hp] = 0;
			
		fx_battle_indicator(target, IndType.Damage, dmg);
	}
}

battle_check_end_conditions();
