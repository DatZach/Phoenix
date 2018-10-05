/// @func damage_ability_sub_get_modifier(ability, sub, source, target)
/// Determines damage modifier
/// @param ability Ability
/// @param sub DamageAbilitySub
/// @param source Monster
/// @param target Monster

gml_pragma("forceinline");

var ability = argument0;
var sub = argument1;
var source = argument2;
var target = argument3;

// TODO Implement
return 1 * sub[@ DamageAbilitySub.DamageModifier];
