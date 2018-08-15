/// @desc camera_shake(intensity)
/// Shakes the camera

#macro cs_tiny 2
#macro cs_light 6
#macro cs_medium 12
#macro cs_heavy 20
#macro cs_massive 52
#macro cs_catastophic 100

var intensity = argument0;

if (mCamera.shake < intensity)
	mCamera.shake = intensity;
