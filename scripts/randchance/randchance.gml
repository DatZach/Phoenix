/// @func randchance(threshold);
/// Returns if random number is below threshold
/// Used for determining percentage chances
/// @param threshold real 0 - 100 integer

gml_pragma("forceinline");

var threshold = argument0;
return irandom_range(1, 100) <= threshold;
