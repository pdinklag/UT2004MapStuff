// =============================================================================
//
// PowerAdrenaline Pickup
//
// Single pill gives 25% adrenaline.
// Copyright 2006 DGUnreal (David R. Green).
// www.lilchips.com/dgunreal/
// Revision 2006.12.14 by David R. Green
//
// Actor.Pickup.TournamentPickup.AdrenalinePickup.
//
// Change Display.StaticMesh to our mesh and Pickup.PickupSound to our sound.
//
// =============================================================================
class PowerAdrenalinePickup extends AdrenalinePickup;

#EXEC OBJ LOAD FILE=U_Adrenaline_rc.u package=U_Adrenaline

defaultproperties
{
	AdrenalineAmount=25.000000
	RespawnTime=90.000000
    PickupMessage="Power Adrenaline "
	PickupSound=Sound'U_Adrenaline.DG-AdrenalinePickup'
	StaticMesh=StaticMesh'U_Adrenaline.DG-AdrenalinePickupMesh'
	Skins(0)=Texture'U_Adrenaline.DG-PowerAdrenalineA'
	DrawScale=0.100000
	RotationRate=(Yaw=18000)
	bEdShouldSnap=True
}
