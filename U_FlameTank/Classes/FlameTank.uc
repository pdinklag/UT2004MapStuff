class FlameTank extends ONSHoverTank
	placeable;

#EXEC OBJ LOAD FILE=U_FlameTank_rc.u package=U_FlameTank

#exec OBJ LOAD FILE=..\Animations\ONSVehicles-A.ukx
#exec OBJ LOAD FILE=..\Sounds\ONSVehicleSounds-S.uax
#exec OBJ LOAD FILE=InterfaceContent.utx
#exec OBJ LOAD FILE=..\textures\VMVehicles-TX.utx

simulated function PostBeginPlay()
{
	super.PostBeginPlay();

	if ( Level.NetMode != NM_DedicatedServer )
		SetupTreads();
}

simulated function Destroyed()
{
	DestroyTreads();
	super.Destroyed();
}

function bool ImportantVehicle()
{
	return true;
}

function TakeDamage(int Damage, Pawn instigatedBy, Vector Hitlocation, Vector Momentum, class<DamageType> DamageType)
{
	if (DamageType == class'FlameKill')
		Damage *= 0.40;

	if (DamageType == class'DamTypeHoverBikePlasma')
		Damage *= 0.70;

	if (DamageType == class'DamTypeONSCicadaRocket')
		Damage *= 0.50;

	if (DamageType == class'DamTypeAttackCraftPlasma')
		Damage *= 0.50;

	if (DamageType == class'DamTypeFlakChunk')
		Damage *= 0.70;

	if (DamageType == class'DamTypeShockBeam')
		Damage *= 0.60;

        Super.TakeDamage(Damage, instigatedBy, Hitlocation, Momentum, damageType);
}

function KDriverEnter(Pawn p)
{
    Super.KDriverEnter(p);

    SVehicleUpdateParams();
}

function AltFire(optional float F)
{
    if (FlameTankCannon(Weapons[ActiveWeapon]).ChargeLevel >= 0.9 )
    super(ONSTreadCraft).AltFire();
}
function ClientVehicleCeaseFire(bool bWasAltFire)
{
	super(ONSTreadCraft).ClientVehicleCeaseFire(bWasAltFire);
}

simulated function ClientKDriverLeave(PlayerController PC)
{
	super(ONSTreadCraft).ClientKDriverLeave(PC);
}

function DriverLeft()
{
    Super.DriverLeft();

    SVehicleUpdateParams();
}

static function StaticPrecache(LevelInfo L)
{
    Super.StaticPrecache(L);

	L.AddPrecacheStaticMesh(StaticMesh'ONSDeadVehicles-SM.TANKexploded.TankTurret');
	L.AddPrecacheStaticMesh(StaticMesh'AW-2004Particles.Debris.Veh_Debris2');
	L.AddPrecacheStaticMesh(StaticMesh'AW-2004Particles.Debris.Veh_Debris1');
	L.AddPrecacheStaticMesh(StaticMesh'WeaponStaticMesh.RocketProj');

    L.AddPrecacheMaterial(Material'AW-2004Particles.Energy.SparkHead');
    L.AddPrecacheMaterial(Material'ExplosionTex.Framed.exp2_frames');
    L.AddPrecacheMaterial(Material'ExplosionTex.Framed.exp1_frames');
    L.AddPrecacheMaterial(Material'ExplosionTex.Framed.we1_frames');
    L.AddPrecacheMaterial(Material'ExplosionTex.Framed.SmokeReOrdered');
    L.AddPrecacheMaterial(Material'AW-2004Particles.Fire.MuchSmoke1');
    L.AddPrecacheMaterial(Material'AW-2004Particles.Fire.NapalmSpot');
    L.AddPrecacheMaterial(Material'EpicParticles.Fire.SprayFire1');
    L.AddPrecacheMaterial(Material'VMVehicles-TX.HoverTankGroup.tankTreads');
    L.AddPrecacheMaterial(Material'VMParticleTextures.EJECTA.Tex');
	L.AddPrecacheMaterial(Material'AW-2004Particles.Weapons.TrailBlur');
    L.AddPrecacheMaterial(Material'Engine.GRADIENT_Fade');
    L.AddPrecacheMaterial(Material'AW-2004Explosions.Fire.Fireball3');
    L.AddPrecacheMaterial(Material'AW-2004Particles.Fire.SmokeFragment');
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'ONSDeadVehicles-SM.TANKexploded.TankTurret');
	Level.AddPrecacheStaticMesh(StaticMesh'AW-2004Particles.Debris.Veh_Debris2');
	Level.AddPrecacheStaticMesh(StaticMesh'AW-2004Particles.Debris.Veh_Debris1');
	Level.AddPrecacheStaticMesh(StaticMesh'WeaponStaticMesh.RocketProj');

    Super.UpdatePrecacheStaticMeshes();
}

simulated function UpdatePrecacheMaterials()
{
    Level.AddPrecacheMaterial(Material'AW-2004Particles.Energy.SparkHead');
    Level.AddPrecacheMaterial(Material'ExplosionTex.Framed.exp2_frames');
    Level.AddPrecacheMaterial(Material'ExplosionTex.Framed.exp1_frames');
    Level.AddPrecacheMaterial(Material'ExplosionTex.Framed.we1_frames');
    Level.AddPrecacheMaterial(Material'ExplosionTex.Framed.SmokeReOrdered');
    Level.AddPrecacheMaterial(Material'AW-2004Particles.Fire.MuchSmoke1');
    Level.AddPrecacheMaterial(Material'AW-2004Particles.Fire.NapalmSpot');
    Level.AddPrecacheMaterial(Material'EpicParticles.Fire.SprayFire1');
    Level.AddPrecacheMaterial(Material'U_FlameTank.FireTankBlue');
    Level.AddPrecacheMaterial(Material'U_FlameTank.FireTankRed');
    Level.AddPrecacheMaterial(Material'VMVehicles-TX.HoverTankGroup.tankTreads');
    Level.AddPrecacheMaterial(Material'VMParticleTextures.EJECTA.Tex');
    Level.AddPrecacheMaterial(Material'AW-2004Particles.Weapons.TrailBlur');
    Level.AddPrecacheMaterial(Material'Engine.GRADIENT_Fade');
    Level.AddPrecacheMaterial(Material'AW-2004Explosions.Fire.Fireball3');
    Level.AddPrecacheMaterial(Material'AW-2004Particles.Fire.SmokeFragment');

	Super.UpdatePrecacheMaterials();
}

defaultproperties
{
	RanOverDamageType=class'DamTypeFlameTankRoadkill'
	CrushedDamageType=class'DamTypeFlameTankPancake'
	TreadVelocityScale=550.000000
	MaxGroundSpeed=750.000000
	MaxAirSpeed=10000.000000
	MaxThrust=180.000000
	MaxSteerTorque=130.000000
	DriverWeapons(0)=(WeaponClass=Class'FlameTankCannon')
	PassengerWeapons(0)=(WeaponPawnClass=Class'FlameTankTurretPawn')
	PassengerWeapons(1)=(WeaponPawnClass=Class'FlameTankSecondaryTurretPawn',WeaponBone="MachineGunTurret")
	bHasAltFire=True
	RedSkin=Texture'U_FlameTank.FireTankRed'
	BlueSkin=Texture'U_FlameTank.FireTankBlue'
	IdleSound=Sound'U_FlameTank.BioTankEngine'
	VehicleMass=15.000000
	VehiclePositionString="in a Fire Tank"
	VehicleNameString="Fire Tank"
	HornSounds(0)=Sound'U_FlameTank.BioTankHorn0'
	HornSounds(1)=Sound'U_FlameTank.BioTankHorn1'
	GroundSpeed=750.000000
	HealthMax=1200.000000
	Health=1200
	Begin Object Class=KarmaParamsRBFull Name=KarmaParamsRBFull8
		KInertiaTensor(0)=1.300000
		KInertiaTensor(3)=4.000000
		KInertiaTensor(5)=4.500000
		KLinearDamping=0.000000
		KAngularDamping=0.000000
		KStartEnabled=True
		KMaxSpeed=800.000000
		bHighDetailOnly=False
		bClientOnly=False
		bKDoubleTickRate=True
		bKStayUpright=True
		bKAllowRotate=True
		bDestroyOnWorldPenetrate=True
		bDoSafetime=True
		KFriction=0.500000
	End Object
	KParams=KarmaParamsRBFull'KarmaParamsRBFull8'

	bSelected=True
}
