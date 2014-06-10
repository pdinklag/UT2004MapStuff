class MiniScorpion extends ONSRV;

#EXEC OBJ LOAD FILE=U_MiniScorpion_rc.u package=U_MiniScorpion

defaultproperties
{
	RanOverDamageType=class'DamTypeMiniScorpionRoadkill'
	CrushedDamageType=class'DamTypeMiniScorpionPancake'

     TorqueCurve=(Points=((OutVal=11.070000),(InVal=246.000000,OutVal=12.300000),(InVal=1845.000000,OutVal=13.530000),(InVal=3444.000000)))
     DriverWeapons(0)=(WeaponClass=Class'mymg')
     RedSkin=Texture'U_MiniScorpion.ESCScorpkanred'
     BlueSkin=Texture'U_MiniScorpion.ESCScorpkanblue'
     Begin Object Class=SVehicleWheel Name=RRWheel
         bPoweredWheel=True
         bHandbrakeWheel=True
         BoneName="tire02"
         BoneRollAxis=AXIS_Y
         BoneOffset=(Y=7.000000)
         WheelRadius=24.000000
         SupportBoneName="RrearStrut"
         SupportBoneAxis=AXIS_X
     End Object
     Wheels(0)=SVehicleWheel'RRWheel'

     Begin Object Class=SVehicleWheel Name=LRWheel
         bPoweredWheel=True
         bHandbrakeWheel=True
         BoneName="tire04"
         BoneRollAxis=AXIS_Y
         BoneOffset=(Y=-7.000000)
         WheelRadius=24.000000
         SupportBoneName="LrearStrut"
         SupportBoneAxis=AXIS_X
     End Object
     Wheels(1)=SVehicleWheel'LRWheel'

     Begin Object Class=SVehicleWheel Name=RFWheel
         bPoweredWheel=True
         SteerType=VST_Steered
         BoneName="tire"
         BoneRollAxis=AXIS_Y
         BoneOffset=(Y=7.000000)
         WheelRadius=24.000000
         SupportBoneName="RFrontStrut"
         SupportBoneAxis=AXIS_X
     End Object
     Wheels(2)=SVehicleWheel'RFWheel'

     Begin Object Class=SVehicleWheel Name=LFWheel
         bPoweredWheel=True
         SteerType=VST_Steered
         BoneName="tire03"
         BoneRollAxis=AXIS_Y
         BoneOffset=(Y=-7.000000)
         WheelRadius=24.000000
         SupportBoneName="LfrontStrut"
         SupportBoneAxis=AXIS_X
     End Object
     Wheels(3)=SVehicleWheel'LFWheel'

     VehicleMass=2.695000
     bDesiredBehindView=False
     TPCamDistance=175.000000
     GroundSpeed=1156.000000
     Begin Object Class=KarmaParamsRBFull Name=KParams0
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
     KParams=KarmaParamsRBFull'KParams0'

}
