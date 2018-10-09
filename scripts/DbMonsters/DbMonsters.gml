/// @function DbMonsters()
/// Initializes Monsters Database

enum k_db_mon {
	name,			// string
	stats,			// Stats
	abilities,		// Map<string, Ability>
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
		dbMonster[k_db_mon.stats] = stats_create_from_db(jsonMonster[? "stats"]);
		var jsonAbilities = jsonMonster[? "abilities"];
		var dbAbilities = ds_map_create();
			var key = ds_map_find_first(jsonAbilities);
			for (var j = 0, jlen = ds_map_size(jsonAbilities); j < jlen; ++j) {
				var jsonAbility = jsonAbilities[? key];
				var dbAbility = ability_create();
				dbAbility[@ Ability.Key] = key;
				dbAbility[@ Ability.Dependencies] = ds_map_default_value(jsonAbility, "dependencies", dbAbility[@ Ability.Dependencies]);
				dbAbility[@ Ability.RankMask] = ds_map_default_value(jsonAbility, "rankMask", dbAbility[@ Ability.RankMask]);
				dbAbility[@ Ability.TargetField] = ds_map_default_value(jsonAbility, "targetField", dbAbility[@ Ability.TargetField]);
				dbAbility[@ Ability.TargetMask] = ds_map_default_value(jsonAbility, "targetMask", dbAbility[@ Ability.TargetMask]);
				dbAbility[@ Ability.Name] = key; // TODO Nix
				
				var jsonAbilitySubs = jsonAbility[? "sub"];
				for (var k = 0, ksize = ds_list_size(jsonAbilitySubs); k < ksize; ++k) {
					var jsonAbilitySub = jsonAbilitySubs[| k];
					var dbAbilitySub = ability_sub_create_from_db(jsonAbilitySub);
					ds_list_add(dbAbility[@ Ability.Sub], dbAbilitySub);
				}
				
				ds_map_add(dbAbilities, key, dbAbility);
				key = ds_map_find_next(jsonAbilities, key);
			}
			
		dbMonster[k_db_mon.abilities] = dbAbilities;
	ds_list_add(global.dbMonsters, dbMonster);
}
