/// @func attack_ability_get_modifier(ability, source, target)
/// Determines attack modifier
/// @param ability AttackAbility
/// @param source Monster
/// @param target Monster

gml_pragma("forceinline");

var ability = argument0;
var source = argument1;
var target = argument2;

// TODO Implement
return 1 * ability[@ AttackAbility.DamageModifier];
