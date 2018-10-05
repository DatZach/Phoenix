/// @func damage_ability_sub_get_hit_chance(ability, sub, source, target)
/// Determines DamageAbilitySub's hit chance
/// @param ability Ability
/// @param sub DamageAbilitySub
/// @param source Monster
/// @param target Monster

var ability = argument0;
var sub = argument1;
var source = argument2;
var target = argument3;

var modifier = 0; // TODO
var chance = sub[@ DamageAbilitySub.Accuracy] + mon_get_stat(source, k_stats.accuracy)
		   - mon_get_stat(target, k_stats.dodge) + modifier + 5;
if (chance >= 95)
	chance = 100;
	
return chance;
