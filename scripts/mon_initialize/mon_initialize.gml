/// @func mon_initialize(mon, classKey, level)
/// Initializes all the properties required for a Monster
/// @param mon Monster
/// @param classKey string Key of Monster in DB
/// @param level real 1 - 6

// TODO Rewrite this trash

var mon = argument0;
var classKey = argument1;
var level = argument2;

// HACK Why the hell isn't this a dictionary?
var class = noone;
for (var i = 0, ilen = ds_list_size(global.dbMonsters); i < ilen; ++i) {
	var dbMon = global.dbMonsters[| i];
	if (dbMon[@ k_db_mon.name] == classKey) {
		class = i;
		break;
	}
}

if (class == noone)
	error(true, "Cannot spawn non-existent class: ", classKey);

var seed = randint();

mon_set_seed(mon, class, seed);
mon[@ k_mon.experience] = mon_get_level_experience(mon, level);
repeat(level)
	mon_level_up(mon);

mon[@ k_mon.hp] = mon_get_max_hp(mon);

// TODO Correctly resolve abilities properly for a level
var dbMonster = global.dbMonsters[| class];
var dbAbilities = dbMonster[@ k_db_mon.abilities];
var abilities = mon[@ k_mon.abilities];
var ai = 0;

for (var abilityKey = ds_map_find_first(dbAbilities); !is_undefined(abilityKey) && ai < 4; abilityKey = ds_map_find_next(dbAbilities, abilityKey)) {
	var ability = dbAbilities[? abilityKey];
	var dependencies = ability[@ Ability.Dependencies];
	if (!ds_exists(dependencies, ds_type_list) || ds_list_size(dependencies) > 0)
		continue;
	
	abilities[@ ai++] = ability;
}
