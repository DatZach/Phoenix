/// @func SkipAbility_use(ability, source, target);
/// @context mBattle
/// @param ability SkipAbility
/// @param source Monster
/// @param target Monster

var ability = argument0;
var source = argument1;
var target = argument2;

// TODO Skipping should have some penalty
state_switch("Round");
