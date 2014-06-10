class FlareRaptor extends ONSAttackCraft
	placeable;

#EXEC OBJ LOAD FILE=U_FlareRaptor_rc.u package=U_FlareRaptor

defaultproperties
{
	RanOverDamageType=class'DamTypeFlareRaptorRoadkill'
	CrushedDamageType=class'DamTypeFlareRaptorPancake'

	Health=500
	HealthMax=500.000000
	
	DriverWeapons(0)=(WeaponClass=Class'FlareWeapon')
	RedSkin=Shader'U_FlareRaptor.RedSkin'
	BlueSkin=Shader'U_FlareRaptor.BlueSkin'
	CrossHairColor=(B=118,G=209,R=254)
	VehiclePositionString="in a Flare Raptor"
	VehicleNameString="Flare Raptor"
	HornSounds(0)=Sound'ONSVehicleSounds-S.CarAlarm.ahooga'
	Begin Object Class=KarmaParamsRBFull Name=KarmaParamsRBFull3
		KInertiaTensor(0)=1.000000
		KInertiaTensor(3)=3.000000
		KInertiaTensor(5)=3.500000
		KCOMOffset=(X=-0.250000)
		KLinearDamping=0.000000
		KAngularDamping=0.000000
		KStartEnabled=True
		bKNonSphericalInertia=True
		KActorGravScale=0.000000
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
	KParams=KarmaParamsRBFull'KarmaParamsRBFull3'

	bSelected=True
}
