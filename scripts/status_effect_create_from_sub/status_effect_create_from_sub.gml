/// @func status_effect_create_from_sub(sub)
/// Creates a StatusEffect given an AddStatusAbilitySub
/// @param dbStatusEffect AddStatusAbilitySub
/// @returns StatusEffect

var sub = argument0;

var type = sub[@ AddStatusAbilitySub.StatusEffect];
var turns = sub[@ AddStatusAbilitySub.Turns];
var ext = sub[@ AddStatusAbilitySub.Extended];

switch(type) {
	case STATUS_EFFECT_BLEED: {
		var strength = ext[? "strength"];
		return bleed_status_effect_create(turns, strength);
	}
	case STATUS_EFFECT_POISON: {
		var strength = ext[? "strength"];
		return poison_status_effect_create(turns, strength);
	}
	case STATUS_EFFECT_STUN:
		return stun_status_effect_create(turns);
	case STATUS_EFFECT_MOVE:
		return move_status_effect_create();
	case STATUS_EFFECT_GUARD:
		return guard_status_effect_create(turns, noone); // TODO Set guardian
	case STATUS_EFFECT_BUFF: {
		var stats = stats_create_from_db(ext[? "stats"]);
		return buff_status_effect_create(turns, stats);
	}
	case STATUS_EFFECT_DEBUFF: {
		var stats = stats_create_from_db(ext[? "stats"]);
		return debuff_status_effect_create(turns, stats);
	}
	default:
		error(true, "Out of Range: ", type);
}
