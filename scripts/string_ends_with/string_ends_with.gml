/// @desc string_ends_with(str, substr)
/// @param str String to search
/// @param substr Substring to search for in 'str'
/// @returns bool If str ends with substr

gml_pragma("forceinline");

var str = argument0;
var substr = argument1;

var strLen = string_length(str);
var substrLen = string_length(substr);
return string_copy(str, max(0, strLen - substrLen), substrLen) == substr;