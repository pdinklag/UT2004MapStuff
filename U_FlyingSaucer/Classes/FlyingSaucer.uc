class FlyingSaucer extends ONSAttackCraft
	placeable;

#EXEC OBJ LOAD FILE=U_FlyingSaucer_rc.u package=U_FlyingSaucer

simulated event DrivingStatusChanged()
{
	//Fixed so no trails are tried to be created ~pd
	Super(ONSChopperCraft).DrivingStatusChanged();
	
	StreamerEffect.Length = 0;
	TrailEffects.Length = 0;
}

defaultproperties
{
	RanOverDamageType=class'DamTypeFlyingSaucerRoadkill'
	CrushedDamageType=class'DamTypeFlyingSaucerPancake'
	TrailEffectClass=None
	StreamerEffectOffset(0)=(X=0.000000,Y=0.000000,Z=0.000000)
	StreamerEffectClass=None
	MaxThrustForce=300.000000
	MaxStrafeForce=300.000000
	MaxRiseForce=200.000000
	UpDamping=0.200000
	TurnTorqueMax=300.000000
	PitchDamping=200.000000
	DriverWeapons(0)=(WeaponClass=Class'FlyingSaucerGun')
	RedSkin=Shader'U_FlyingSaucer.ShipShaderRed'
	BlueSkin=Shader'U_FlyingSaucer.ShipShaderBlue'
	IdleSound=Sound'GeneralAmbience.texture23'
	StartUpSound=Sound'U_FlyingSaucer.SOUND1'
	ShutDownSound=Sound'U_FlyingSaucer.SOUND68'
	DestroyedVehicleMesh=StaticMesh'U_FlyingSaucer.EdWoodSmashed'
	DisintegrationEffectClass=Class'XEffects.NewExplosionC'
	DamagedEffectOffset=(Z=16.000000)
	HeadlightCoronaMaterial=None
	bDrawDriverInTP=True
	DrivePos=(X=-10.000000,Z=60.000000)
	ExitPositions(0)=(Y=0.000000,Z=250.000000)
	ExitPositions(1)=(Y=0.000000,Z=250.000000)
	EntryRadius=300.000000
	FPCamPos=(Z=50.000000)
	TPCamWorldOffset=(Z=130.000000)
	VehiclePositionString="in a Flying Saucer"
	VehicleNameString="Flying Saucer"
	AirSpeed=800.000000
	AccelRate=4000.000000
	AirControl=0.300000
	Mesh=SkeletalMesh'U_FlyingSaucer.EdWood'
	bShadowCast=True
	Mass=0.000000
	Buoyancy=1.000000
	Begin Object Class=KarmaParamsRBFull Name=KarmaParamsRBFull1
		KInertiaTensor(0)=1.000000
		KInertiaTensor(3)=3.000000
		KInertiaTensor(5)=3.500000
		KCOMOffset=(X=-0.250000)
		KLinearDamping=0.000000
		KAngularDamping=0.000000
		KStartEnabled=True
		bKNonSphericalInertia=True
		KActorGravScale=0.000000
		KMaxSpeed=5000.000000
		bHighDetailOnly=False
		bClientOnly=False
		bKDoubleTickRate=True
		bKStayUpright=True
		bKAllowRotate=True
		bDestroyOnWorldPenetrate=True
		bDoSafetime=True
		KFriction=0.500000
		KImpactThreshold=300.000000
	End Object
	KParams=KarmaParamsRBFull'KarmaParamsRBFull1'

	bSelected=True
}
