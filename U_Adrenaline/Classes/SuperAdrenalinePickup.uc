class SuperAdrenalinePickup extends AdrenalinePickup;

#EXEC OBJ LOAD FILE=U_Adrenaline_rc.u package=U_Adrenaline

defaultproperties
{
	AdrenalineAmount=100.000000
	RespawnTime=90.000000
	PickupMessage="Super Adrenaline "
	PickupSound=Sound'U_Adrenaline.DG-AdrenalinePickup'
	StaticMesh=StaticMesh'U_Adrenaline.DG-AdrenalinePickupMesh'
	Skins(0)=Texture'U_Adrenaline.megaadrenalin'
	Skins(1)=TexPanner'U_Adrenaline.megadreninner'
	DrawScale=0.100000
	Mass=20.000000
	RotationRate=(Yaw=12000)
}
