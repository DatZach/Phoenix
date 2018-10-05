/// @func damage_ability_sub_get_damage_range(ability, source, target);
/// Determines DamageAbilitySub's damage range (min - max)
/// @param ability Ability
/// @param sub DamageAbilitySub
/// @param source Monster
/// @param target Monster
/// @return minDmg,maxDmg array[real,real]

var ability = argument0;
var sub = argument1;
var source = argument2;
var target = argument3;

var modifier = damage_ability_sub_get_modifier(ability, sub, source, target);
var minDmg = max(1, floor((mon_get_stat(source, k_stats.min_damage) - mon_get_stat(target, k_stats.protection)) * modifier));
var maxDmg = max(1, floor((mon_get_stat(source, k_stats.max_damage) - mon_get_stat(target, k_stats.protection)) * modifier));

return [minDmg, maxDmg];
