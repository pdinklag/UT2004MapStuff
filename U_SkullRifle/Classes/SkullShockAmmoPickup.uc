//=============================================================================
// SkullShockAmmoPickup.
//=============================================================================
class SkullShockAmmoPickup extends ShockAmmoPickup
	placeable;

defaultproperties
{
     InventoryType=Class'Ammoofskulls'
     PickupMessage="You picked up some skulls."
     PickupSound=Sound'U_SkullRifle.Sounds.sptdam'
     StaticMesh=StaticMesh'U_SkullRifle.SM.HumanSkull'
     DrawScale3D=(X=1.000000,Z=1.000000)
     CollisionHeight=45.000000
}
