/// @desc concat(value, ...)
/// @param value Value of any type

var str = "";
for (var i = 0; i < argument_count; ++i)
	str += string(argument[i]);

return str;
