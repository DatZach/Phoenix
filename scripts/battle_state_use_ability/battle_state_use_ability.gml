/// @func battle_state_use_ability();
/// STATE Use Ability

// NOTE Set Round state so that the .use() function can change it to
//		another state if desired
state_switch("Round");

var abilities = stTurn_monster[@ k_mon.abilities];
var ability = abilities[@ stTurn_selectedAbility];
var ranks = field[@ stTurn_targetField];
var target = ranks[@ stTurn_targetRank];

var fnUse = ability[@ Ability.FnUse];
script_execute(fnUse, ability, stTurn_monster, target);
