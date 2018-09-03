/// @func attack_ability_create();
/// Creates a new Attack ability
/// @returns AttackAbility

#macro ABILITY_ATTACK 1

enum AttackAbility {
	Accuracy = 5,//Ability.size, // TODO Find a way to uncomment this
	DamageModifier,
	CriticalModifier,
	size
}

var value = array_create(AttackAbility.size);
	value[@ Ability.Type] = ABILITY_ATTACK;
	value[@ Ability.Name] = "undefined";
	value[@ Ability.RankMask] = 0x0F;
	value[@ Ability.TargetMask] = 0x0F;
	value[@ AttackAbility.Accuracy] = 0;
	value[@ AttackAbility.DamageModifier] = 1;
	value[@ AttackAbility.CriticalModifier] = 0;

	value[@ Ability.FN_Use] = AttackAbility_use;

return value;