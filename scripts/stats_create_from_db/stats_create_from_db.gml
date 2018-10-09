/// @func stats_create_from_db(json)
/// Creates a Stats object from a DB Entry
/// @param json ds_map
/// @returns Stats

var json = argument0;

var stats = stats_create();
	stats[k_stats.hp] = coalesce(json[? "hp"], 0);
	stats[k_stats.strength] = coalesce(json[? "strength"], 0);
	stats[k_stats.protection] = coalesce(json[? "protection"], 0);
	stats[k_stats.speed] = coalesce(json[? "speed"], 0);
	stats[k_stats.accuracy] = coalesce(json[? "accuracy"], 0);
	stats[k_stats.critical] = coalesce(json[? "critical"], 0);
	stats[k_stats.dodge] = coalesce(json[? "dodge"], 0);
	stats[k_stats.bleed_resist] = coalesce(json[? "bleedResist"], 0);
	stats[k_stats.poison_resist] = coalesce(json[? "poisonResist"], 0);
	stats[k_stats.stun_resist] = coalesce(json[? "stunResist"], 0);
	stats[k_stats.move_resist] = coalesce(json[? "moveResist"], 0);
	stats[k_stats.death_blow_resist] = coalesce(json[? "deathBlowResist"], 0);
return stats;
