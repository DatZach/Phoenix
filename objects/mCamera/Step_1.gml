/// @desc Update Camera, Video

if (camera == noone) exit;
if (!instance_exists(target)) exit;

if (shake <= 0) {
	var dx = abs(target.x - x) / room_width;
	var dy = abs(target.y - y) / room_height;
	var d = max(max(dx, dy), 0.3);
	x = round(lerp(x, target.x, d));
	y = round(lerp(y, target.y, d));
}
else {
	x = target.x + (target.x - target.xprevious) / 2;
	y = target.y + (target.y - target.yprevious) / 2;
	
	if (shake > cs_heavy) {
		x += irandom(60);
		y += irandom(60);
	}
	else if (shake > cs_medium) {
		x += irandom(32);
		y += irandom(32);
	}
	else if (shake > cs_light) {
		x += irandom(16);
		y += irandom(16);
	}
	else if (shake > 0) {
		x += irandom(6);
		y += irandom(6);
	}

	--shake;
}

camera_set_view_pos(
	camera,
	x - width * 0.5,
	y - height * 0.5
);
