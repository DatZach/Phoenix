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