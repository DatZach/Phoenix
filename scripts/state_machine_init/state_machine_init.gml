/// @func state_machine_init()
/// Initialize the variables required for the state engine.

_state = noone;
_stateNext = _state;
_stateStepMap = ds_map_create();
_stateDrawMap = ds_map_create();
_stateTimer = 0;
