/// @func choosearr(array)
/// Returns a random item from an array
/// @param array array
/// @returns var

var array = argument0;
var len = array_length_1d(array) - 1;
var i = irandom(len);

return array[@ i];
