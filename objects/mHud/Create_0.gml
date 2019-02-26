singleton();

// Configuration

// Constants
PADDING = floor(GUI_WIDTH * 0.01);
sPauseMenuIcons_Width = sprite_get_width(sPauseMenuIcons);
sPauseMenuIcons_Height = sprite_get_height(sPauseMenuIcons);
c_select = make_color_rgb(103, 161, 219);

enum PauseMenuTab {
	Inventory = 0,
	Party = 1,
	Map = 2,
	Options = 3,
	_size
}

// Variables
intensity = 0; targetIntensity = 0;
pauseMenuActive = false;
menuTab = PauseMenuTab.Inventory;

// Toasts
toasts = ds_list_create();

// Inventory
itemIndex = 0;
windowOffset = 0;

depth = -999;