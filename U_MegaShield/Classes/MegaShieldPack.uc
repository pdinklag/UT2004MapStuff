class MegaShieldPack extends SuperShieldPack
	placeable;

#EXEC OBJ LOAD FILE=U_MegaShield_rc.u package=U_MegaShield
#exec OBJ LOAD FILE=E_Pickups.usx

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheStaticMesh(StaticMesh'E_Pickups.SuperShield');
}

defaultproperties
{
     ShieldAmount=150
     RespawnTime=90.000000
     PickupMessage="You picked up a Mega Shield Pack +"
     Skins(0)=FinalBlend'U_MegaShield.CSSFB2'
}
