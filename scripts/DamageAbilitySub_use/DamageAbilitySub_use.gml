/// @func DamageAbilitySub_use(ability, sub, source, target);
/// @context mBattle
/// @param ability Ability
/// @param sub AbilitySub
/// @param source Monster
/// @param target Monster

var ability = argument0;
var sub = argument1;
var source = argument2;
var target = argument3;

assert(source != noone, "Source cannot be noone");
assert(target != noone, "Target cannot be noone");

// Gaurd always overrides target
var guardStatusEffect = mon_find_status_effect(target, STATUS_EFFECT_GUARD);
if (guardStatusEffect != noone) {
	fx_toast_status(target, IndType.Guard);
	target = guardStatusEffect[@ GuardStatusEffect.Guardian];
}

// roll_is_hit()
var chance = damage_ability_sub_get_hit_chance(ability, sub, source, target);
var isHit = randchance(chance);
if (!isHit)
	return false;

// roll_move_damage
var dmg;
var isCrit = randchance(damage_ability_sub_get_critical_chance(ability, sub, source));
if (isCrit)
	dmg = mon_get_stat(source, k_stats.max_damage) * damage_ability_sub_get_modifier(ability, sub, source, target) * 1.5;
else {
	dmgRange = damage_ability_sub_get_damage_range(ability, sub, source, target);
	dmg = randint(dmgRange[0], dmgRange[1]);
}

// use
battle_monster_harm(target, dmg);
if (isCrit && target[@ k_mon.dead]) {
	var ranks = field[@ stTurn_targetField];
	ranks[@ stTurn_targetRank] = noone;
}

return true;
