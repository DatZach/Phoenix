/// @description  key_check(specific_key, event);
/// @param specific_key real
/// @param event real

#macro E_PRESS 0
#macro E_DOWN 1
#macro E_RELEASE 2

var specific_key = argument0;
var event = argument1;

switch (event) {
    case E_PRESS:
        return keyboard_check_pressed(specific_key);
    case E_DOWN:
        return keyboard_check(specific_key);
    case E_RELEASE:
        return keyboard_check_released(specific_key);
    default:
        assert(true, "Unable to handle unrecognized event: " + string(event));
        break;
}

