//=============================================================================
// TheBoot. It's a boot.
// http://come.to/MrEvil
//=============================================================================
class TheBoot extends Actor;

#exec OBJ LOAD FILE=U_JumpBoots_rc.u PACKAGE=U_JumpBoots

//Shrink feet so they don't stick through the boots. Don't shrink to zero or the rotation changes.
simulated function BaseChange()
{
	if(Base == None)
		Destroy();
	else if(Base.IsA('xPawn'))
	{
		xPawn(Base).SetBoneScale(0, 0.1, 'lfoot');
		xPawn(Base).SetBoneScale(1, 0.1, 'rfoot');
	}
}

defaultproperties
{
     DrawType=DT_StaticMesh
     StaticMesh=StaticMesh'TheBoot'
     bOnlyDrawIfAttached=True
     bNetTemporary=True
     bSkipActorPropertyReplication=True
     DrawScale=1.250000
     bHardAttach=True
}
