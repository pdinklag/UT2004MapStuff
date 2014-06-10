class PortableIonCannon extends IonCannon
  placeable;

var vector MarkNormal;
var float BlastOffset, MaxBlastOffset;

auto state Ready
{
  function bool CheckMark(Pawn Aimer, Vector TestMark, bool bFire)
  {
    if (IsFiring())
      return false;

    if (bFire)
    {
      Instigator = Aimer;
      MarkLocation = TestMark;
      GotoState('FireSequence');
    }

    return true;
  }
}

state FireSequence
{
  function BeginState()
  {
    local Actor Other;
    local Vector HitLocation, HitNormal;

    BeamDirection = vector(Normalize(Instigator.Rotation));

    BlastOffset = MaxBlastOffset;

    MarkNormal = PortableIonPainter(Instigator.Weapon).MarkNormal;

    foreach TraceActors(class'Actor', Other, HitLocation, HitNormal, MarkLocation + MarkNormal*MaxBlastOffset, MarkLocation)
      if (Other.bWorldGeometry) {
        BlastOffset = FMin(VSize(MarkLocation - HitLocation)/2, MaxBlastOffset);
        break;
      }

    DamageLocation = MarkLocation + MarkNormal*BlastOffset;
  }

  function SpawnEffect()
  {
    local PortableIonEffect IonBeamEffect;
    local vector SpawnLocation;

    SpawnLocation = Instigator.Location;
    SpawnLocation.Z += Instigator.EyeHeight/2;

    IonBeamEffect = PortableIonEffect(Spawn(IonEffectClass));
    if (IonBeamEffect != None)
      IonBeamEffect.AimPortableAt(Instigator, SpawnLocation, MarkLocation, MarkNormal, BlastOffset);
  }


Begin:
    if ( Fear == None )
		Fear = Spawn(class'AvoidMarker',,,MarkLocation);
    Fear.SetCollisionSize(DamageRadius,200);

	if ( (Instigator != None) && (Instigator.PlayerReplicationInfo != None) && (Instigator.PlayerReplicationInfo.Team != None) )
		Fear.TeamNum = Instigator.PlayerReplicationInfo.Team.TeamIndex;
    Fear.StartleBots();

    SpawnEffect();
	PlayGlobalSound(FireSound);
    Sleep(0.5);

    ShakeView();
    HurtRadius(Damage, DamageRadius*0.125, DamageType, MomentumTransfer, DamageLocation);
    Sleep(0.5);
	PlayGlobalSound(sound'WeaponSounds.redeemer_explosionsound');
    HurtRadius(Damage, DamageRadius*0.300, DamageType, MomentumTransfer, DamageLocation);
    Sleep(0.2);
    HurtRadius(Damage, DamageRadius*0.475, DamageType, MomentumTransfer, DamageLocation);
    Sleep(0.2);
    HurtRadius(Damage, DamageRadius*0.650, DamageType, MomentumTransfer, DamageLocation);
    Sleep(0.2);
    HurtRadius(Damage, DamageRadius*0.825, DamageType, MomentumTransfer, DamageLocation);
    Sleep(0.2);
    HurtRadius(Damage, DamageRadius*1.000, DamageType, MomentumTransfer, DamageLocation);
    GotoState('Ready');
}

defaultproperties
{
     MaxBlastOffset=50.000000
     IonEffectClass=Class'PortableIonEffect'
}
