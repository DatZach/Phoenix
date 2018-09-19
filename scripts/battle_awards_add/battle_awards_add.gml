/// @func battle_award_add(target, award)
/// Adds an Award to a target Monster
/// @context mBattle
/// @param target Monster
/// @param award Award

enum BattleAward {
	VanquishFoeI,
	VanquishFoeII,
	VanquishFoeIII,
	VanquishTrainerI,
	VanquishTrainerII,
	VanquishTrainerIII,
	ReviveI,
	ReviveII,
	ReviveIII,
	ExpedientI,
	ExpedientII,
	ExpedientIII,
	DeathsDoor,
	sizeof
}

var target = argument0;
var award = argument1;

if (awards == noone)
	awards = ds_map_create();

var list = awards[? target];
if (is_undefined(list)) {
	list = ds_list_create();
	ds_map_add(awards, target, list);
}

ds_list_add(list, award);
