/// @func state_machine_draw()
/// Draws the State Machine

var drawCallback = _stateDrawMap[? _state];
if (!is_undefined(drawCallback))
	script_execute(drawCallback)
