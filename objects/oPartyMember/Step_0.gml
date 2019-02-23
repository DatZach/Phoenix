// TODO Write a less hacky implementation
monster = mHud.selectedMonster;
if (monster == oPlayer.trainer[@ k_trainer.trainer]) {
	sprite_index = noone;
	exit;
}

// PATH FINDING
var MIN_RADIUS = 12;
var INVESTIGATE_MAX_RADIUS = 120;
var PLAYER_MAX_RADIUS = 120;

var target = noone;

// Target POIs unless player is too far
var playerDistance = distance_to_object(oPlayer);
var nearestPoi = instance_nearest(x, y, oPOI);
var poiDistance = nearestPoi == noone ? 0 : point_distance(oPlayer.x, oPlayer.y, nearestPoi.x, nearestPoi.y);

if (poiDistance < INVESTIGATE_MAX_RADIUS) {
	if (playerDistance > PLAYER_MAX_RADIUS)
		target = oPlayer.id;
	else
		target = nearestPoi;
}
else
	target = oPlayer.id;
	
if (target != noone && distance_to_object(target) < MIN_RADIUS)
	target = noone;
	
// Resolve Input
// TODO Resolve collions in path
if (target == noone) {
	moveUp = false;
	moveDown = false;
	moveLeft = false;
	moveRight = false;
}
else {
	var dx = target.x - x;
	var dy = target.y - y;
	moveLeft = abs(dx) > 24 && dx < 0;
	moveRight = abs(dx) > 24 && dx > 0;
	moveUp = abs(dy) > 24 && dy < 0;
	moveDown = abs(dy) > 24 && dy > 0;
}

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
