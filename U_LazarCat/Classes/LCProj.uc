class LCPROJ extends Projectile;
var	Emitter SmokeTrail;
var vector Dir;

simulated function PostBeginPlay()
{
	SmokeTrail = Spawn(class'lcemitter',self,,Location);
	SmokeTrail.SetBase(self);
	Dir = vector(Rotation);
	Velocity = speed * Dir;
	Super.PostBeginPlay();
}
simulated function Landed( vector HitNormal )
{
	Explode(Location,HitNormal);
}

simulated function ProcessTouch (Actor Other, Vector HitLocation)
{
	if ( (Other != instigator) && (!Other.IsA('Projectile') || Other.bProjTarget) )
		Explode(HitLocation, vector(rotation)*-1 );
}

function BlowUp(vector HitLocation)
{
	HurtRadius(Damage, DamageRadius, MyDamageType, MomentumTransfer, HitLocation );
	MakeNoise(1.0);
}

simulated function Explode(vector HitLocation, vector HitNormal)
{
	PlaySound(sound'WeaponSounds.LinkGun.Blinkedfire',,2.5*TransientSoundVolume);
    Spawn(class'onsplasmahitred',,,HitLocation);
	BlowUp(HitLocation);
	Destroy();
}
simulated function Destroyed()
{
	if ( SmokeTrail != None )
		SmokeTrail.Kill();
	Super.Destroyed();
}

defaultproperties
{
     Speed=1500.000000
     MaxSpeed=1500.000000
     Damage=35.000000
     MomentumTransfer=25000.000000
     MyDamageType=Class'DamTypeLC'
     ExplosionDecal=Class'XEffects.LinkBoltScorch'
     LightType=LT_Steady
     LightEffect=LE_QuadraticNonIncidence
     LightHue=40
     LightSaturation=100
     LightBrightness=255.000000
     LightRadius=3.000000
     DrawType=DT_StaticMesh
     StaticMesh=StaticMesh'WeaponStaticMesh.LinkProjectile'
     bDynamicLight=True
     AmbientSound=Sound'WeaponSounds.LinkGun.LinkGunProjectile'
     LifeSpan=4.000000
     PrePivot=(X=10.000000)
     Skins(0)=FinalBlend'U_LazarCat.cat.LCBFin'
     AmbientGlow=217
     Style=STY_Additive
     SoundVolume=255
     SoundRadius=50.000000
     bFixedRotationDir=True
     RotationRate=(Roll=80000)
     ForceType=FT_Constant
     ForceRadius=30.000000
     ForceScale=5.000000
}
