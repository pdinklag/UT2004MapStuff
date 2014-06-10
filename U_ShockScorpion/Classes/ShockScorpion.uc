class ShockScorpion extends ONSRV
	placeable;

#EXEC OBJ LOAD FILE=U_ShockScorpion_rc.u package=U_ShockScorpion

defaultproperties
{
	RanOverDamageType=class'DamTypeShockScorpionRoadkill'
	CrushedDamageType=class'DamTypeShockScorpionPancake'
	DriverWeapons(0)=(WeaponClass=Class'ShockScorpionCannon')
	CrossHairColor=(B=208,G=128,R=200)
	VehiclePositionString="in a Shock Scorpion"
	VehicleNameString="Shock Scorpion"
	Begin Object Class=KarmaParamsRBFull Name=KarmaParamsRBFull6
		KInertiaTensor(0)=1.000000
		KInertiaTensor(3)=3.000000
		KInertiaTensor(5)=3.000000
		KCOMOffset=(X=-0.250000,Z=-0.400000)
		KLinearDamping=0.050000
		KAngularDamping=0.050000
		KStartEnabled=True
		bKNonSphericalInertia=True
		bHighDetailOnly=False
		bClientOnly=False
		bKDoubleTickRate=True
		bDestroyOnWorldPenetrate=True
		bDoSafetime=True
		KFriction=0.500000
		KImpactThreshold=700.000000
	End Object
	KParams=KarmaParamsRBFull'KarmaParamsRBFull6'
}
