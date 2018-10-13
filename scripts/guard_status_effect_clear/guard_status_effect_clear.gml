/// @func guard_status_effect_clear(ranks, guardian)
/// Clears all GuardStatusEffects targeting the specified guardian
/// @param ranks Monster[]
/// @param guardian Monster

var ranks = argument0;
var guardian = argument1;

for (var i = 0; i < FIELD_RANKS; ++i) {
	var rank = ranks[@ i];
	if (rank == noone)
		continue;
				
	var guardStatusEffect = mon_find_status_effect(rank, STATUS_EFFECT_GUARD);
	if (guardStatusEffect != noone && guardStatusEffect[@ GuardStatusEffect.Guardian] == guardian)
		ds_list_delete_value(rank[@ k_mon.status_effects], guardStatusEffect);
}
