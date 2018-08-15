/// @desc Format a string by inserting its arguments
/// @arg string The string to format
/// @arg [arg,..] The arguments to insert
 
// sformat("Localised string with {0} argument", "an");
// sformat("Current date: {0,xx}/{1,xx}/{2,xxxx}", 29, 3, 2018); -> Current date: 29/03/2018
 
var _string = argument[0];
var argc = 0;
while(argc < argument_count - 1) {
    var found = 0;
    var argstr = "{" + string(argc) + "}";
    var argstr_format = "{" + string(argc) + ",";
   
    if(string_count(argstr, _string) > 0) found = 1;
    else if(string_count(argstr_format, _string) > 0) found = 2;
   
    if(found != 0) {
        var foundstr;
        var value = argument[argc + 1];
       
        // Is it followed by a format specifier?
        if(found == 2) {
            foundstr = argstr_format;
            // Format the string
            // 'x' denotes how many digits to show
            var index = string_pos(foundstr, _string) + string_length(foundstr);
            var format = string_copy(_string, index, string_length(_string) - index);
            // Count the x's
            var digits = 1;
            value = string(value);
            while(string_char_at(format, digits) == "x") {
                foundstr = foundstr + "x";
                if(string_length(value) < digits) value = "0" + value;
                ++digits;
            }
            foundstr += "}";
        }
        else foundstr = argstr;
       
        _string = string_replace_all(_string, foundstr, value);
    }
    ++argc;
}
return _string;
