//=============================================================================
// SkullShockProjFire.
//=============================================================================
class SkullShockProjFire extends ShockProjFire
	placeable;

function projectile SpawnProjectile(Vector Start, Rotator Dir)
{
    local Projectile p;

    p = Super.SpawnProjectile(Start,Dir);
	if ( (RifleOfSkulls(Instigator.Weapon) != None) && (p != None) )
		RifleOfSkulls(Instigator.Weapon).SetComboTarget(SkullProjectile(P));
	return p;
}

defaultproperties
{
     FireSound=Sound'U_SkullRifle.Sounds.sptatk2'
     AmmoClass=Class'Ammoofskulls'
     ProjectileClass=Class'SkullProjectile'
}
