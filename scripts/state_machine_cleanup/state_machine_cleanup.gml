/// @func state_machine_cleanup()
/// Clean up State Machine resources

if (_stateStepMap != noone) {
	ds_map_destroy(_stateStepMap);
	_stateStepMap = noone;
}
