/// @func clamp_wrap(x, min, max);
/// Clamps x to min and max and wraps remainder around from min/max
/// @param x real value
/// @param min real minimum value
/// @param max real maximum value
/// @returns real

gml_pragma("forceinline");

var _x = argument0;
var _min = argument1;
var _max = argument2;

// TODO Not fully correct
if (_x < _min)
	_x = _max;
else if (_x > _max)
	_x = 0;

return _x;

//var range = _max - _min;

//while (true) {
//	if (_x < _min)
//		_x = _max - _x % range;
//	else if (_x >= _max)
//		_x = _x % range;
//	else
//		break;
//}

//return _x;
	