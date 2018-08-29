/// @func ability_use(ability, source, target)
/// Uses an ability on a target Monster given a source Monster
/// @param ability Ability
/// @param source Monster
/// @param target Monster

gml_pragma("forceinline");

var ability = argument0;
var source = argument1;
var target = argument2;

return script_execute(ability[@ Ability.FN_Use], ability, source, target);
