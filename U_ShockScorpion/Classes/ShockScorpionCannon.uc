class ShockScorpionCannon extends ONSWeapon;

defaultproperties
{
	YawBone="rvGUNTurret"
	PitchBone="rvGUNbody"
	WeaponFireAttachmentBone="RVfirePoint"
	CullDistance=7500.000000
	FireSoundVolume=360.000000
	Mesh=SkeletalMesh'ONSWeapons-A.RVnewGun'
	bSelected=True
	PitchUpLimit=7500
	RedSkin=Texture'U_ShockScorpion.GunSkin'
	BlueSkin=Texture'U_ShockScorpion.GunSkin'
	FireInterval=2.000000
	EffectEmitterClass=Class'OnslaughtBP.ONSShockTankMuzzleFlash'
	FireSoundClass=Sound'ONSBPSounds.ShockTank.ShockBallFire'
	DamageType=Class'DamTypeShockScorpionShockBall'
	ProjectileClass=Class'OnslaughtBP.ONSShockTankProjectile'
	DrawScale=1.200000
}
