/// @func AttackAbility_use(source, target);
/// @context mBattle
/// @this AttackAbility

var this = argument0;
var source = argument1;
var target = argument2;

// roll_is_hit()
var modifier = 0; // TODO
var chance = this[@ AttackAbility.Accuracy] + mon_get_stat(source, k_stats.accuracy)
		   - mon_get_stat(target, k_stats.dodge) + modifier + 5;
if (chance >= 95) chance = 100;
var isHit = randchance(chance);

// roll_move_damage
var dmg;
var modifier = 1 * this[@ AttackAbility.DamageModifier]; // TODO
var isCrit = randchance(mon_get_stat(source, k_stats.critical) + this[@ AttackAbility.CriticalModifier]);
if (isCrit)
	dmg = mon_get_stat(source, k_stats.max_damage) * 1.5 * modifier;
else {
	dmg = (
		randint(mon_get_stat(source, k_stats.min_damage), mon_get_stat(source, k_stats.max_damage)) -
		mon_get_stat(target, k_stats.protection)
	) * modifier;
}

dmg = max(1, floor(dmg));

// use
if (isHit) {
	if (stTurn_who == FIELD_SELF) {
		// Player attacks Foe
		target[@ k_mon.hp] -= dmg;
		if (target[@ k_mon.hp] < 0) {
			target[@ k_mon.dead] = true;
			target[@ k_mon.dead_cooldown] = 15;
		}
	}
	else {
		// Foe attacks Player
		if (target[@ k_mon.hp] == 0) {
			if (randchance(100 - mon_get_stat(target, k_stats.death_blow_resist))) {
				target[@ k_mon.dead] = true;
				var ranks = field[@ stTurn_targetField];
				ranks[@ stTurn_targetRank] = noone;
			}
		}
		else {
			target[@ k_mon.hp] -= dmg;
			if (target[@ k_mon.hp] < 0)
				target[@ k_mon.hp] = 0;
		}
	}
	
	battle_check_end_conditions();
}
