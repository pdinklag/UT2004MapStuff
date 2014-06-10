//=============================================================================
// SkullCombo.
//=============================================================================
class SkullCombo extends ShockCombo
	placeable;

var SkullingComboFlare Flare;

simulated event PostBeginPlay()
{
    Super.PostBeginPlay();

    if (Level.NetMode != NM_DedicatedServer)
    {
        Spawn(class'SkullsComboExpRing');
        Flare = Spawn(class'SkullingComboFlare');
        //Spawn(class'ShockComboSphere');
        Spawn(class'SkullEffectComboCore');
        Spawn(class'ShockComboSphereDark');
        Spawn(class'ShockComboVortex');
        Spawn(class'SkullysComboWiggles');
        Spawn(class'SkullyComboFlash');
    }
}

defaultproperties
{
     DrawType=DT_StaticMesh
     StaticMesh=StaticMesh'U_SkullRifle.SM.CombosofSkulls'
     Rotation=(Yaw=-17408)
     DrawScale=4.000000
     AmbientGlow=255
}
