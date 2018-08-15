/// @desc console_print(console);
/// Prints a message to the console
/// @param console Console

var console = argument0;
var message = argument1;
    
var history = console[? "history"];
    
ds_list_add(history, message);
