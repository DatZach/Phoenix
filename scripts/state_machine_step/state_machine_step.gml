/// @func state_machine_step()
/// Steps the State Machine

var stepCallback = _stateStepMap[? _state];
if (!is_undefined(stepCallback))
	script_execute(stepCallback)
	
if(_stateNext != _state) {
	_state = _stateNext;
	_stateTimer = 0;
}
else
	_stateTimer += DELTA_TIME;
