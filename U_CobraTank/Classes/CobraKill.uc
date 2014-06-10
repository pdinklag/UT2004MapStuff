class CobraKill extends VehicleDamageType
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
     VehicleClass=Class'CobraTank'
     DeathString="%o was slaughtered by %k's cobra."
     FemaleSuicide="%o blew herself up."
     MaleSuicide="%o blew himself up."
     bDelayedDamage=True
     VehicleDamageScaling=1.500000
}
