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
var xStep = round(lengthdir_x(1, dir));
var yStep = round(lengthdir_y(1, dir));

repeat(rep) {
	if (!collision_at(x + xStep, y + yStep)) {
		x += xStep;
		y += yStep;
	}
	else if (!collision_at(x + xStep - sign(xStep), y + yStep)) {
		xStep -= sign(xStep);
		x += xStep;
		y += yStep;
	}
	else if (!collision_at(x + xStep, y + yStep - sign(yStep))) {
		yStep -= sign(yStep);
		x += xStep;
		y += yStep;
	}
	else
		break;
}

x = floor(x);
y = floor(y);

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
