/// @func HealAbility_use(ability, source, target);
/// @context mBattle
/// @param ability HealAbility
/// @param source Monster
/// @param target Monster

var ability = argument0;
var source = argument1;
var target = argument2;

var healRange = heal_ability_get_heal_range(ability, source, target);
var hp = randint(healRange[0], healRange[1]);
target[@ k_mon.hp] += hp;
if (target[@ k_mon.hp] > mon_get_max_hp(target))
	target[@ k_mon.hp] = mon_get_max_hp(target);

fx_battle_indicator(target, IndType.Heal, string(hp));
