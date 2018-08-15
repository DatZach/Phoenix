/// @desc console_create()
/// Creates a new console

var console = ds_map_create();
    
console[? "active"] = false;
console[? "delimiter"] = " ";
console[? "cursor"] = 0;
console[? "history"] = ds_list_create();
console[? "commands"] = ds_list_create();
console[? "seen-history"] = 0;
    
return console;
