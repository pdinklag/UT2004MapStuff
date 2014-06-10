class FlameTankCannon extends ONSHoverTankCannon;

var float ChargeLevel, ChargeTick, ChargeTime;
var bool bAllowShoot;

state ProjectileFireMode
{

 function Fire(Controller C)
 {

      if (!bAllowShoot)
         Return;
      else if (bAllowShoot)
      {
       ChargeLevel -= 0.1;
       Super.Fire(C);
      }

 }
}

simulated function Tick(float DeltaTime)
{

     if (  FlameTank(Owner).Driver != None  &&   ChargeLevel < 0.999999  )
     {
          if (bAllowShoot && ChargeLevel < 0.05)
          bAllowShoot=false;

          ChargeLevel += ChargeTick;

          if (!bAllowShoot && ChargeLevel > 0.3)
          bAllowShoot=true;
     }

     else if (ChargeLevel >= 0.999999)
          ChargeLevel = 0.99999999;



	Super.Tick(DeltaTime);

}

simulated function float ChargeBar()
{

	return FMin(0.999999, ChargeLevel);

}

simulated function ClientStartFire(Controller C, bool bAltFire)
{
    bIsAltFire = bAltFire;

	if (FireCountdown <= 0 && bAllowShoot)
	{
		if (bIsRepeatingFF)
		{
			if (bIsAltFire)
			   if (ChargeLevel >= 0.9)
				ClientPlayForceFeedback( AltFireForce );
			else
				ClientPlayForceFeedback( FireForce );
		}
		OwnerEffects();
	}
}

defaultproperties
{
     ChargeTick=0.003000
     PitchUpLimit=9000
     RotationsPerSecond=0.200000
     bShowChargingBar=True
     RedSkin=Texture'U_FlameTank.FireTankRed'
     BlueSkin=Texture'U_FlameTank.FireTankBlue'
     FireInterval=0.200000
     AltFireInterval=3.000000
     EffectEmitterClass=Class'NapalmTankFireEffect'
     FireSoundClass=Sound'ONSVehicleSounds-S.Explosions.VehicleExplosion02'
     AltFireSoundClass=Sound'WeaponSounds.BaseImpactAndExplosions.BExplosion2'
     RotateSound=Sound'U_FlameTank.BiotankTurret'
     ProjectileClass=Class'NapalmTankFire'
     AltFireProjectileClass=Class'FireballProjectile'
}
