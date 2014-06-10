class InvisibilityPickup extends TournamentPickUp;

#EXEC OBJ LOAD FILE=U_Invisibility_rc.u package=U_Invisibility

var Invisibility I;
var() float Duration;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheStaticMesh(StaticMesh'U_Invisibility.invis2M');
}


simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'U_Invisibility.invis2M');
	Super.UpdatePrecacheStaticMeshes();
}


auto state Pickup
{
	function Touch( actor Other )
	{
        local xPawn P;

		if ( ValidTouch(Other) )
		{
			P = xPawn(Other);
			if (P != None )
			{
				I = Spawn(class'Invisibility', P);

				if (I != None )
				{
					if ( Duration == 0 )
					{
						I.Duration = 9999;  // Almost Unlimited 2.7 hrs
						PickupMessage = "You got Unlimited Invisibility!";
					}
					else
					{
						I.Duration = Duration;
						PickupMessage = Default.PickupMessage;
					}
					I.StartEffect(P);
				}
				AnnouncePickup(P);
				if (PlayerController(P.Controller) != None)
				{
					PlayerController(P.Controller).PlayRewardAnnouncement('Invisible',1,true);
				}
			}
			SetRespawn();
		}
	}
}

defaultproperties
{
	Duration=30.000000
	MaxDesireability=2.000000
	bPredictRespawns=True
	RespawnTime=90.000000
	PickupMessage="You got Invisibility!"
	PickupSound=Sound'U_Invisibility.GenPickSnd'
	PickupForce="InvisibilityPickup"
	DrawType=DT_StaticMesh
	StaticMesh=StaticMesh'U_Invisibility.invis2M'
	Physics=PHYS_Rotating
	DrawScale=0.600000
	Skins(0)=Texture'U_Invisibility.jinvis'
	Skins(1)=TexScaler'U_Invisibility.jinvis'
	AmbientGlow=254
	ScaleGlow=0.600000
	Style=STY_AlphaZ
	TransientSoundRadius=600.000000
	CollisionRadius=32.000000
	CollisionHeight=23.000000
	Mass=10.000000
	RotationRate=(Yaw=24000)
}
