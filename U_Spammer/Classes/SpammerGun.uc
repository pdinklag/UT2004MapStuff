//-----------------------------------------------------------
//
//-----------------------------------------------------------
class SpammerGun extends ONSMASSideGun;

static function StaticPrecache(LevelInfo L)
{
    L.AddPrecacheMaterial(Material'AW-2004Particles.Weapons.PlasmaStar');
    L.AddPrecacheMaterial(Material'AW-2004Particles.Weapons.PlasmaHead');
    L.AddPrecacheMaterial(Material'AW-2004Particles.Weapons.SmokePanels1');
    L.AddPrecacheMaterial(Material'AW-2004Particles.Weapons.PlasmaStar2');
    L.AddPrecacheMaterial(Material'EpicParticles.Flares.FlashFlare1');
}

simulated function UpdatePrecacheMaterials()
{
    Level.AddPrecacheMaterial(Material'AW-2004Particles.Weapons.PlasmaStar');
    Level.AddPrecacheMaterial(Material'AW-2004Particles.Weapons.PlasmaHead');
    Level.AddPrecacheMaterial(Material'AW-2004Particles.Weapons.SmokePanels1');
    Level.AddPrecacheMaterial(Material'AW-2004Particles.Weapons.PlasmaStar2');
    Level.AddPrecacheMaterial(Material'EpicParticles.Flares.FlashFlare1');

    Super.UpdatePrecacheMaterials();
}

defaultproperties
{
     DamageType=Class'DamTypeSpammerPlasma'
     DamageMin=20
     DamageMax=35
     ProjectileClass=Class'SpammerPro'
     DrawScale3D=(X=0.700000,Y=0.700000,Z=0.700000)
}
