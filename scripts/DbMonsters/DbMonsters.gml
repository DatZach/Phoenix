/// @function DbMonsters()
/// Initializes Monsters Database

enum k_db_mon {
	name,
	stats,
	_size
}

// Parse JSON Database
var contents = "";
var file = file_text_open_read(working_directory + @"\Databases\Monsters.json");
while (!file_text_eof(file)) {
	contents += file_text_read_string(file);
	file_text_readln(file);
}

file_text_close(file);

var json = json_decode(contents);

// Load into Memory
global.dbMonsters = ds_list_create();
var jsonMonsters = json[? "default"];
for (var i = 0, len = ds_list_size(jsonMonsters); i < len; ++i) {
	var jsonMonster = jsonMonsters[| i];
	var dbMonster = array_create(k_db_mon._size);
		dbMonster[k_db_mon.name] = jsonMonster[? "name"];
		var jsonStats = jsonMonster[? "stats"];
		var dbStats = stats_create();
			dbStats[k_stats.hp] = jsonStats[? "hp"];
			dbStats[k_stats.strength] = jsonStats[? "strength"];
			dbStats[k_stats.protection] = jsonStats[? "protection"];
			dbStats[k_stats.speed] = jsonStats[? "speed"];
			dbStats[k_stats.accuracy] = jsonStats[? "accuracy"];
			dbStats[k_stats.critical] = jsonStats[? "critical"];
			dbStats[k_stats.dodge] = jsonStats[? "dodge"];
			dbStats[k_stats.bleed_resist] = jsonStats[? "bleedResist"];
			dbStats[k_stats.poison_resist] = jsonStats[? "poisonResist"];
			dbStats[k_stats.stun_resist] = jsonStats[? "stunResist"];
			dbStats[k_stats.move_resist] = jsonStats[? "moveResist"];
			dbStats[k_stats.death_blow_resist] = jsonStats[? "deathBlowResist"];
		dbMonster[k_db_mon.stats] = dbStats;
	ds_list_add(global.dbMonsters, dbMonster);
}
