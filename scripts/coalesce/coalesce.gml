gml_pragma("forceinline");

var value = argument0;
var fallback = argument1;

return is_undefined(value) ? fallback : value;
