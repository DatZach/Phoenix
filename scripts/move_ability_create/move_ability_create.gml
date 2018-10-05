/// @func move_ability_create([distance, rank])
/// Creates a new Ability with a Move sub
/// @param distance real Optional
/// @param rank real Optional (Required if distance set)
/// @returns Ability

var distance = argument_count > 0 ? argument[0] : 0;
var position = argument_count > 0 ? argument[1] : 0;

var mask = (((1 << (distance+1)) - 1) << position) | (1<<max(0, position-1));

var ability = ability_create();
	ability[@ Ability.TargetMask] = mask;
	var sub = move_ability_sub_create();
	ds_list_add(ability[@ Ability.Sub], sub);
return ability;
