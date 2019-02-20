/// @desc settings_load();
/// Configures Engine given settings in settings.ini

ini_open(SETTINGS_FILENAME);

// Video
var resolution = ini_read_string("Video", "resolution", concat(VIDEO_RESOLUTION_WIDTH_DEFAULT, "x", VIDEO_RESOLUTION_HEIGHT_DEFAULT));
var xPos = string_pos("x", resolution);
var resWidth = real(string_copy(resolution, 1, xPos));
var resHeight = real(string_copy(resolution, xPos + 1, string_length(resolution) - xPos));
var fullscreen = ini_read_real("Video", "fullscreen", VIDEO_FULLSCREEN_DEFAULT);
var vsync = ini_read_real("Video", "vsync", VIDEO_VSYNC_DEFAULT);
var aa = ini_read_real("Video", "aa", VIDEO_AA_DEFAULT);

screen_reset(resWidth, resHeight, fullscreen, vsync, aa);

// Audio
global.AE_GlobalVolume = ini_read_real("Audio", "global", global.AE_GlobalVolume);
global.AE_MusicVolume = ini_read_real("Audio", "music", global.AE_MusicVolume);
global.AE_SFXVolume = ini_read_real("Audio", "sfx", global.AE_SFXVolume);

// Key Bindings
global.k_left = ini_read_real("KeyBindings", "left", global.k_left);
global.k_right = ini_read_real("KeyBindings", "right", global.k_right);
global.k_up = ini_read_real("KeyBindings", "up", global.k_up);
global.k_down = ini_read_real("KeyBindings", "down", global.k_down);
//global.k_jump = ini_read_real("KeyBindings", "jump", global.k_jump);
//global.k_kick = ini_read_real("KeyBindings", "kick", global.k_kick);
//global.k_melee = ini_read_real("KeyBindings", "melee", global.k_melee);
global.k_action = ini_read_real("KeyBindings", "action", global.k_action);
global.k_toggle_item_overlay = ini_read_real("KeyBindings", "toggle_item_overlay", global.k_toggle_item_overlay);
global.k_toggle_pause_menu = ini_read_real("KeyBindings", "toggle_pause_menu", global.k_toggle_pause_menu);
global.k_bumper_left = ini_read_real("KeyBindings", "bumper_left", global.k_bumper_left);
global.k_bumper_right = ini_read_real("KeyBindings", "bumper_right", global.k_bumper_right);

ini_close();

