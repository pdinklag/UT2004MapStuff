class PunisherFire extends ProjectileFire;

function InitEffects()
{
    Super.InitEffects();
    if ( FlashEmitter != None )
		Weapon.AttachToBone(FlashEmitter, 'tip');
}

defaultproperties
{
     ProjSpawnOffset=(X=25.000000,Y=5.000000,Z=-6.000000)
     bPawnRapidFireAnim=True
     FireLoopAnim="Fire"
     FireEndAnim=
     FireSound=Sound'MGPrimary'
     FireForce="MachineGunFire"
     FireRate=0.160000
     AmmoClass=Class'PunisherAmmo'
     AmmoPerFire=1
     ShakeRotTime=2.000000
     ShakeOffsetMag=(X=-20.000000)
     ShakeOffsetRate=(X=-1000.000000)
     ShakeOffsetTime=2.000000
     ProjectileClass=Class'PunisherBullet'
     BotRefireRate=0.700000
     FlashEmitterClass=Class'PunisherMuzFlash1st'
     Spread=300.000000
     SpreadStyle=SS_Random
}
