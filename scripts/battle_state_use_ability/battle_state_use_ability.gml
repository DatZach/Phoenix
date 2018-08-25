/// @func battle_state_use_ability();
/// STATE Use Ability

var abilities = stTurn_monster[@ k_mon.abilities];
var ability = abilities[@ stTurn_selectedAbility];
var ranks = field[@ stTurn_targetField];
var target = ranks[@ stTurn_targetRank];

var fnUse = ability[@ Ability.FnUse];
script_execute(fnUse, ability, stTurn_monster, target);

state_switch("Round");
