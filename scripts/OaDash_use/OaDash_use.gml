/// @func OaDash_use
/// OverworldAbility Dash

oPlayer.spd = 1200;

with (oPartyMember) {
	if (monster == oPlayer.activeMonster) {
		x = oPlayer.x;
		y = oPlayer.y;
	}
	
	spd = 1200;
}
