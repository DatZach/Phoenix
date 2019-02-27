/// @func SpawnAbilitySub_use(ability, sub, source, target);
/// @context mBattle
/// @param ability Ability
/// @param sub SpawnAbilitySub
/// @param source Monster
/// @param target Monster

var ability = argument0;
var sub = argument1;
var source = argument2;
var target = argument3;

var monsterKey = sub[@ SpawnAbilitySub.MonsterKey];

var ranks = field[@ stTurn_who];
for (var i = 0; i < FIELD_RANKS; ++i) {
	if (ranks[@ i] != noone)
		continue;
	
	var mon = mon_create();
	mon_initialize(mon, monsterKey, 1);
	
	ranks[@ i] = mon;
	break;
}

return true;
