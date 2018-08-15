/// @desc InitializeVideo();
/// Initializes Video System

#macro VIDEO_RESOLUTION_WIDTH_DEFAULT 1280
#macro VIDEO_RESOLUTION_HEIGHT_DEFAULT 720
#macro VIDEO_FULLSCREEN_DEFAULT false
#macro VIDEO_VSYNC_DEFAULT false
#macro VIDEO_AA_DEFAULT 0

global.FX_System = part_system_create();

instance_create_layer(0, 0, LAYER_INSTANCES, mCamera);

