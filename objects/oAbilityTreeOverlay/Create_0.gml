#macro EV_INITIALIZE 0

enum AbilityNode {
	Ability,
	X,
	Y,
	sizeof
}

PADDING = floor(GUI_WIDTH * 0.01);
LINE_HEIGHT = string_height("W");
ABILITY_WIDTH = 128;
ABILITY_HEIGHT = 64;
COLUMN_PADDING = PADDING*6;

// Configuration
monster = noone;

// Locals
surface = noone;
selectedNode = noone;
nodes = ds_list_create();			// [| [ability, x, y], ... ]
connections = ds_list_create();		// [| [srcNodeIdx, destNodeIdx], ... ]
