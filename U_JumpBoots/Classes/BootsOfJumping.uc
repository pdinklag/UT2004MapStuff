//=============================================================================
// You say Jump Boots, I say how high?
// http://come.to/MrEvil
//=============================================================================
class BootsOfJumping extends Powerups;

var() sound JumpSound;
var Emitter LeftExhaust, RightExhaust;
var TheBoot LeftBoot, RightBoot;
var float LastJumpTime;
var float JumpHeight;
var float FallHeight;
var bool bEverlasting;
var bool bJumpyBots;

function bool HandlePickupQuery(Pickup Item)
{
	if(Item.InventoryType == class)
	{
		Destroy();
		return false;
	}

	if(Inventory == None)
		return false;

	return Inventory.HandlePickupQuery(Item);
}

//Check if pawn is a player or not, and go to appropriate state.
function Activate()
{
	//Speed combo wears out the soles, so turn it off and make sure it can't be turned back on again.
	if(xPawn(Instigator).CurrentCombo != None && xPawn(Instigator).CurrentCombo.IsA('ComboSpeed'))
	{
		xPawn(Instigator).CurrentCombo.AdrenalineEmpty();
		Instigator.ClientMessage('You cannot use speed in these boots', 'PickupMessagePlus');
	}

	if(Instigator.Controller.IsA('PlayerController'))
	{
		xPlayer(Instigator.Controller).ComboList[0] = class'xGame.ComboDefensive';
		GoToState('Activated');
	}
	else
	{
		if(bJumpyBots)
			Bot(Instigator.Controller).Jumpiness = 1.0;

		Bot(Instigator.Controller).ComboNames[0] = "xGame.ComboDefensive";
		GoToState('BotActivated');
	}
}

//Normal activated state for player-controlled pawns.
state Activated
{
	function BeginState()
	{
		bActive = true;

		//Put on the boots!
		LeftBoot = Spawn(class'TheBoot', Instigator,, Instigator.Location, Instigator.Rotation);
		Instigator.AttachToBone(LeftBoot, 'lfoot');

		RightBoot = Spawn(class'TheBoot', Instigator,, Instigator.Location, Instigator.Rotation);
		Instigator.AttachToBone(RightBoot, 'rfoot');

		//Big boots make loud footsteps.
		xPawn(Instigator).FootstepVolume *= 1.5;

		//Big boots are good for stomping.
		Instigator.Mass *= 2;

		//Ask to be notified on jumping.
		Instigator.bCountJumps = True;

		//Set increased jump abilities.
		xPawn(Instigator).MultiJumpBoost -= JumpHeight - Pawn(Owner).Default.JumpZ;
		Instigator.JumpZ = JumpHeight;
		Instigator.MaxFallSpeed = FallHeight;
	}

	//Called whenever the pawn jumps
	function OwnerEvent(name EventName)
	{
		//If the function was called for any reason other than jumping, then ignore.
		//Also ignore if player is walking, to allow normal jumps with boots on.
		if(EventName != 'Jumped' || Instigator.bIsWalking)
			return;

		if(Charge > 0 || bEverlasting)
		{
			if(!bEverlasting)
				Charge--;

			Instigator.PlaySound(JumpSound, SLOT_Misc);
			Instigator.MakeNoise(0.5);

			//A puff of smoke.
			LeftExhaust = Spawn(class'Exhaust', Instigator,, Instigator.Location, Instigator.Rotation);
			Instigator.AttachToBone(LeftExhaust, 'lfoot');
    			RightExhaust = Spawn(class'Exhaust', Instigator,, Instigator.Location, Instigator.Rotation);
    			Instigator.AttachToBone(RightExhaust, 'rfoot');
		}
		else
		{
			Instigator.ClientMessage(ExpireMessage, 'PickupMessagePlus');
			xPlayer(Instigator.Controller).ComboList[0] = class<Combo>(DynamicLoadObject("xGame.ComboSpeed",class'Class'));
			Destroy();
		}

		if(Charge == 0)
			Instigator.MaxFallSpeed = Instigator.Default.MaxFallSpeed;
	}

	function EndState()
	{
		Instigator.bCountJumps = False;

		//Reset original jump abilities.
		xPawn(Instigator).MultiJumpBoost = xPawn(Instigator).Default.MultiJumpBoost;
		Instigator.MaxFallSpeed = Instigator.Default.MaxFallSpeed;
		Instigator.JumpZ = Instigator.Default.JumpZ;

		//Take off the boots.
		if(LeftBoot != None)
        		LeftBoot.Destroy();

		Instigator.SetBoneScale(0);

		if(RightBoot != None)
        		RightBoot.Destroy();

		Instigator.SetBoneScale(1);

		xPawn(Instigator).FootstepVolume = xPawn(Instigator).Default.FootstepVolume;

		Instigator.Mass = Instigator.Default.Mass;

		bActive = false;
	}

	function Activate()
	{
		if(Instigator != None && Instigator.bAutoActivate && bAutoActivate && Charge > 0)
			return;

		Global.Activate();
	}
}

//Special state for bots only, to enable detection of their cheating method of jumping.
state BotActivated extends Activated
{
	simulated function Tick(float DeltaTime)
	{
		LastJumpTime += DeltaTime;

		//If bot is travelling upwards fast then it's probably jumping, so call jump handling function.
		if(Instigator.Physics == PHYS_Falling && Instigator.Velocity.Z > 700)
		{
			//If bot is near a jump pad, then it probably didn't jump after all.
			if(Instigator.LastAnchor.IsA('JumpPad'))
				return;

			//Don't allow jump detection too close together, or boots may run out on a single jump.
			if(LastJumpTime < 1)
				return;

			LastJumpTime = 0;

			OwnerEvent('Jumped');
		}
	}

	//Destroy bot's boots immediately, otherwise they get an extra jump.
	function OwnerEvent(name EventName)
	{
		Super.OwnerEvent(EventName);

		if(Charge == 0)
		{
			Bot(Instigator.Controller).Jumpiness = float(xBot(Instigator.Controller).PawnSetupRecord.Jumpiness);

			Bot(Instigator.Controller).ComboNames[0]="xGame.ComboSpeed";
			Destroy();
		}
	}
}

defaultproperties
{
     JumpSound=Sound'wm_sounds.wm_BootJmp'
     JumpHeight=1024.000000
     FallHeight=2048.000000
     bAutoActivate=True
     bActivatable=True
     ExpireMessage="The jump boots have run out."
     Charge=3
     ItemName="Jump Boots"
}
