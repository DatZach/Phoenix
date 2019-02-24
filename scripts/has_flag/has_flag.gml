/// @func has_flag(value, flag)
/// Returns true if specified bit is set
/// @param value real Value to check
/// @param flag real Mask to check
/// @returns bool

gml_pragma("forceinline");

return (argument0 & argument1) == argument1;
