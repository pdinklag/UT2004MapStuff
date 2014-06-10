class Invisibility extends Info;

#exec OBJ LOAD FILE=GameSounds.uax

var localized string ExecMessage;
var float ElapsedTime;
var() float Duration;
var Sound ActivateSound;
var Material Icon;
var Class<xEmitter> ActivationEffectClass;

function PostBeginPlay ()
{
  local xPawn xp;

  xp = xPawn(Owner);
  if ( xp == None )
  {
    Destroy();
    return;
  }
  if ( ActivateSound != None )
  {
    PlaySound(ActivateSound,,2.0 * TransientSoundVolume);
  }
  if ( ActivationEffectClass != None )
  {
    Spawn(ActivationEffectClass,xp,,xp.Location,xp.Rotation);
  }
  StartEffect(xp);

  SetTimer(1.0,true);
}

function Destroyed ()
{
  local xPawn xp;

  xp = xPawn(Owner);
  if ( xp != None )
  {
    StopEffect(xp);
  }
}

function StartEffect (xPawn xp)
{
	xp.SetInvisibility(Duration);
}

function StopEffect (xPawn xp)
{
	xp.SetInvisibility(0.0);
}

simulated function Tick (float DeltaTime)
{
	local Pawn xp;

	xp = Pawn(Owner);
	if ( (xp == None) )
	{
		Destroy();
		return;
	}

	ElapsedTime += DeltaTime;
	if ( ElapsedTime >= Duration )
	{
		Destroy();
		return;
	}
}

defaultproperties
{
	ExecMessage="You got Invisibility!"
	Duration=30.000000
	ActivateSound=Sound'GameSounds.Combo.ComboActivated'
	ActivationEffectClass=Class'XEffects.ComboActivation'
}
