/// @func input_check_released(keycode)
/// Checks if input device button has been released this frame
/// @param keycode global.k_*
/// @returns bool

gml_pragma("forceinline");

return keyboard_check_released(argument0);
