/// @func battle_award_get_name(award)
/// Returns name associated with a Battle Award
/// @param award BattleAward
/// @returns string

var award = argument0;

switch(award) {
	case BattleAward.VanquishFoeI: return "Vanquish Foe I";
	case BattleAward.VanquishFoeII: return "Vanquish Foe II";
	case BattleAward.VanquishFoeIII: return "Vanquish Foe III";
	case BattleAward.VanquishTrainerI: return "Vanquish Trainer I";
	case BattleAward.VanquishTrainerII: return "Vanquish Trainer II";
	case BattleAward.VanquishTrainerIII: return "Vanquish Trainer III";
	case BattleAward.ReviveI: return "Revive I";
	case BattleAward.ReviveII: return "Revive II";
	case BattleAward.ReviveIII: return "Revive III";
	case BattleAward.ExpedientI: return "Expedient I";
	case BattleAward.ExpedientII: return "Expedient II";
	case BattleAward.ExpedientIII: return "Expedient III";
	case BattleAward.DeathsDoor: return "Death's Door";
}

error(true, "Out of Range: ", award);
return 0;
