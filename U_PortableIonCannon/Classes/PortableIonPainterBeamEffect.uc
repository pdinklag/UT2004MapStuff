class PortableIonPainterBeamEffect extends PainterBeamEffect;

state Aquired
{
  simulated function BeginState()
  {
    if (AquiredSound != None)
      PlaySound(AquiredSound);
    AmbientSound = None;
    SetTimer(0.4, false);
  }
}

defaultproperties
{
     AquiredSound=None
     mLifeRange(0)=10000.000000
     mLifeRange(1)=10000.000000
}
