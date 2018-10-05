/// @func heal_ability_sub_get_heal_range(ability, sub, source, target);
/// Determines HealAbility's heal range (min - max)
/// @param ability Ability
/// @param sub HealAbilitySub
/// @param source Monster
/// @param target Monster
/// @return minHeal,maxHeal array[real,real]

var ability = argument0;
var sub = argument1;
var source = argument2;
var target = argument3;

var minHeal = max(1, floor(mon_get_max_hp(source) * sub[@ HealAbilitySub.Magnitude]));
var maxHeal = max(1, floor(minHeal + source[@ k_mon.level]));

return [minHeal, maxHeal];
