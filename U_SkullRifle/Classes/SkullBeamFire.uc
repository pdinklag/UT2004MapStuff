//=============================================================================
// SkullBeamFire.
//=============================================================================
class SkullBeamFire extends ShockBeamFire
	placeable;


function DoFireEffect()
{
    local Vector StartTrace,X,Y,Z;
    local Rotator R, Aim;

    Instigator.MakeNoise(1.0);

    StartTrace = Instigator.Location + Instigator.EyePosition();
    if ( PlayerController(Instigator.Controller) != None )
    {
		// for combos
	   Weapon.GetViewAxes(X,Y,Z);
		StartTrace = StartTrace + X*class'SkullShockProjFire'.Default.ProjSpawnOffset.X;
		if ( !Weapon.WeaponCentered() )
			StartTrace = StartTrace + Weapon.Hand * Y*class'SkullShockProjFire'.Default.ProjSpawnOffset.Y + Z*class'SkullShockProjFire'.Default.ProjSpawnOffset.Z;
	}

    Aim = AdjustAim(StartTrace, AimError);
	R = rotator(vector(Aim) + VRand()*FRand()*Spread);
    DoTrace(StartTrace, R);
}

function InitEffects()
{
	if ( Level.DetailMode == DM_Low )
		FlashEmitterClass = None;
    Super.InitEffects();
    if ( FlashEmitter != None )
		Weapon.AttachToBone(FlashEmitter, 'tip');
}

// for bot combos
function Rotator AdjustAim(Vector Start, float InAimError)
{
	if ( (RifleOfSkulls(Weapon) != None) && (RifleOfSkulls(Weapon).ComboTarget != None) )
		return Rotator(RifleOfSkulls(Weapon).ComboTarget.Location - Start);

	return Super.AdjustAim(Start, InAimError);
}




function SpawnBeamEffect(Vector Start, Rotator Dir, Vector HitLocation, Vector HitNormal, int ReflectNum)
{
    local ShockBeamEffect Beam;
    
    if ( (Instigator.PlayerReplicationInfo.Team != None) && (Instigator.PlayerReplicationInfo.Team.TeamIndex == 1) )
		Beam = Weapon.Spawn(class'BlueSuperShockBeam',,, Start, Dir);
	else
		Beam = Weapon.Spawn(BeamEffectClass,,, Start, Dir);
    if (ReflectNum != 0) Beam.Instigator = None; // prevents client side repositioning of beam start
    Beam.AimAt(HitLocation, HitNormal);
}

defaultproperties
{
     BeamEffectClass=Class'XWeapons.SuperShockBeamEffect'
     FireSound=Sound'U_SkullRifle.Sounds.sptatk'
     AmmoClass=Class'Ammoofskulls'
     DamageType=class'DamTypeSkullBeam'
}
