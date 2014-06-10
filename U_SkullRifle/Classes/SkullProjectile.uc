//=============================================================================
// SkullProjectile.
//=============================================================================
class SkullProjectile extends ShockProjectile
	placeable;
var SkullsBallseffects ShockBallEffect;

simulated function PostBeginPlay()
{
	Super.PostBeginPlay();

    if ( Level.NetMode != NM_DedicatedServer )
	{
        ShockBallEffect = Spawn(class'SkullsBallseffects', self);
        ShockBallEffect.SetBase(self);
	}

	Velocity = Speed * Vector(Rotation); // starts off slower so combo can be done closer

    SetTimer(0.4, false);
    tempStartLoc = Location;
}
simulated function Destroyed()
{
    if (ShockBallEffect != None)
    {
		if ( bNoFX )
			ShockBallEffect.Destroy();
		else
			ShockBallEffect.Kill();
	}
	
	Super.Destroyed();
}

simulated function DestroyTrails()
{
    if (ShockBallEffect != None)
        ShockBallEffect.Destroy();
}


function SuperExplosion()
{
	local actor HitActor;
	local vector HitLocation, HitNormal;

	HurtRadius(ComboDamage, ComboRadius, class'DamTypeSkullCombo', ComboMomentumTransfer, Location );

	Spawn(class'SkullCombo');
	if ( (Level.NetMode != NM_DedicatedServer) && EffectIsRelevant(Location,false) )
	{
		HitActor = Trace(HitLocation, HitNormal,Location - Vect(0,0,120), Location,false);
		if ( HitActor != None )
			Spawn(class'ComboDecal',self,,HitLocation, rotator(vect(0,0,-1)));
	}
	PlaySound(ComboSound, SLOT_None,1.0,,800);
    DestroyTrails();
    Destroy();
}

defaultproperties
{
     ComboSound=Sound'U_SkullRifle.Sounds.sptdth'
     ImpactSound=Sound'PlayerSounds.NewGibs.NewGib3'
     DrawType=DT_StaticMesh
     StaticMesh=StaticMesh'U_SkullRifle.SM.CombosofSkulls'
     Texture=None
     DrawScale=1.500000
     ComboDamageType=class'DamTypeSkullBeam'
     MyDamageType=class'DamTypeSkull'
}
