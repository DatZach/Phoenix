/// @func AttackAbility_use(ability, source, target);
/// @context mBattle
/// @param ability AttackAbility
/// @param source Monster
/// @param target Monster

var this = argument0;
var source = argument1;
var target = argument2;

assert(source != noone, "Source cannot be noone");
assert(target != noone, "Target cannot be noone");

// roll_is_hit()
var chance = attack_ability_get_hit_chance(this, source, target);
var isHit = randchance(chance);

// roll_move_damage
var dmg;
var isCrit = randchance(attack_ability_get_critical_chance(this, source));
if (isCrit)
	dmg = mon_get_stat(source, k_stats.max_damage) * attack_ability_get_modifier(this, source, target) * 1.5;
else {
	dmgRange = attack_ability_get_damage_range(this, source, target);
	dmg = randint(dmgRange[0], dmgRange[1]);
}

// use
if (isHit) {
	battle_monster_harm(target, dmg);
	if (isCrit && target[@ k_mon.dead]) {
		var ranks = field[@ stTurn_targetField];
		ranks[@ stTurn_targetRank] = noone;
	}

	var dbStatusEffects = this[@ Ability.StatusEffects];
	for (var i = 0, isize = ds_list_size(dbStatusEffects); i < isize; ++i) {
		var dbStatusEffect = dbStatusEffects[| i];
		
		var statusEffect = status_effect_create_from_db(dbStatusEffect);
		var indType = IndType.Bleed + statusEffect[@ StatusEffect.Type];
		
		var isHit = randchance(dbStatusEffect[? "accuracy"] - status_effect_get_resistence(statusEffect, target));
		if (isHit) {
			var existingEffect = mon_find_status_effect(target, statusEffect[@ StatusEffect.Type]);
			if (existingEffect != noone)
				existingEffect[@ StatusEffect.Turns] += statusEffect[@ StatusEffect.Turns];
			else {
				var statusEffects = target[@ k_mon.status_effects];
				ds_list_add(statusEffects, statusEffect);
			}
			
			fx_battle_indicator(target, indType);
		}
		else
			fx_battle_indicator(target, indType | IndType.Resist);
	}
}