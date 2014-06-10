class FlyingSaucerGun extends ONSAttackCraftGun
	placeable;

defaultproperties
{
	WeaponFireAttachmentBone="PlasmaGunAttachment"
	DualFireOffset=44.000000
	FireSoundClass=Sound'U_FlyingSaucer.SOUND999'
	FireSoundVolume=130.000000
	AltFireSoundClass=Sound'U_FlyingSaucer.SOUND57'
	AltFireSoundVolume=300.000000
	AltFireSoundRadius=600.000000
	AmbientSoundScaling=3.000000
	DamageType=Class'DamTypeFlyingSaucerPlasma'
	ProjectileClass=Class'OnslaughtFull.ONSMASPlasmaProjectile'
	AltFireProjectileClass=Class'FlyingSaucerPlasmaBurst'
	bSelected=True
}
