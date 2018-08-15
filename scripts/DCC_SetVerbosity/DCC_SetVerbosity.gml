var console = argument0;
var arguments = argument1;
    
enum DebugVerbosity {
	None,
	Error,
	Warn,
	Info
}

var value = arguments[@ 1];
switch(string_lower(value)) {
	case "error":
		mController.debugVerbosity = DebugVerbosity.Error;
		break;
		
	case "warn":
		mController.debugVerbosity = DebugVerbosity.Warn;
		break;
		
	case "all":
	case "info":
		mController.debugVerbosity = DebugVerbosity.Info;
		break;
		
	case "none":
		mController.debugVerbosity = DebugVerbosity.None;
		break;
	
	default:
		console_print(mController.debugConsole, "Unrecognized trace mode '" + value + "'");
		break;
}
