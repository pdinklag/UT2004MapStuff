class PortableIonEffect extends IonEffect;

var vector SpawnLocation;
var vector EffectOffset;
var vector MarkNormal;
var float BlastOffset;

replication
{
  reliable if (Role == ROLE_Authority)
    SpawnLocation, MarkNormal, BlastOffset;
}

function AimPortableAt(Pawn p, vector sl, vector hl, vector mn, float bo)
{
  Instigator = p;

  SpawnLocation = sl;
  SetLocation(sl);

  HitLocation = hl;
  MarkNormal = mn;
  BlastOffset = bo;

  if (Level.NetMode != NM_DedicatedServer)
    SpawnEffects();
}

simulated function SpawnEffects()
{
  local Vector X,Y,Z;
  local xWeaponAttachment Attachment;

  // set beam start location
  if (Instigator != None)
  {
    if ( Instigator.IsFirstPerson() && Instigator.Weapon != None )
    {
      if ( Instigator.Weapon.WeaponCentered() )
        SpawnLocation = Instigator.Location;
      else {
        Instigator.Weapon.GetViewAxes(X, Y, Z);
        SpawnLocation = Instigator.Location + Instigator.CalcDrawOffset(Instigator.Weapon) + EffectOffset.X * X + Instigator.Weapon.Hand * EffectOffset.Y * Y + EffectOffset.Z * Z;
      }
    }
    else {
      Attachment = xPawn(Instigator).WeaponAttachment;

      if (Attachment != None)
        SpawnLocation = Attachment.GetTipLocation();
      else
        SpawnLocation = Instigator.Location + Instigator.EyeHeight*Vect(0,0,1) + Normal(HitLocation - Instigator.Location) * 25.0;
    }
  }

  SetLocation(SpawnLocation);

  IonCore = Spawn(class'IonCore',,, SpawnLocation);
  IonShaft = Spawn(class'IonShaft',,, HitLocation);
  IonShaft.mSpawnVecA = SpawnLocation;

  GotoState('Drop');
}

state Drop
{
  simulated function Timer()
  {
    local Actor A;

    IonShaft.SetLocation(IonCore.Location);
    IonCore.Destroy();
    IonShaft.mAttenuate = true;

    A = Spawn(class'NewIonEffect',,, HitLocation + MarkNormal*BlastOffset, Rot(0,16384,0));
    A.RemoteRole = ROLE_None;
    GotoState('');
  }

  simulated function Tick(float dt)
  {
    local float Delta;
    Delta = FMin((Level.TimeSeconds - StartTime) / DropTime, 1.0);
    IonCore.SetLocation(Location*(1.0-Delta) + HitLocation*delta);
    IonShaft.SetLocation(IonCore.Location);
  }
}

defaultproperties
{
     EffectOffset=(X=-5.000000,Y=15.000000,Z=-7.000000)
     bReplicateInstigator=True
     bSkipActorPropertyReplication=False
}
