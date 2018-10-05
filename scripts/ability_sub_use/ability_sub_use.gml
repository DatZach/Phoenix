/// @func ability_use(ability, sub, source, target)
/// Executes AbilitySub's use handler
/// @param ability Ability
/// @param sub AbilitySub
/// @param source Monster
/// @param target Monster

gml_pragma("forceinline");

var ability = argument0;
var sub = argument1;
var source = argument2;
var target = argument3;

return script_execute(sub[@ AbilitySub.FN_Use], ability, sub, source, target);
