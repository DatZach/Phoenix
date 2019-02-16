/// @desc Update Camera, Video

if (camera == noone) exit;
if (!instance_exists(target)) exit;

var tx = target.x + lengthdir_x(width * RADIUS, target.dir);
var ty = target.y + lengthdir_y(height * RADIUS, target.dir);

x += target.x - tpx;
y += target.y - tpy;

if (shake <= 0) {
	var dx = abs(tx - x) / (width * (RADIUS*2)) * RADIUS;
	var dy = abs(ty - y) / (height * (RADIUS*2)) * RADIUS;
	var d = clamp(max(dx, dy), 0.025, 0.075);
	x = lerp(x, tx, d);
	y = lerp(y, ty, d);
	
	//trace(x, ",", y, " -> ", tx, ",", ty);
}
else {
	x = tx + (tx - target.xprevious) / 2;
	y = ty + (ty - target.yprevious) / 2;
	
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
	round(clamp(x - width * 0.5, 0, room_width - width)),
	round(clamp(y - height * 0.5, 0, room_height - height))
);

tpx = target.x;
tpy = target.y;
