/// @desc mon_create();
/// Creates an empty Monster struct
/// @return Monster

enum k_mon {
	class,
	seed,
	base_stats,
	iv_stats,
	abilities,
	status_effects,
	level,
	hp,
	dead,
	dead_cooldown,
	_size
}

var mon = array_create(k_mon._size);
	mon[k_mon.class] = noone;
	mon[k_mon.seed] = 0;
	mon[k_mon.base_stats] = stats_create();
	mon[k_mon.iv_stats] = stats_create();
	mon[k_mon.abilities] = array_create(4, noone);
	mon[k_mon.status_effects] = ds_list_create();
	mon[k_mon.level] = 0;
	mon[k_mon.hp] = 0;
	mon[k_mon.dead] = false;
	mon[k_mon.dead_cooldown] = 0;
return mon;
