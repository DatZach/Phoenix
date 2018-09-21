/// @func mon_get_name(monster)
/// Returns Monster's class name
/// @param monster Monster
/// @returns string

var mon = argument0;
var class = mon[@ k_mon.class];
var dbMonster = global.dbMonsters[| class];
return dbMonster[@ k_db_mon.name];