/// @desc Initialize Camera for Resolution

if (view_get_camera(VIEW) == camera) exit;

if (camera != noone) 
	camera_destroy(camera);

camera = camera_create_view(
	x, y, width, height,
	0, noone, -1, -1, 0, 0
);

view_set_visible(VIEW, true);
view_set_xport(VIEW, 0);
view_set_yport(VIEW, 0);
view_set_wport(VIEW, width);
view_set_hport(VIEW, height);
view_set_camera(VIEW, camera);
camera_apply(camera);

view_enabled = true;
