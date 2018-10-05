/// @func status_effect_type_parse(value)
/// Returns the proper StatusEffect enum value given a string
/// @param value string
/// @returns real STATUS_EFFECT_*

var value = argument0;

switch(value) {
	case "Bleed":
		return STATUS_EFFECT_BLEED;
	case "Stun":
		return STATUS_EFFECT_STUN;
	case "Poison":
		return STATUS_EFFECT_POISON;
	case "Move":
		return STATUS_EFFECT_MOVE;
	
	default:
		error(true, "Illegal Value: ", value);
}
