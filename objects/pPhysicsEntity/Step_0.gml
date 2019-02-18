if (in_battle()) exit;

// Clamp velocities
var absSpeed = abs(spd);
if (absSpeed > maxspd) {
    if (absSpeed - maxspd < 1)
        spd = maxspd * sign(spd);
    else
        xspd = lerp(spd, maxspd * sign(spd), 0.01);
}

// Calculate xrep/yrep
// Delta Time adjusted pixels to move per frame
// *speed		Number of pixels to move per second
// *rep			Number of pixels to move this frame

var dtspd = spd * DELTA_TIME;
if (dtspd > 0)
    save += dtspd - floor(dtspd);
else if (dtspd < 0)
    save += abs(dtspd - ceil(dtspd));
    
var rep = abs(dtspd);
while (save >= 1) {
    save -= 1;
	++rep;
}

rep = floor(rep);

// MOVEMENT
// BUG BBox not fully respected
var xStep = round(lengthdir_x(1, dir));
var yStep = round(lengthdir_y(1, dir));
var ex = xStep < 0 ? bbox_left : bbox_right;
var ey = yStep < 0 ? bbox_top : bbox_bottom;
var bx = ex;
var by = ey;

repeat(rep) {
	if (!collision_at(bx + xStep, by + yStep)) {
		bx += xStep;
		by += yStep;
	}
	else if (!collision_at(bx + xStep - sign(xStep), by + yStep)) {
		xStep -= sign(xStep);
		bx += xStep;
		by += yStep;
	}
	else if (!collision_at(bx + xStep, by + yStep - sign(yStep))) {
		yStep -= sign(yStep);
		bx += xStep;
		by += yStep;
	}
	else
		break;
}

x = floor(x + bx - ex);
y = floor(y + by - ey);

// INTERACTION
if (moveLeft || moveRight || moveUp || moveDown) {
	dir = point_direction(0, 0, moveRight - moveLeft, moveDown - moveUp);
	
	// Acceleration
	if (spd < maxspd)
		spd += accel;
		
	// Friction
	spd = lerp(spd, maxspd * sign(spd), fric);
}
else
	spd = 0;
