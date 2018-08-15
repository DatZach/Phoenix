/// @desc screen_reset(width, height, fullscreen, vsync, aa);
/// Initializes display
/// @param width real Resolution Width
/// @param height real Resolution Height
/// @param fullscreen bool Fullscreen
/// @param vsync bool VSync
/// @param aa real AA Level ( 2, 4, 8 )

var width = argument0;
var height = argument1;
var fullscreen = argument2;
var vsync = argument3;
var aa = argument4;

window_set_fullscreen(fullscreen);
display_reset(aa, vsync);

if (window_get_width() != width || window_get_height() != height) {
	window_set_size(width, height);
	// NOTE display_reset might need to be called after window_set_size()
	surface_resize(application_surface, width, height);
	display_set_gui_maximize(1, 1);

	trace("Resolution Change; ",
		window_get_width(), "x", window_get_height(), " -> ",
		width, "x", height
	);
}

with (mCamera) {
	width = width;
	height = height;
	event_user(0);
}
