class FlareWeapon extends ONSAttackCraftGun;

defaultproperties
{
	TeamProjectileClasses(0)=Class'FlareFlashProjectile'
	TeamProjectileClasses(1)=Class'FlareFlashProjectile'
	FireInterval=0.225000
	AltFireInterval=4.000000
	EffectEmitterClass=Class'FlareRaptorMuzzleFlash'
	FireSoundClass=Sound'U_FlareRaptor.Laser12A'
	FireSoundVolume=450.000000
	AltFireSoundClass=Sound'CicadaSnds.Decoy.DecoyLaunch'
	ProjectileClass=Class'FlareFlashProjectile'
	AltFireProjectileClass=Class'FlareBomb'
	bSelected=True
}
