/// @func status_effect_create_from_db(dbStatusEffect)
/// Creates a StatusEffect given an AbilityStatusEffect
/// @param dbStatusEffect AbilityStatusEffect
/// @returns StatusEffect

var dbStatusEffect = argument0;

var turns = dbStatusEffect[? "turns"];

switch(dbStatusEffect[? "type"]) {
	case "Bleed":
		var strength = dbStatusEffect[? "strength"];
		return bleed_status_effect_create(turns, strength);
	case "Poison":
		var strength = dbStatusEffect[? "strength"];
		return poison_status_effect_create(turns, strength);
	case "Stun":
		return stun_status_effect_create(turns);
	case "Move":
		return move_status_effect_create();
	default:
		error(true, "Out of Range: ", statusEffect[? "type"]);
}
