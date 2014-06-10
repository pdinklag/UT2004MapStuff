class DamTypePunisherBullet extends WeaponDamageType
	abstract;

var sound FlakMonkey; //OBSOLETE

static function IncrementKills(Controller Killer)
{
	local xPlayerReplicationInfo xPRI;

	xPRI = xPlayerReplicationInfo(Killer.PlayerReplicationInfo);
	if ( xPRI != None )
	{
		xPRI.flakcount++;
		if ( (xPRI.flakcount == 15) && (UnrealPlayer(Killer) != None) )
			UnrealPlayer(Killer).ClientDelayedAnnouncementNamed('FlackMonkey',15);
	}
}

defaultproperties
{
     WeaponClass=Class'Punisher'
     DeathString="%o was blown away by %k's hail of Punisher bullets."
     FemaleSuicide="%o is a real dip shit."
     MaleSuicide="%o is a real dip shit."
     bDelayedDamage=True
     bBulletHit=True
     VehicleMomentumScaling=0.500000
}
