/// @desc error(fatal, value, ...)
/// @param fatal
/// @param value
/// @param ...

var str = "!ERR ! ";
for (var i = 1; i < argument_count; ++i)
	str += string(argument[i]);

if (argument[0])
	show_error(str, true);

show_debug_message(str);
with (mController) {
	if (debugVerbosity >= DebugVerbosity.Error)
		console_print(debugConsole, str);
}
