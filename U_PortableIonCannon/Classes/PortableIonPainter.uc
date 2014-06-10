class PortableIonPainter extends Painter
  config(user)
//  HideDropDown
//  CacheExempt
  ;

var vector MarkNormal;

function IonCannon CheckPortableMark(vector MarkLocation, bool bFire)
{
  local PortableIonCannon PIC;

  if ( FirstCannon != None )
    return FirstCannon;

  PIC = Spawn(class'PortableIonCannon',,,Location);
  FirstCannon = PIC;

  return PIC;
}

defaultproperties
{
	FireModeClass(0)=Class'PortableIonPainterFire'
	Description="Totally unoptimized fuck-up just to make an ion painter shoot like an ion cannon. I may release a fully revised version of this at a later point.||2006 Robin 'Jrubzjeknf' van Olst"
	PickupClass=Class'PortableIonPainterPickup'
	ItemName="Portable Ion Cannon"
}
