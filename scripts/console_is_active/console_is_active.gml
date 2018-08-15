/// @desc console_is_active(console);
/// Returns if a console is active
/// @param console Console

gml_pragma("forceinline");

var console = argument0;
return console[? "active"];
