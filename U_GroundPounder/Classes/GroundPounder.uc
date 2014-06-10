class GroundPounder extends ONSRV
    placeable;

#EXEC OBJ LOAD FILE=U_GroundPounder_rc.u package=U_GroundPounder

defaultproperties {
    DriverWeapons(0)=(WeaponClass=Class'GroundPounderCannon')
    RedSkin=Shader'U_GroundPounder.RedSkin'
    BlueSkin=Shader'U_GroundPounder.BlueSkin'
    Begin Object Class=SVehicleWheel Name=SVehicleWheel60
        bPoweredWheel=True
        bHandbrakeWheel=True
        BoneName="tire02"
        BoneRollAxis=AXIS_Y
        BoneOffset=(Y=7.000000)
        WheelRadius=24.000000
        SupportBoneName="RrearStrut"
        SupportBoneAxis=AXIS_X
    End Object
    Wheels(0)=SVehicleWheel'SVehicleWheel60'

    Begin Object Class=SVehicleWheel Name=SVehicleWheel61
        bPoweredWheel=True
        bHandbrakeWheel=True
        BoneName="tire04"
        BoneRollAxis=AXIS_Y
        BoneOffset=(Y=-7.000000)
        WheelRadius=24.000000
        SupportBoneName="LrearStrut"
        SupportBoneAxis=AXIS_X
    End Object
    Wheels(1)=SVehicleWheel'SVehicleWheel61'

    Begin Object Class=SVehicleWheel Name=SVehicleWheel62
        bPoweredWheel=True
        SteerType=VST_Steered
        BoneName="tire"
        BoneRollAxis=AXIS_Y
        BoneOffset=(Y=7.000000)
        WheelRadius=24.000000
        SupportBoneName="RFrontStrut"
        SupportBoneAxis=AXIS_X
    End Object
    Wheels(2)=SVehicleWheel'SVehicleWheel62'

    Begin Object Class=SVehicleWheel Name=SVehicleWheel63
        bPoweredWheel=True
        SteerType=VST_Steered
        BoneName="tire03"
        BoneRollAxis=AXIS_Y
        BoneOffset=(Y=-7.000000)
        WheelRadius=24.000000
        SupportBoneName="LfrontStrut"
        SupportBoneAxis=AXIS_X
    End Object
    Wheels(3)=SVehicleWheel'SVehicleWheel63'

    DriverDamageMult=0.000000
    VehiclePositionString="in a Grounder Pounder"
    VehicleNameString="Ground Pounder"
    SpawnTime=30.000000
    HeadRadius=0.000000
    HeadScale=0.000000
    DamageScaling=1.500000
    Begin Object Class=KarmaParamsRBFull Name=KarmaParamsRBFull1
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
    KParams=KarmaParamsRBFull'KarmaParamsRBFull1'

    bSelected=True
}
