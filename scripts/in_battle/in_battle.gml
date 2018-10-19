/// @func in_battle()
/// Returns if we're in a battle
/// @returns bool

gml_pragma("forceinline");

return instance_exists(mBattle);
