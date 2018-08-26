/// @desc Initializes Game

// GM Engine
gml_release_mode(RELEASE_MODE);
game_set_speed(TARGET_FPS, gamespeed_fps);
randomize();

// Engine
InitializeVideo();
InitializeAudio();
InitializeKeyBindings();
InitializeDatabases();

// Globals

// Load Settings prior to initializing managers
settings_load();

// Managers
instance_create_layer(0, 0, LAYER_INSTANCES, mController);
