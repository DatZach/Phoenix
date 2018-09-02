/// @func randchance(threshold, resist);
/// Returns if random number is below threshold
/// Used for determining percentage chances
/// @param threshold real 0 - 100 integer

gml_pragma("forceinline");

var threshold = argument0;
var resist = argument1;

if (randchance(threshold)) {
	if (randchance(resist))
		return 2;
	return 1;
}
return 0;

//var i = irandom_range(1, 100);
//if (i <= threshold) {
//	i *= resist / 100;
//	if (i <= threshold)
//		return 2; // Resist
//	return 1; // Hit
//}

//return 0; // Fail
