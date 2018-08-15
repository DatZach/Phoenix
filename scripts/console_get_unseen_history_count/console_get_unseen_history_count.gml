/// @desc console_get_unseen_history_count(console);
/// Returns the number of unseen messages in the console
/// @param console Console

var console = argument0;
return ds_list_size(console[? "history"]) - console[? "seen-history"];
