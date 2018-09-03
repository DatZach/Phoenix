/// @func state_switch(stateKey)
/// Switches to a new state
/// @param stateKey string

var key = argument0;

if (_state == noone)
	_state = key;
else
	_stateNext = key;
