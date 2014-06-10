class DamTypeSpammerPlasma extends VehicleDamageType
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
     VehicleClass=Class'Spammer'
     DeathString="%o got hit by %k's hot green plasma."
     FemaleSuicide="%o anihilated herself."
     MaleSuicide="%o anihilated himself."
     bDelayedDamage=True
     VehicleDamageScaling=1.500000
}
