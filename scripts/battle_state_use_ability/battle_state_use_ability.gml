/// @func battle_state_use_ability();
/// STATE Use Ability

// NOTE Set Round state so that the .use() function can change it to
//		another state if desired
state_switch("Round");

var abilities = stTurn_monster[@ k_mon.abilities];
var ability = abilities[@ stTurn_selectedAbility];
var target;
if (stTurn_targetField != FIELD_NONE) {
	var ranks = field[@ stTurn_targetField];
	target = ranks[@ stTurn_targetRank];
}
else
	target = noone;

ability_use(ability, stTurn_monster, target);
