/// @desc camera_set_target(instance);
/// Sets the cameras focus on a specific instance
/// @param instance id

var instance = argument0;

mCamera.target = instance;
mCamera.x = instance.x;
mCamera.y = instance.y;
mCamera.tpx = instance.x;
mCamera.tpy = instance.y;