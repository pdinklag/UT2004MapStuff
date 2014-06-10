class DamTypeLynxMissile extends VehicleDamageType
	abstract;

static function ScoreKill(Controller Killer, Controller Killed)
{
	if (Killed != None && Killer != Killed && Vehicle(Killed.Pawn) != None && Vehicle(Killed.Pawn).bCanFly)
	{
		//Maybe add to game stats?
		if (PlayerController(Killer) != None)
			PlayerController(Killer).ReceiveLocalizedMessage(class'ONSVehicleKillMessage', 5);
	}
}

defaultproperties
{
     VehicleClass=Class'Lynx'
     DeathString="%o couldn't avoid %k's missile."
     FemaleSuicide="%o blasted herself."
     MaleSuicide="%o blasted himself."
     bDelayedDamage=True
     VehicleDamageScaling=1.500000
}
