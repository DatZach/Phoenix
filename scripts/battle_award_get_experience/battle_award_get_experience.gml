/// @func battle_award_get_experience(award)
/// Returns number of experience points associated with an Award
/// @param award BattleAward
/// @returns real

var award = argument0;

switch(award) {
	case BattleAward.VanquishFoeI: return 100;
	case BattleAward.VanquishFoeII: return 250;
	case BattleAward.VanquishFoeIII: return 500;
	case BattleAward.VanquishTrainerI: return 250;
	case BattleAward.VanquishTrainerII: return 400;
	case BattleAward.VanquishTrainerIII: return 650;
	case BattleAward.ReviveI: return 50
	case BattleAward.ReviveII: return 125;
	case BattleAward.ReviveIII: return 250;
	case BattleAward.ExpedientI: return 50;
	case BattleAward.ExpedientII: return 100;
	case BattleAward.ExpedientIII: return 150;
	case BattleAward.DeathsDoor: return -100;
}

error(true, "Out of Range: ", award);
return 0;
