/// @desc trace(value, ...)
/// @param value
/// @param ...

var str = "!INFO! ";
for (var i = 0; i < argument_count; ++i)
	str += string(argument[i]);
	
show_debug_message(str);
with (mController) {
	if (debugVerbosity >= DebugVerbosity.Info)
		console_print(debugConsole, str);
}
