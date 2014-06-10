class PunisherAmmoPickup extends UTAmmoPickup;

defaultproperties
{
     AmmoAmount=6
     InventoryType=Class'PunisherAltAmmo'
     PickupMessage="You got a box of shells and bullets."
     PickupSound=Sound'WeaponSounds.BaseGunTech.BReload1'
     PickupForce="PunisherAmmoPickup"
     DrawType=DT_StaticMesh
     StaticMesh=StaticMesh'WeaponStaticMesh.AssaultAmmoPickup'
     TransientSoundVolume=0.400000
     CollisionHeight=12.500000
}
