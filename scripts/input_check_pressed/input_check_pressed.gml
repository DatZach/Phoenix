/// @func input_check_pressed(keycode)
/// Checks if input device button has been pressed this frame
/// @param keycode global.k_*
/// @returns bool

gml_pragma("forceinline");

return keyboard_check_pressed(argument0);
