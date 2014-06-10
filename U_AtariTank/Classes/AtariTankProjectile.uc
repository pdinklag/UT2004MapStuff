class AtariTankProjectile extends Projectile;

#exec OBJ LOAD FILE=..\Sounds\VMVehicleSounds-S.uax

var Emitter SmokeTrailEffect;
var bool bHitWater;
var Effects Corona;
var vector Dir;

simulated function Destroyed()
{
	if ( SmokeTrailEffect != None )
		SmokeTrailEffect.Kill();
	if ( Corona != None )
		Corona.Destroy();
	Super.Destroyed();
}

simulated function PostBeginPlay()
{
	if ( Level.NetMode != NM_DedicatedServer)
	{
        SmokeTrailEffect = Spawn(class'AtariTankFireTrailEffect',self);
		Corona = Spawn(class'RocketCorona',self);
	}

	Dir = vector(Rotation);
	Velocity = speed * Dir;
	if (PhysicsVolume.bWaterVolume)
	{
		bHitWater = True;
		Velocity=0.6*Velocity;
	}
    if ( Level.bDropDetail )
	{
		bDynamicLight = false;
		LightType = LT_None;
	}
	Super.PostBeginPlay();
}

simulated function Landed( vector HitNormal )
{
	Explode(Location,HitNormal);
}

simulated function ProcessTouch (Actor Other, Vector HitLocation)
{
	if ( (Other != instigator) && (!Other.IsA('Projectile') || Other.bProjTarget) )
		Explode(HitLocation,Vect(0,0,1));
}

function BlowUp(vector HitLocation)
{
	HurtRadius(Damage, DamageRadius, MyDamageType, MomentumTransfer, HitLocation );
	MakeNoise(1.0);
}

simulated function Explode(vector HitLocation, vector HitNormal)
{
	PlaySound(sound'U_AtariTank.AtariExplosion',,5.5*TransientSoundVolume);
    if ( EffectIsRelevant(Location,false) )
    {
    	Spawn(class'AtariTankHitRockEffect',,,HitLocation + HitNormal*16, rotator(HitNormal) + rot(-16384,0,0));
		if ( (ExplosionDecal != None) && (Level.NetMode != NM_DedicatedServer) )
			Spawn(ExplosionDecal,self,,Location, rotator(-HitNormal));
    }

	BlowUp(HitLocation);
	Destroy();
}

defaultproperties
{
	Speed=9000.000000
	MaxSpeed=9000.000000
	Damage=300.000000
	DamageRadius=660.000000
	MomentumTransfer=125000.000000
	MyDamageType=Class'DamTypeAtariTankShell'
	ExplosionDecal=Class'Onslaught.ONSRocketScorch'
	DrawType=DT_StaticMesh
	StaticMesh=StaticMesh'Albatross_architecture.Debris.Alb_brick1'
	AmbientSound=Sound'VMVehicleSounds-S.HoverTank.IncomingShell'
	LifeSpan=1.600000
	DrawScale3D=(Y=0.500000)
	Skins(0)=ConstantColor'AWGlobal.Shaders.ConstantColor1'
	AmbientGlow=96
	FluidSurfaceShootStrengthMod=10.000000
	bFullVolume=True
	SoundVolume=255
	SoundRadius=1000.000000
	TransientSoundVolume=1.000000
	TransientSoundRadius=1000.000000
	bFixedRotationDir=True
	ForceType=FT_Constant
	ForceRadius=100.000000
	ForceScale=5.000000
}
