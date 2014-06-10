//=============================================================================
// These boots are made for jumping
// And that's just what they'll do.
// http://come.to/MrEvil
//=============================================================================
class BootsOfJumpingPickup extends TournamentPickUp
	placeable;

#exec OBJ LOAD FILE=U_JumpBoots_rc.u PACKAGE=U_JumpBoots

var() float JumpHeight;
var() float FallHeight;
var() int JumpBootCharge;
var() bool bEverlasting;
var() bool bJumpyBots;

function inventory SpawnCopy(Pawn Other)
{
	local BootsOfJumping Copy;

	Copy = BootsOfJumping(Super.SpawnCopy(Other));

	if(Copy != None)
	{
		Copy.JumpHeight = JumpHeight;
		Copy.FallHeight = FallHeight;
		Copy.Charge = JumpBootCharge;
		Copy.bEverlasting = bEverlasting;
		Copy.bJumpyBots = bJumpyBots;
	}

	return Copy;
}

defaultproperties
{
     JumpHeight=1024.000000
     FallHeight=2048.000000
     JumpBootCharge=3
     InventoryType=Class'BootsOfJumping'
     RespawnTime=30.000000
     PickupMessage="You got the jump boots."
     PickupSound=Sound'BootSnd'
     DrawType=DT_StaticMesh
     StaticMesh=StaticMesh'sg_UT2003_pickups.jumpboots.UT2_jumpboots'
}
