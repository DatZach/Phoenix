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
		var jsonAbilities = jsonMonster[? "abilities"];
		var dbAbilities = ds_map_create();
			var key = ds_map_find_first(jsonAbilities);
			for (var j = 0, jlen = ds_map_size(jsonAbilities); j < jlen; ++j) {
				var jsonAbility = jsonAbilities[? key];
				var dbAbility;
				switch(jsonAbility[? "type"]) {
					case "Attack":
						dbAbility = attack_ability_create();
						dbAbility[@ AttackAbility.Accuracy] = ds_map_default_value(jsonAbility, "accuracy", dbAbility[@ AttackAbility.Accuracy]);
						dbAbility[@ AttackAbility.DamageModifier] = ds_map_default_value(jsonAbility, "damageModifier", dbAbility[@ AttackAbility.DamageModifier]);
						dbAbility[@ AttackAbility.CriticalModifier] = ds_map_default_value(jsonAbility, "criticalModifier", dbAbility[@ AttackAbility.CriticalModifier]);
						break;
					case "Heal":
						dbAbility = heal_ability_create();
						dbAbility[@ HealAbility.Magnitude] = ds_map_default_value(jsonAbility, "magnitude", dbAbility[@ HealAbility.Magnitude]);
						break;
					case "Flee":
						dbAbility = flee_ability_create();
						break;
					case "Capture":
						dbAbility = capture_ability_create();
						break;
					default:
						error(true, "Unknown ability type '", jsonAbility[? "type"], "'");
						break;
				}
				
				dbAbility[@ Ability.Key] = key;
				dbAbility[@ Ability.Dependencies] = ds_map_default_value(jsonAbility, "dependencies", dbAbility[@ Ability.Dependencies]);
				dbAbility[@ Ability.RankMask] = ds_map_default_value(jsonAbility, "rankMask", dbAbility[@ Ability.RankMask]);
				dbAbility[@ Ability.TargetField] = ds_map_default_value(jsonAbility, "targetField", dbAbility[@ Ability.TargetField]);
				dbAbility[@ Ability.TargetMask] = ds_map_default_value(jsonAbility, "targetMask", dbAbility[@ Ability.TargetMask]);
				dbAbility[@ Ability.Name] = key; // TODO Nix
				
				ds_map_add(dbAbilities, key, dbAbility);
				
				key = ds_map_find_next(jsonAbilities, key);
			}
			
		dbMonster[k_db_mon.abilities] = dbAbilities;
	ds_list_add(global.dbMonsters, dbMonster);
}
