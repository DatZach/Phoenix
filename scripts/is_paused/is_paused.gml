/// @func is_paused()
/// Returns if the game is paused or not
/// @returns bool

gml_pragma("forceinline");

return mHud.pauseMenuActive
	|| (!RELEASE_MODE && console_is_active(mController.debugConsole));
