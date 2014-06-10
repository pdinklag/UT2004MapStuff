class BlackManta extends ONSHoverBike
	placeable;
	
#EXEC OBJ LOAD FILE=U_BlackManta_rc.u package=U_BlackManta

defaultproperties
{
	RanOverDamageType=class'DamTypeBlackMantaHeadshot'
	CrushedDamageType=class'DamTypeBlackMantaPancake'
	JumpDuration=0.300000
	JumpDelay=1.500000
	DriverWeapons(0)=(WeaponClass=Class'BlackMantaPlasmaGun')
	RedSkin=Texture'U_BlackManta.Skin'
	BlueSkin=Texture'U_BlackManta.Skin'
	VehicleMass=0.750000
	VehiclePositionString="in a Tsunami"
	VehicleNameString="Tsunami"
	bCanBeBaseForPawns=False
	GroundSpeed=2500.000000
	HealthMax=150.000000
	Health=150
	Begin Object Class=KarmaParamsRBFull Name=KParams0
		KInertiaTensor(0)=1.300000
		KInertiaTensor(3)=4.000000
		KInertiaTensor(5)=4.500000
		KLinearDamping=0.150000
		KAngularDamping=0.000000
		KStartEnabled=True
		bHighDetailOnly=False
		bClientOnly=False
		bKDoubleTickRate=True
		bKStayUpright=True
		bKAllowRotate=True
		bDestroyOnWorldPenetrate=True
		bDoSafetime=True
		KFriction=0.500000
		KImpactThreshold=700.000000
	End Object
	KParams=KarmaParamsRBFull'KParams0'
}
