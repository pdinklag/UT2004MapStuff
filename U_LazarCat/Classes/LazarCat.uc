class LazarCat extends ShockRifle;

#EXEC OBJ LOAD FILE=U_LazarCat_rc.u PACKAGE=U_LazarCat

defaultproperties
{
     FireModeClass(0)=Class'LCFire'
     FireModeClass(1)=Class'LCFire'
     SelectSound=Sound'U_LazarCat.catz.SelectSnd'
     Description="Many have searched far and wide for this... It is the key to the universe and domination. THE..LAZAR...CAT! Humans have finally found a way to recharge the Lazar Cat after use..... NOW WHO WILL DOMINATE THE BATTLE FIELD!?"
     MessageNoAmmo=" has run out of charge."
     InventoryGroup=9
     PickupClass=Class'LCPickup'
     AttachmentClass=Class'LCAttach'
     IconMaterial=FinalBlend'U_LazarCat.cat.FCat'
     IconCoords=(X1=128,Y1=64,X2=256,Y2=128)
     ItemName="LAZAR CAT"
     DrawType=DT_StaticMesh
     StaticMesh=StaticMesh'U_LazarCat.cat.1stLC'
     DrawScale=1.300000
     TransientSoundVolume=3.000000
}
