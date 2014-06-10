class FlareBomb extends ONSDecoy;

var Sound ExplosionSound;

simulated function ProcessTouch(Actor Other, Vector HitLocation)
{
	if ( Other != Instigator )
	{
		Explode(HitLocation,Normal(HitLocation-Other.Location));
	}
}

simulated function Landed( vector HitNormal )
{
	Super(Projectile).Landed(HitNormal);
	Explode(Location,HitNormal);
}

simulated function HitWall (vector HitNormal, actor Wall)
{
	Landed(HitNormal);
}

function BlowUp(vector HitLocation)
{
	HurtRadius(Damage, DamageRadius, MyDamageType, MomentumTransfer, HitLocation );
	MakeNoise(1.0);
}

simulated function Explode(vector HitLocation, vector HitNormal)
{
	PlaySound(ExplosionSound,,5.5*TransientSoundVolume);
    if ( EffectIsRelevant(Location,false) )
    {
    	Spawn(class'FlareBombExplosion',,,HitLocation + HitNormal*16, rotator(HitNormal) + rot(-16384,0,0));
		if ( (ExplosionDecal != None) && (Level.NetMode != NM_DedicatedServer) )
			Spawn(ExplosionDecal,self,,Location, rotator(-HitNormal));
    }

	BlowUp(HitLocation);
	Destroy();
}

defaultproperties
{
	ExplosionSound=Sound'U_FlareRaptor.FlareBombExplosion'
	DecoyFlightSFXClass=Class'FlareDecoyFlight'
	MaxSpeed=1600.000000
	Damage=350.000000
	DamageRadius=650.000000
	MomentumTransfer=125000.000000
	MyDamageType=Class'DamTypeFlareBomb'
	LifeSpan=15.000000
	bFullVolume=True
	SoundVolume=255
	SoundRadius=500.000000
	TransientSoundVolume=1.400000
	TransientSoundRadius=800.000000
	bSelected=True
}
