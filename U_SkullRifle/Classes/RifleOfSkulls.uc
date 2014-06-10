//=============================================================================
// RifleOfSkulls.
//=============================================================================
#EXEC OBJ LOAD FILE=U_SkullRifle_rc.u PACKAGE=U_SkullRifle

class RifleOfSkulls extends ShockRifle
	placeable;

defaultproperties
{
     FireModeClass(0)=Class'SkullBeamFire'
     FireModeClass(1)=Class'SkullShockProjFire'
     SelectSound=Sound'U_SkullRifle.Sounds.sptspl'
     bCanThrow=False
     Description="Skull Rifle"
     ItemName="Skull Rifle"
     PickupClass=class'SkullsRiflePickup'
}
