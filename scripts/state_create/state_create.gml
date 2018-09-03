/// @func state_create(name, stepCallback)
/// Adds an entry to the State Machine
/// @param name string
/// @param stepCallback script

var key = argument[0];
var stepCallback = argument_count > 1 ? argument[1] : noone;
var drawCallback = argument_count > 2 ? argument[2] : noone;

if (stepCallback != noone)
	ds_map_replace(_stateStepMap, key, stepCallback);

if (drawCallback != noone)
	ds_map_replace(_stateDrawMap, key, drawCallback);
