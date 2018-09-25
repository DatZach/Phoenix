/// @func stats_create();
/// Creates a stats object
/// @returns Stats

enum k_stats {
	hp,
	strength,
	protection,
	speed,
	accuracy,
	critical,
	dodge,
	bleed_resist,
	poison_resist,
	stun_resist,
	move_resist,
	death_blow_resist,
	_size,
	
	min_damage,
	max_damage
}

return array_create(k_stats._size, 0);
