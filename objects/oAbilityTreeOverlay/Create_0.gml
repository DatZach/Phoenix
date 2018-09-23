#macro EV_INITIALIZE 0

PADDING = floor(GUI_WIDTH * 0.01);
LINE_HEIGHT = string_height("W");
ABILITY_WIDTH = 128;
ABILITY_HEIGHT = 64;

// Configuration
monster = noone;

// Locals
surface = noone;
nodes = ds_list_create();			// [| [ability, x, y], ... ]
connections = ds_list_create();		// [| [srcNodeIdx, destNodeIdx], ... ]
