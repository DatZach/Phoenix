/// @func ds_list_delete_value(list, value)
/// Removes a value from the list
/// @param list ds_list
/// @param value var
/// @returns bool Indicates if item was found and removed

gml_pragma("forceinline");

var list = argument0;
var value = argument1;

var idx = ds_list_find_index(list, value);
if (idx >= 0)
	return ds_list_delete(list, idx);

return false;
