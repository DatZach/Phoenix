/// @func attack_ability_create();
/// Creates a new Attack ability
/// @returns AttackAbility

#macro ABILITY_ATTACK 1

enum AttackAbility {
	Accuracy = Ability.size,
	DamageModifier,
	CriticalModifier,
	size
}

var value = array_create(AttackAbility.size);
value[@ Ability.Type] = ABILITY_ATTACK;
value[@ Ability.Name] = "undefined";
value[@ Ability.FnUse] = AttackAbility_use;
value[@ Ability.RankMask] = 0x0F;
value[@ Ability.TargetMask] = 0x0F;
value[@ AttackAbility.Accuracy] = 0;
value[@ AttackAbility.DamageModifier] = 1;
value[@ AttackAbility.CriticalModifier] = 0;

return value;