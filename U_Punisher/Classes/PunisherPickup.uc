//=============================================================================
//PunisherPickup.
//=============================================================================
class PunisherPickup extends UTWeaponPickup;

defaultproperties
{
     StandUp=(Z=0.000000)
     MaxDesireability=0.400000
     InventoryType=Class'Punisher'
     PickupMessage="You got the Punisher."
     PickupSound=Sound'WeaponSounds.Minigun.SwitchToMiniGun'
     PickupForce="PunisherPickup"
     DrawType=DT_StaticMesh
     StaticMesh=StaticMesh'mp5pickup'
     DrawScale=1.700000
     Skins(0)=Texture'w_mp50'
     Skins(1)=Texture'w_mp51'
     Skins(2)=Texture'w_mp52'
     Skins(3)=Texture'w_mp53'
}
