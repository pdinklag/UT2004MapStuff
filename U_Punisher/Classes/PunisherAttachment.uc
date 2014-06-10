class PunisherAttachment extends xWeaponAttachment;

var byte OldSpawnHitCount;
var class<xEmitter>     mMuzFlashClass;
var xEmitter            mMuzFlash3rd;
var xEmitter            mMuzFlash3rdAlt;
var bool bDualGun;
var PunisherAttachment TwinGun;
var float AimAlpha;

replication
{
	reliable if ( Role == ROLE_Authority )
		bDualGun, TwinGun;
}

simulated function Hide(bool NewbHidden)
{
	bHidden = NewbHidden;
	if ( TwinGun != None )
		TwinGun.bHidden = bHidden;
}

simulated function Destroyed()
{
	if ( bDualGun )
	{
		if ( Instigator != None )
		{
			Instigator.SetBoneDirection(AttachmentBone, Rotation,, 0, 0);
			Instigator.SetBoneDirection('lfarm', Rotation,, 0, 0);
		}
	}
    if (mMuzFlash3rd != None)
        mMuzFlash3rd.Destroy();
    if (mMuzFlash3rdAlt != None)
        mMuzFlash3rdAlt.Destroy();
    Super.Destroyed();
}

simulated function SetOverlayMaterial( Material mat, float time, bool bOverride )
{
	Super.SetOverlayMaterial(mat, time, bOverride);
	if ( !bDualGun && (TwinGun != None) )
		TwinGun.SetOverlayMaterial(mat, time, bOverride);
}

simulated function Tick(float deltatime)
{
	local rotator newRot;

	if ( !bDualGun || (Level.NetMode == NM_DedicatedServer) )
	{
		Disable('Tick');
		return;
	}

	AimAlpha = AimAlpha * ( 1 - 2*DeltaTime);

	// point in firing direction
	if ( Instigator != None )
	{
		newRot = Instigator.Rotation;
		if ( AimAlpha < 0.5 )
			newRot.Yaw += 4500 * (1 - 2*AimAlpha);
		Instigator.SetBoneDirection('lfarm', newRot,, 1.0, 1);

		newRot.Roll += 32768;
		Instigator.SetBoneDirection(AttachmentBone, newRot,, 1.0, 1);
	}
}

/* UpdateHit
- used to update properties so hit effect can be spawn client side
*/
function UpdateHit(Actor HitActor, vector HitLocation, vector HitNormal)
{
	SpawnHitCount++;
	mHitLocation = HitLocation;
	mHitActor = HitActor;
	mHitNormal = HitNormal;
}

simulated function MakeMuzzleFlash()
{
    local rotator r;

	AimAlpha = 1;
	if ( TwinGun != None )
		TwinGun.AimAlpha = 1;
	if (mMuzFlash3rd == None)
    {
        mMuzFlash3rd = Spawn(mMuzFlashClass);
        AttachToBone(mMuzFlash3rd, 'tip');
    }
    mMuzFlash3rd.mStartParticles++;
    r.Roll = Rand(65536);
    SetBoneRotation('Bone_Flash', r, 0, 1.f);
}

simulated event ThirdPersonEffects()
{
	local rotator r;
	local PlayerController PC;

    if ( Level.NetMode != NM_DedicatedServer )
	{
		AimAlpha = 1;
		if ( TwinGun != None )
			TwinGun.AimAlpha = 1;
        if (FiringMode == 0)
        {
			WeaponLight();
			if ( OldSpawnHitCount != SpawnHitCount )
			{
				OldSpawnHitCount = SpawnHitCount;
				GetHitInfo();
				PC = Level.GetLocalPlayerController();
				if ( ((Instigator != None) && (Instigator.Controller == PC)) || (VSize(PC.ViewTarget.Location - mHitLocation) < 4000) )
				{
					Spawn(class'HitEffect'.static.GetHitEffect(mHitActor, mHitLocation, mHitNormal),,, mHitLocation, Rotator(mHitNormal));
					CheckForSplash();
				}
			}
			MakeMuzzleFlash();
            if ( !bDualGun && (TwinGun != None) )
				TwinGun.MakeMuzzleFlash();
        }
        else if (FiringMode == 1 && FlashCount > 0)
        {
			WeaponLight();
            if (mMuzFlash3rdAlt == None)
            {
                mMuzFlash3rdAlt = Spawn(mMuzFlashClass);
                AttachToBone(mMuzFlash3rdAlt, 'tip2');
            }
            mMuzFlash3rdAlt.mStartParticles++;
            r.Roll = Rand(65536);
            SetBoneRotation('Bone_Flash02', r, 0, 1.f);
        }
    }

    Super.ThirdPersonEffects();
}

defaultproperties
{
     mMuzFlashClass=Class'PunisherMuzFlash3rd'
     bRapidFire=True
     SplashEffect=Class'XGame.BulletSplash'
     LightType=LT_Pulse
     LightEffect=LE_NonIncidence
     LightHue=30
     LightSaturation=150
     LightBrightness=255.000000
     LightRadius=4.000000
     LightPeriod=3
     Mesh=SkeletalMesh'mp5_3rd'
     Rotation=(Pitch=18000,Yaw=4000,Roll=400)
     RelativeLocation=(X=23.000000,Y=3.000000,Z=-9.000000)
     DrawScale=1.300000
     Skins(0)=Texture'w_mp50'
     Skins(1)=Texture'w_mp51'
     Skins(2)=Texture'w_mp52'
     Skins(3)=Texture'w_mp53'
}
