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
	case "Gaurd":
		return STATUS_EFFECT_GAURD;
	case "Buff":
		return STATUS_EFFECT_BUFF;
	case "Debuff":
		return STATUS_EFFECT_DEBUFF;
	
	default:
		error(true, "Illegal Value: ", value);
}
