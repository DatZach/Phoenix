/// @func AttackAbility_use(ability, source, target);
/// @context mBattle
/// @param ability AttackAbility
/// @param source Monster
/// @param target Monster

var _this = argument0;
var _source = argument1;
var _target = argument2;

// TODO Split into new function
var o = stTurn_rank;
var n = stTurn_targetRank;
var ranks = field[@ stTurn_targetField];
var source = ranks[@ o];

if (o < n) {
	for (var i = o; i < n; ++i)
		ranks[@ i] = ranks[@ i + 1];
}
else {
	for (var i = o; i > n; --i)
		ranks[@ i] = ranks[@ i - 1];
}

ranks[@ n] = source;
