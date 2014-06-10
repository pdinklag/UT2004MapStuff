class PortableIonPainterFire extends PainterFire;

state Paint
{
  function BeginState()
  {
    if (Weapon.Role == ROLE_Authority)
    {
      if (Beam == None)
        Beam = Weapon.Spawn(class'PortableIonPainterBeamEffect');

      bInitialMark = true;
      bValidMark = false;
      MarkTime = Level.TimeSeconds;
      SetTimer(0.25, true);
    }

    ClientPlayForceFeedback(TAGFireForce);
  }

  function ModeTick(float dt)
  {
    local Vector StartTrace, EndTrace, X,Y,Z;
    local Vector HitLocation, HitNormal;
    local Actor Other;
    local Rotator Aim;
    local bool bEngageCannon;

    if (!bIsFiring)
      StopFiring();

    Weapon.GetViewAxes(X,Y,Z);

    // the to-hit trace always starts right in front of the eye
    StartTrace = Instigator.Location + Instigator.EyePosition() + X*Instigator.CollisionRadius;

    Aim = AdjustAim(StartTrace, AimError);
    X = Vector(Aim);
    EndTrace = StartTrace + TraceRange * X;

    Other = Weapon.Trace(HitLocation, HitNormal, EndTrace, StartTrace, false);

    if (Other != None && Other != Instigator) {
      if (bDoHit) {
        bValidMark = false;

        if (Other.bWorldGeometry) {
          if (VSize(HitLocation - MarkLocation) < 50.0) {
            Instigator.MakeNoise(3.0);

            if (Level.TimeSeconds - MarkTime > 0.3) {
              bEngageCannon = (Level.TimeSeconds - MarkTime > PaintDuration);

              PortableIonPainter(Instigator.Weapon).MarkNormal = HitNormal;

              if (IonCannon == None)
                IonCannon = PortableIonPainter(Weapon).CheckPortableMark(HitLocation, bEngageCannon);

              if (IonCannon != None && IonCannon.CheckMark(Instigator,HitLocation,bEngageCannon)) {
                if (IonCannon.IsFiring()) {
                  Instigator.PendingWeapon = None;
                  Painter(Weapon).ReallyConsumeAmmo(ThisModeNum, 1);
                  Instigator.Controller.ClientSwitchToBestWeapon();

                  if (Beam != None)
                    Beam.SetTargetState(PTS_Aquired);

                  StopForceFeedback(TAGMarkForce);
                  ClientPlayForceFeedback(TAGAquiredForce);

                  StopFiring();
                } else {
                  bValidMark = true;

                  if (!bMarkStarted) {
                    bMarkStarted = true;
                   ClientPlayForceFeedback(TAGMarkForce);
                  }
                }
              } else {
                MarkTime = Level.TimeSeconds;
                bValidMark = false;
                bMarkStarted = false;

                if ( Bot(Instigator.Controller) != None ) {
                  Instigator.Controller.Focus = Instigator.Controller.Enemy;
                  MarkLocation = Bot(Instigator.Controller).Enemy.Location - Bot(Instigator.Controller).Enemy.CollisionHeight * vect(0,0,2);
                }
              }
            }
          } else {
            bAlreadyMarked = true;
            MarkTime = Level.TimeSeconds;
            MarkLocation = HitLocation;
            bValidMark = false;
            bMarkStarted = false;
          }
        } else {
          MarkTime = Level.TimeSeconds;
          bValidMark = false;
          bMarkStarted = false;
        }

        bDoHit = false;
      }

      EndEffect = HitLocation;
    } else
      EndEffect = EndTrace;

    Painter(Weapon).EndEffect = EndEffect;

    if (Beam != None) {
      Beam.EndEffect = EndEffect;

      if (bValidMark)
        Beam.SetTargetState(PTS_Marked);
      else
        Beam.SetTargetState(PTS_Aiming);
    }

    if ( IonCannon != None )
    {
      if ( bValidMark ) {
        if ( IonCannon.Fear == None ) {
          IonCannon.Fear = Weapon.Spawn(class'AvoidMarker',,,MarkLocation);
          IonCannon.Fear.SetCollisionSize(0.4 * IonCannon.DamageRadius,100);
        if ( (Instigator != None) && (Instigator.PlayerReplicationInfo != None) && (Instigator.PlayerReplicationInfo.Team != None) )
          IonCannon.Fear.TeamNum = Instigator.PlayerReplicationInfo.Team.TeamIndex;
          IonCannon.Fear.StartleBots();
        }
      }
      else if ( IonCannon.Fear != None )
        IonCannon.RemoveFear();
    }
  }
}

defaultproperties
{
     PaintDuration=1.700000
}
