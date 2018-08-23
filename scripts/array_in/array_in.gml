/// @func array_in(array, elem);
/// Returns if element is in array
/// @param array array
/// @param elem var
/// @returns bool

var array = argument0;
var elem = argument1;

for (var i = 0, len = array_length_1d(array); i < len; ++i) {
	if (array[@ i] == elem)
		return true;
}

return false;
