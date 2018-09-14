/// @func battle_ranks_move(fromIndex, toIndex)
/// Moves a Monster from the fromIndex to the toIndex
/// @context mBattle
/// @param fromIndex real 0..3
/// @param toIndex real 0..3

var o = argument0;
var n = argument1;
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
