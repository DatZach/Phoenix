/// @desc Animation & Movement

// ANIMATION
if (spd > 0) {
	if (dir == 0)
		sprite_index = asset_get_index(concat("s", mon_get_name(monster), "WalkRight"));
	else if (dir == 90)
		sprite_index = asset_get_index(concat("s", mon_get_name(monster), "WalkUp"));
	else if (dir == 180)
		sprite_index = asset_get_index(concat("s", mon_get_name(monster), "WalkLeft"));
	else if (dir == 270)
		sprite_index = asset_get_index(concat("s", mon_get_name(monster), "WalkDown"));
		
	image_speed = abs(spd) / maxspd;
	if (image_speed == 0)
	    image_index = 1;
}
else if (spd == 0) {
	if (dir == 0)
		sprite_index = asset_get_index(concat("s", mon_get_name(monster), "IdleRight"));
	else if (dir == 90)
		sprite_index = asset_get_index(concat("s", mon_get_name(monster), "IdleUp"));
	else if (dir == 180)
		sprite_index = asset_get_index(concat("s", mon_get_name(monster), "IdleLeft"));
	else if (dir == 270)
		sprite_index = asset_get_index(concat("s", mon_get_name(monster), "IdleDown"));
		
	image_speed = 1;
}

// MOVEMENT
event_inherited();
