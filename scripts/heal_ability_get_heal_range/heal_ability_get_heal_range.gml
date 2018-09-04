/// @func heal_ability_get_heal_range(ability, source, target);
/// Determines HealAbility's heal range (min - max)
/// @param ability HealAbility
/// @param source Monster
/// @param target Monster
/// @return minHeal,maxHeal array[real,real]

var ability = argument0;
var source = argument1;
var target = argument2;

var minHeal = max(1, floor(mon_get_max_hp(source) * ability[@ HealAbility.Magnitude]));
var maxHeal = max(1, floor(minHeal + source[@ k_mon.level]));

return [minHeal, maxHeal];
