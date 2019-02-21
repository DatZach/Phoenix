/// @func mon_get_overworld_ability(monster)
/// Returns Monster's overworld ability
/// @param monster Monster
/// @returns OverworldAbility

var mon = argument0;
var class = mon[@ k_mon.class];
var dbMonster = global.dbMonsters[| class];

var oaKey = dbMonster[@ k_db_mon.overworld_ability];
if (oaKey == undefined)
	return;

var scriptId = asset_get_index(concat("Oa", oaKey, "_use"));
if (scriptId == -1)
	error(true, "Unknown OA: ", oaKey);

return script_execute(scriptId);
