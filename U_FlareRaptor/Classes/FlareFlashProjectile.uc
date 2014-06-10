class FlareFlashProjectile extends ONSAttackCraftPlasmaProjectileBlue;

var() class<Emitter> 	PlasmaFireSFXClass;

simulated function PostNetBeginPlay()
{
	super.PostNetBeginPlay();

	if ( EffectIsRelevant(Location, false) )
		Spawn(PlasmaFireSFXClass,,,location,Rotation);
}

simulated function Explode(vector HitLocation, vector HitNormal)
{
    if ( Role == ROLE_Authority )
        HurtRadius(Damage, DamageRadius, MyDamageType, MomentumTransfer, HitLocation );

    if ( EffectIsRelevant(Location,false) )
        Spawn(HitEffectClass,,, HitLocation + HitNormal*5, rotator(-HitNormal));

    PlaySound(Sound'WeaponSounds.BioRifle.BioRifleGoo1');

    Destroy();
}

defaultproperties
{
	HitEffectClass=Class'FlareFlashHit'
	PlasmaEffectClass=Class'FlareFlashSmallFire'
	AccelerationMagnitude=30000.000000
	Speed=1250.000000
	MaxSpeed=15000.000000
	Damage=40.000000
	DamageRadius=260.000000
	MomentumTransfer=12000.000000
	MyDamageType=Class'DamTypeFlash'
	TransientSoundVolume=0.800000
}
