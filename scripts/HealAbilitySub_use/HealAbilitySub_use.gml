/// @func HealAbilitySub_use(ability, sub, source, target);
/// @context mBattle
/// @param ability Ability
/// @param sub HealAbilitySub
/// @param source Monster
/// @param target Monster

var ability = argument0;
var sub = argument1;
var source = argument2;
var target = argument3;

var healRange = heal_ability_sub_get_heal_range(ability, sub, source, target);
var hp = randint(healRange[0], healRange[1]);
if (hp <= 0) {
	// TODO Revive II & III
	battle_awards_add(source, BattleAward.ReviveI);
}

target[@ k_mon.hp] += hp;
if (target[@ k_mon.hp] > mon_get_max_hp(target))
	target[@ k_mon.hp] = mon_get_max_hp(target);

fx_toast_status(target, IndType.Heal, string(hp));

return true;
