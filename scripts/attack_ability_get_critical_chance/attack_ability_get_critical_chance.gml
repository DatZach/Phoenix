/// @func attack_ability_get_critical_chance(ability, source)
/// Determines AttackAbility's critical chance
/// @param ability AttackAbility
/// @param source Monster

var ability = argument0;
var source = argument1;

return mon_get_stat(source, k_stats.critical) + ability[@ AttackAbility.CriticalModifier];
