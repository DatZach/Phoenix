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
	
	else if (yStep != 0 && xStep == 0) {
		var vcol = collision_at(x, y + yStep);
		if (!vcol)
			y += yStep;
		else if (vcol && !collision_at(x + 1, y + yStep)) {
			x += 1;
			y += yStep;
		}
		else if (vcol && !collision_at(x - 1, y + yStep)) {
			x -= 1;
			y += yStep;
		}
		else
			break;
	}
	
	else if (xStep != 0 && yStep == 0) {
		var hcol = collision_at(x + xStep, y);
		if (!hcol)
			x += xStep;
		else if (hcol && !collision_at(x + xStep, y + 1)) {
			x += xStep;
			y += 1;
		}
		else if (hcol && !collision_at(x + xStep, y - 1)) {
			x += xStep;
			y -= 1;
		}
		else
			break;
	}
	
	else
		break;
}

x = floor(x);
y = floor(y);

// INTERACTION
dir = point_direction(0, 0, moveRight - moveLeft, moveDown - moveUp);

if (moveLeft || moveRight || moveUp || moveDown) {
	// Acceleration
	if (spd < maxspd)
		spd += accel;
		
	// Friction
	spd = lerp(spd, maxspd * sign(spd), fric);
}
else
	spd = 0;
