/// @func damage_ability_sub_get_critical_chance(ability, sub, source)
/// Determines DamageAbilitySub's critical chance
/// @param ability Ability
/// @param sub DamageAbilitySub
/// @param source Monster

var ability = argument0;
var sub = argument1;
var source = argument2;

return mon_get_stat(source, k_stats.critical) + sub[@ DamageAbilitySub.CriticalModifier];
