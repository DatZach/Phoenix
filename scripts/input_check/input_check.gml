/// @func input_check(keycode)
/// Checks if input device button is currently pressed
/// @param keycode global.k_*
/// @returns bool

gml_pragma("forceinline");

return keyboard_check(argument0);

