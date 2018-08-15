var console = argument0;
var arguments = argument1;
    
var str = "";
for(var i = 0; i < array_length_1d(arguments); ++i)
    str += arguments[@ i] + " ";
    
console_print(console, "Echo: " + str);
