/// @func AttackAbility_use(ability, source, target);
/// @context mBattle
/// @param ability AttackAbility
/// @param source Monster
/// @param target Monster

var this = argument0;
var source = argument1;
var target = argument2;

// roll_is_hit()
var chance = attack_ability_get_hit_chance(this, source, target);
var isHit = randchance(chance);

// roll_move_damage
var dmg;
var isCrit = randchance(attack_ability_get_critical_chance(this, source));
if (isCrit)
	dmg = mon_get_stat(source, k_stats.max_damage) * 1.5 * modifier;
else {
	dmgRange = attack_ability_get_damage_range(this, source, target);
	dmg = randint(dmgRange[0], dmgRange[1]);
}

// use
if (isHit) {
	battle_monster_harm(target, dmg);

	// TODO Specified random chance
	// TODO Specified effect
	// TODO Determine how many turns to apply for
	var r = randchance2(50, mon_get_stat(target, k_stats.bleed_resist));
	if (r == 1) {
		var statusEffect = bleed_status_effect_create(2, max(1, floor(dmg * 0.1)));
		var existingEffect = mon_find_status_effect(target, statusEffect[@ StatusEffect.Type]);
		if (existingEffect != noone)
			existingEffect[@ StatusEffect.Turns] += statusEffect[@ StatusEffect.Turns];
		else {
			var statusEffects = target[@ k_mon.status_effects];
			ds_list_add(statusEffects, statusEffect);
		}
		
		fx_battle_indicator(target, IndType.Bleed);
	}
	else if (r == 2)
		fx_battle_indicator(target, IndType.Bleed | IndType.Resist);
}