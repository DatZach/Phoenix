/// @func ability_sub_create_from_db(json)
/// Creates an AbilitySub given a DB Entry
/// @param json ds_map
/// @returns AbilitySub

var json = argument0;

var type = json[? "type"];
switch(type) {
	case "Damage": {
		var sub = damage_ability_sub_create();
		sub[@ DamageAbilitySub.DamageModifier] = ds_map_default_value(json, "damageModifier", sub[@ DamageAbilitySub.DamageModifier]);
		sub[@ DamageAbilitySub.CriticalModifier] = ds_map_default_value(json, "criticalModifier", sub[@ DamageAbilitySub.CriticalModifier]);
		return sub;
	}
	
	case "Heal": {
		var sub = heal_ability_sub_create();
		sub[@ HealAbilitySub.Magnitude] = ds_map_default_value(json, "magnitude", sub[@ HealAbilitySub.Magnitude]);
		return sub;
	}
	
	case "Flee":
		return flee_ability_sub_create();
		
	case "Capture":
		return capture_ability_sub_create();
		
	case "AddStatus": {
		var sub = add_status_ability_sub_create();
		sub[@ AddStatusAbilitySub.StatusEffect] = status_effect_type_parse(json[? "statusEffect"]);
		sub[@ AddStatusAbilitySub.Accuracy] = ds_map_default_value(json, "accuracy", sub[@ AddStatusAbilitySub.Accuracy]);
		sub[@ AddStatusAbilitySub.Turns] = ds_map_default_value(json, "turns", sub[@ AddStatusAbilitySub.Accuracy]);
		if (ds_map_size(json) > 4)
			sub[@ AddStatusAbilitySub.Extended] = json;
		return sub;
	}
	
	case "Spawn": {
		var sub = spawn_ability_sub_create();
		sub[@ SpawnAbilitySub.Monster] = ds_map_default_value(json, "monster", sub[@ SpawnAbilitySub.Monster]);
		return sub;
	}
		
	case "Move":
	case "Skip":
		error(true, "Unsupported Sub Type: ", type);
	
	default:
		error(true, "Unknown Ability Sub Type: ", type);
}
