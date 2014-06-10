class ArbalestRocketprime extends ONSMASRocketProjectile;

#exec OBJ LOAD FILE=..\Sounds\VMVehicleSounds-S.uax

simulated event PostBeginPlay()
{
	if (Level.NetMode != NM_DedicatedServer)
	{
		SmokeTrailEffect = Spawn(class'ArbalestRocketTrailEffect',self);
		Corona = Spawn(class'RocketCorona',self);
		Corona.SetDrawScale(4.5 * Corona.default.DrawScale);
	}

	InitialDir = vector(Rotation);
	Velocity = InitialDir * Speed;

	if (PhysicsVolume.bWaterVolume)
		Velocity = 0.6 * Velocity;

	SetTimer(0.1, true);

	Super(Projectile).PostBeginPlay(); //do NOT call ONSMASRocketProjectile.PostBeginPlay !
}

defaultproperties
{
     Speed=9900.000000
     MaxSpeed=20000.000000
     Damage=80.000000
     DamageRadius=150.000000
     MomentumTransfer=50000.000000
     MyDamageType=Class'ArbalestRocket'
     AmbientSound=Sound'WeaponSounds.RocketLauncher.RocketLauncherProjectile'
     LifeSpan=2.000000
     DrawScale=0.500000
     AmbientGlow=32
     SoundRadius=100.000000
     DesiredRotation=(Roll=30000)
}
