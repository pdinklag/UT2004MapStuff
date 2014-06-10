//-----------------------------------------------------------
//
//-----------------------------------------------------------
class Spammer extends ONSRV;

#exec OBJ LOAD FILE=..\Animations\ONSVehicles-A.ukx
#exec OBJ LOAD FILE=..\textures\VehicleFX.utx
#exec OBJ LOAD FILE=..\textures\EpicParticles.utx
#exec OBJ LOAD FILE=..\textures\VMVehicles-TX.utx
#exec OBJ LOAD FILE=..\sounds\ONSVehicleSounds-S.uax

function ChooseFireAt(Actor A)
{
	if (Pawn(A) != None && Vehicle(A) == None && VSize(A.Location - Location) < 1500 && Controller.LineOfSightTo(A))
	{
		if (!bWeaponIsAltFiring)
			AltFire(0);
	}
	else if (bWeaponIsAltFiring)
		VehicleCeaseFire(true);

	Fire(0);
}

function AltFire(optional float F)
{
	//avoid sending altfire to weapon
	Super(Vehicle).AltFire(F);
}

function ClientVehicleCeaseFire(bool bWasAltFire)
{
	//avoid sending altfire to weapon
	if (bWasAltFire)
		Super(Vehicle).ClientVehicleCeaseFire(bWasAltFire);
	else
		Super.ClientVehicleCeaseFire(bWasAltFire);
}

function VehicleFire(bool bWasAltFire)
{
	if (bWasAltFire)
	{
        PlayAnim('RVArmExtend');
        if (!bLeftArmBroke || !bRightArmBroke)
        {
            PlaySound(ArmExtendSound, SLOT_None, 2.0,,,, False);
            bWeaponIsAltFiring = True;
            ClientPlayForceFeedback(ArmExtendForce);
        }
    }
	else
		Super.VehicleFire(bWasAltFire);
}

function VehicleCeaseFire(bool bWasAltFire)
{
	if (bWasAltFire)
    {
        PlayAnim('RVArmRetract');
        if (!bLeftArmBroke || !bRightArmBroke)
        {
            PlaySound(ArmRetractSound, SLOT_None, 2.0,,,, False);
    		bWeaponIsAltFiring = False;
    		ClientPlayForceFeedback(ArmRetractForce);
    	}
	}
	else
		Super.VehicleCeaseFire(bWasAltFire);
}

function Pawn CheckForHeadShot(Vector loc, Vector ray, float AdditionalScale)
{
    local vector X, Y, Z;

    GetAxes(Rotation,X,Y,Z);

    if (Driver != None && Driver.IsHeadShot(loc, ray, AdditionalScale))
        return Driver;

    return None;
}

simulated function Tick(float DT)
{
    local Coords ArmBaseCoords, ArmTipCoords;
    local vector HitLocation, HitNormal;
    local actor Victim;

    Super.Tick(DT);

    // Left Blade Arm System
    if (Role == ROLE_Authority && bWeaponIsAltFiring && !bLeftArmBroke)
    {
        ArmBaseCoords = GetBoneCoords('CarLShoulder');
        ArmTipCoords = GetBoneCoords('LeftBladeDummy');
        Victim = Trace(HitLocation, HitNormal, ArmTipCoords.Origin, ArmBaseCoords.Origin);

        if (Victim != None && Victim.bBlockActors)
        {
            if (Victim.IsA('Pawn') && !Victim.IsA('Vehicle'))
                Pawn(Victim).TakeDamage(1000, self, HitLocation, Velocity * 100, class'DamTypeONSRVBlade');
            else
            {
                bLeftArmBroke = True;
                bClientLeftArmBroke = True;
                BladeBreakOff(4, 'CarLSlider', class'ONSRVLeftBladeBreakOffEffect');
				// We use slot 4 here because slots 0-3 can be used by BigWheels mutator.
            }
        }
    }
    if (Role < ROLE_Authority && bClientLeftArmBroke)
    {
        bLeftArmBroke = True;
        bClientLeftArmBroke = False;
        BladeBreakOff(4, 'CarLSlider', class'ONSRVLeftBladeBreakOffEffect');
    }

    // Right Blade Arm System
    if (Role == ROLE_Authority && bWeaponIsAltFiring && !bRightArmBroke)
    {
        ArmBaseCoords = GetBoneCoords('CarRShoulder');
        ArmTipCoords = GetBoneCoords('RightBladeDummy');
        Victim = Trace(HitLocation, HitNormal, ArmTipCoords.Origin, ArmBaseCoords.Origin);

        if (Victim != None && Victim.bBlockActors)
        {
            if (Victim.IsA('Pawn') && !Victim.IsA('Vehicle'))
                Pawn(Victim).TakeDamage(1000, self, HitLocation, Velocity * 100, class'DamTypeONSRVBlade');
            else
            {
                bRightArmBroke = True;
                bClientRightArmBroke = True;
                BladeBreakOff(5, 'CarRSlider', class'ONSRVRightBladeBreakOffEffect');
            }
        }
    }
    if (Role < ROLE_Authority && bClientRightArmBroke)
    {
        bRightArmBroke = True;
        bClientRightArmBroke = False;
        BladeBreakOff(5, 'CarRSlider', class'ONSRVRightBladeBreakOffEffect');
    }
}

simulated function BladeBreakOff(int Slot, name BoneName, class<Emitter> BreakEffect)
{
    PlaySound(BladeBreakSound, SLOT_None, 2.0,,,, False);
    SetBoneScale(Slot, 0.0, BoneName);
    if (Level.NetMode != NM_DedicatedServer)
        spawn(BreakEffect);
}

static function StaticPrecache(LevelInfo L)
{
    Super.StaticPrecache(L);

	L.AddPrecacheStaticMesh(StaticMesh'ONSDeadVehicles-SM.RVexploded.RVgun');
	L.AddPrecacheStaticMesh(StaticMesh'ONSDeadVehicles-SM.RVexploded.RVrail');
	L.AddPrecacheStaticMesh(StaticMesh'ONSDeadVehicles-SM.RVexploded.Rvtire');
	L.AddPrecacheStaticMesh(StaticMesh'AW-2004Particles.Debris.Veh_Debris2');
	L.AddPrecacheStaticMesh(StaticMesh'AW-2004Particles.Debris.Veh_Debris1');

    L.AddPrecacheMaterial(Material'ExplosionTex.Framed.exp2_frames');
    L.AddPrecacheMaterial(Material'ExplosionTex.Framed.exp1_frames');
    L.AddPrecacheMaterial(Material'ExplosionTex.Framed.we1_frames');
    L.AddPrecacheMaterial(Material'ExplosionTex.Framed.SmokeReOrdered');
    L.AddPrecacheMaterial(Material'AW-2004Particles.Fire.NapalmSpot');
    L.AddPrecacheMaterial(Material'EpicParticles.Fire.SprayFire1');
    L.AddPrecacheMaterial(Material'VMVehicles-TX.RVGroup.RVcolorRED');
    L.AddPrecacheMaterial(Material'VMVehicles-TX.RVGroup.NEWrvNoCOLOR');
    L.AddPrecacheMaterial(Material'VMVehicles-TX.RVGroup.RVblades');
    L.AddPrecacheMaterial(Material'VMVehicles-TX.Environments.ReflectionTexture');
    L.AddPrecacheMaterial(Material'VMWeaponsTX.RVgunGroup.RVnewGUNtex');
    L.AddPrecacheMaterial(Material'AW-2004Particles.Weapons.MuzzleSpray');
    L.AddPrecacheMaterial(Material'VehicleFX.Particles.DustyCloud2');
    L.AddPrecacheMaterial(Material'VMParticleTextures.DirtKICKGROUP.dirtKICKTEX');
    L.AddPrecacheMaterial(Material'VMVehicles-TX.RVGroup.RVcolorBlue');
    L.AddPrecacheMaterial(Material'Engine.GRADIENT_Fade');
    L.AddPrecacheMaterial(Material'XEffectMat.Link.link_spark_green');
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'ONSDeadVehicles-SM.RVexploded.RVgun');
	Level.AddPrecacheStaticMesh(StaticMesh'ONSDeadVehicles-SM.RVexploded.RVrail');
	Level.AddPrecacheStaticMesh(StaticMesh'ONSDeadVehicles-SM.RVexploded.Rvtire');
	Level.AddPrecacheStaticMesh(StaticMesh'AW-2004Particles.Debris.Veh_Debris2');
	Level.AddPrecacheStaticMesh(StaticMesh'AW-2004Particles.Debris.Veh_Debris1');

    Super.UpdatePrecacheStaticMeshes();
}

simulated function UpdatePrecacheMaterials()
{
    Level.AddPrecacheMaterial(Material'ExplosionTex.Framed.exp2_frames');
    Level.AddPrecacheMaterial(Material'ExplosionTex.Framed.exp1_frames');
    Level.AddPrecacheMaterial(Material'ExplosionTex.Framed.we1_frames');
    Level.AddPrecacheMaterial(Material'ExplosionTex.Framed.SmokeReOrdered');
    Level.AddPrecacheMaterial(Material'AW-2004Particles.Fire.NapalmSpot');
    Level.AddPrecacheMaterial(Material'EpicParticles.Fire.SprayFire1');
    Level.AddPrecacheMaterial(Material'VMVehicles-TX.RVGroup.RVcolorRED');
    Level.AddPrecacheMaterial(Material'VMVehicles-TX.RVGroup.NEWrvNoCOLOR');
    Level.AddPrecacheMaterial(Material'VMVehicles-TX.RVGroup.RVblades');
    Level.AddPrecacheMaterial(Material'VMVehicles-TX.Environments.ReflectionTexture');
    Level.AddPrecacheMaterial(Material'VMWeaponsTX.RVgunGroup.RVnewGUNtex');
    Level.AddPrecacheMaterial(Material'AW-2004Particles.Weapons.MuzzleSpray');
    Level.AddPrecacheMaterial(Material'VehicleFX.Particles.DustyCloud2');
    Level.AddPrecacheMaterial(Material'VMParticleTextures.DirtKICKGROUP.dirtKICKTEX');
    Level.AddPrecacheMaterial(Material'VMVehicles-TX.RVGroup.RVcolorBlue');
    Level.AddPrecacheMaterial(Material'Engine.GRADIENT_Fade');
    Level.AddPrecacheMaterial(Material'XEffectMat.Link.link_spark_green');

	Super.UpdatePrecacheMaterials();
}

function ShouldTargetMissile(Projectile P)
{
	if ( (Health < 200) && (Bot(Controller) != None) 
		&& (Level.Game.GameDifficulty > 4 + 4*FRand())
		&& (VSize(P.Location - Location) < VSize(P.Velocity)) )
	{
		KDriverLeave(false);
		TeamUseTime = Level.TimeSeconds + 4;
	}
}

defaultproperties
{
     ArmExtendSound=Sound'ONSVehicleSounds-S.RV.Shing1'
     ArmRetractSound=Sound'ONSVehicleSounds-S.RV.Shing2'
     BladeBreakSound=Sound'ONSVehicleSounds-S.RV.RVBladeBreakOff'
     ArmExtendForce="RVBladeOpen"
     ArmRetractForce="RVBladeClose"
     DriverWeapons(0)=(WeaponClass=Class'SpammerGun')
     VehicleMass=3.000000
     VehiclePositionString="in a Spammer"
     VehicleNameString="Spammer"
     RanOverDamageType=Class'DamTypeSpammerRoadkill'
     CrushedDamageType=Class'DamTypeSpammerPancake'
     HealthMax=450.000000
     Health=450
}
