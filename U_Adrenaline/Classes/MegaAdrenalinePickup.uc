// =============================================================================
//
// SuperAdrenaline Pickup
//
// Single pill gives 50% adrenaline.
// Copyright 2006 DGUnreal (David R. Green).
// www.lilchips.com/dgunreal/
// Revision 2006.09.16 by David R. Green
//
// Actor.Pickup.TournamentPickup.AdrenalinePickup.
//
// =============================================================================
class MegaAdrenalinePickup extends AdrenalinePickup;

#EXEC OBJ LOAD FILE=U_Adrenaline_rc.u package=U_Adrenaline

defaultproperties
{
	AdrenalineAmount=50.000000
	RespawnTime=90.000000
	PickupMessage="Mega Adrenaline "
	PickupSound=Sound'U_Adrenaline.DG-AdrenalinePickup'
	StaticMesh=StaticMesh'U_Adrenaline.DG-AdrenalinePickupMesh'
	Skins(0)=Texture'U_Adrenaline.DG-SuperAdrenalineA'
	DrawScale=0.100000
	RotationRate=(Yaw=18000)
	bEdShouldSnap=True
}
