/// @func spawn_ability_sub_create();
/// Creates a new Spawn AbilitySub
/// @returns SpawnAbilitySub

#macro ABILITY_SUB_SPAWN 7

enum SpawnAbilitySub {
	MonsterKey = AbilitySub.sizeof,				// string MonDB Key
	sizeof
}

var value = array_create(FleeAbilitySub.sizeof);
	value[@ AbilitySub.Type] = ABILITY_SUB_FLEE;
	value[@ AbilitySub.FN_Use] = SpawnAbilitySub_use;
	value[@ AbilitySub.FN_DrawDescription] = SpawnAbilitySub_draw_description;
	value[@ AbilitySub.FN_DrawTargetDescription] = noone;
	
	value[@ SpawnAbilitySub.MonsterKey] = noone;
return value;