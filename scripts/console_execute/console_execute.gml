/// @desc console_execute(console);
/// Executes console command line
/// @param console Console


var console = argument0;
    
if (!console_is_active(console))
    return 0;
    
// Parse input
var rawCommand = string_trim(keyboard_string);
var commandParts = string_split(rawCommand, " ");
if (array_length_1d(commandParts) < 1)
    return 0;
    
var commandName = string_lower(commandParts[0]);

// Execute input
var commands = console[? "commands"];
for(var i = 0; i < ds_list_size(commands); ++i)
{
    var command = commands[| i];
    if (string_lower(command[? "name"]) != commandName)
        continue;
    
    script_execute(command[? "scriptId"], console, commandParts);
    keyboard_string = "";
       
	if (console_get_unseen_history_count(console) <= 0)
		console_toggle(console);
	
    return 1;
}
    
// Couldn't find a suitable function
console_print(console, "Unrecognized command '" + commandName + "'");

return 0;
