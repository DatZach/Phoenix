/// @func attack_ability_get_hit_chance(ability, source, target)
/// Determines AttackAbility's hit chance
/// @param ability AttackAbility
/// @param source Monster
/// @param target Monster

var ability = argument0;
var source = argument1;
var target = argument2;

var modifier = 0; // TODO
var chance = ability[@ AttackAbility.Accuracy] + mon_get_stat(source, k_stats.accuracy)
		   - mon_get_stat(target, k_stats.dodge) + modifier + 5;
if (chance >= 95)
	chance = 100;
	
return chance;
