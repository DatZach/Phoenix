// Initialize
singleton();

// Initialize Debug Console
debugConsole = console_create();
debugVerbosity = DebugVerbosity.Warn;
DBG_ShowAABB = false;
DBG_NoClip = false;

console_add_command(debugConsole, "echo", DCC_Echo);
console_add_command(debugConsole, "dbgo", DCC_ToggleDebugOverlay);
console_add_command(debugConsole, "aabb", DCC_ToggleAABB);
console_add_command(debugConsole, "nc", DCC_ToggleNoClip);
console_add_command(debugConsole, "trace", DCC_SetVerbosity);
console_add_command(debugConsole, "rr", DCC_RestartRoom);

alarm[0] = 1;
