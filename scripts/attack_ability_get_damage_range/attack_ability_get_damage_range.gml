/// @func attack_ability_get_damage_range(ability, source, target);
/// Determines AttackAbility's damage range (min - max)
/// @param ability AttackAbility
/// @param source Monster
/// @param target Monster
/// @return minDmg,maxDmg array[real,real]

var ability = argument0;
var source = argument1;
var target = argument2;

var modifier = attack_ability_get_modifier(ability, source, target);
var minDmg = max(1, floor((mon_get_stat(source, k_stats.min_damage) - mon_get_stat(target, k_stats.protection)) * modifier));
var maxDmg = max(1, floor((mon_get_stat(source, k_stats.max_damage) - mon_get_stat(target, k_stats.protection)) * modifier));

return [minDmg, maxDmg];
