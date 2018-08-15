/// @desc warn(value, ...)
/// @param value
/// @param ...

var str = "!WARN! ";
for (var i = 0; i < argument_count; ++i)
	str += string(argument[i]);
	
show_debug_message(str);
with (mController) {
	if (debugVerbosity >= DebugVerbosity.Warn)
		console_print(debugConsole, str);
}
