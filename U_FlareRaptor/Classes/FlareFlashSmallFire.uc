class FlareFlashSmallFire extends ONSBluePlasmaSmallFireEffect
	placeable;

simulated function PostNetBeginPlay()
{
	local PlayerController PC;
	
	Super.PostNetBeginPlay();
		
	PC = Level.GetLocalPlayerController();
	if ( (PC.ViewTarget == None) || (VSize(PC.ViewTarget.Location - Location) > 14000) )
		Emitters[2].Disabled = true;
}	

defaultproperties
{
	Begin Object Class=SpriteEmitter Name=SpriteEmitter5177
		UseDirectionAs=PTDU_Scale
		UseColorScale=True
		SpinParticles=True
		UniformSize=True
		ColorScale(0)=(Color=(B=119,G=204,R=255,A=128))
		ColorScale(1)=(RelativeTime=0.800000,Color=(B=113,G=202,R=255))
		ColorScale(2)=(RelativeTime=1.000000,Color=(B=121,G=205,R=255,A=128))
		CoordinateSystem=PTCS_Relative
		MaxParticles=2
		StartLocationOffset=(X=92.500000)
		StartSpinRange=(X=(Max=1.000000))
		StartSizeRange=(X=(Min=35.000000,Max=50.000000))
		InitialParticlesPerSecond=8000.000000
		Texture=Texture'AW-2004Particles.Weapons.PlasmaStar'
		LifetimeRange=(Min=0.200000,Max=0.200000)
		WarmupTicksPerSecond=2.000000
		RelativeWarmupTime=2.000000
	End Object
	Emitters(0)=SpriteEmitter'SpriteEmitter5177'

	Begin Object Class=SpriteEmitter Name=SpriteEmitter5178
		UseDirectionAs=PTDU_Right
		UseColorScale=True
		AutomaticInitialSpawning=False
		ColorScale(0)=(Color=(B=130,G=224,R=255))
		ColorScale(1)=(RelativeTime=1.000000,Color=(B=138,G=226,R=255))
		CoordinateSystem=PTCS_Relative
		MaxParticles=1
		StartLocationOffset=(X=50.000000)
		StartSizeRange=(X=(Min=-75.000000,Max=-75.000000),Y=(Min=25.000000,Max=25.000000))
		InitialParticlesPerSecond=500.000000
		Texture=Texture'AW-2004Particles.Weapons.PlasmaHeadDesat'
		LifetimeRange=(Min=0.200000,Max=0.200000)
		StartVelocityRange=(X=(Max=10.000000))
		VelocityLossRange=(X=(Min=1.000000,Max=1.000000))
		WarmupTicksPerSecond=1.000000
		RelativeWarmupTime=2.000000
	End Object
	Emitters(1)=SpriteEmitter'SpriteEmitter5178'

	Begin Object Class=SpriteEmitter Name=SpriteEmitter5179
		UseColorScale=True
		SpinParticles=True
		UseSizeScale=True
		UseRegularSizeScale=False
		UniformSize=True
		BlendBetweenSubdivisions=True
		ColorScale(1)=(RelativeTime=0.100000,Color=(B=119,G=207,R=255))
		ColorScale(2)=(RelativeTime=0.500000,Color=(B=106,G=215,R=255))
		ColorScale(3)=(RelativeTime=1.000000)
		CoordinateSystem=PTCS_Relative
		MaxParticles=20
		DetailMode=DM_High
		StartLocationOffset=(X=75.000000)
		SpinsPerSecondRange=(X=(Max=0.200000))
		StartSpinRange=(X=(Max=1.000000))
		SizeScale(0)=(RelativeSize=1.000000)
		SizeScale(1)=(RelativeTime=1.000000)
		StartSizeRange=(X=(Min=12.500000,Max=17.500000))
		Texture=Texture'AW-2004Particles.Weapons.SmokePanels1'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=0.400000,Max=0.400000)
		StartVelocityRange=(X=(Min=-500.000000,Max=-500.000000))
		WarmupTicksPerSecond=1.000000
		RelativeWarmupTime=2.000000
	End Object
	Emitters(2)=SpriteEmitter'SpriteEmitter5179'

	Begin Object Class=TrailEmitter Name=TrailEmitter2050
		TrailShadeType=PTTST_PointLife
		TrailLocation=PTTL_FollowEmitter
		MaxPointsPerTrail=100
		DistanceThreshold=40.000000
		UseCrossedSheets=True
		PointLifeTime=0.125000
		UseColorScale=True
		UseSizeScale=True
		UseRegularSizeScale=False
		AutomaticInitialSpawning=False
		ColorScale(0)=(Color=(B=109,G=237,R=248))
		ColorScale(1)=(RelativeTime=1.000000,Color=(B=62,G=227,R=236))
		Opacity=0.500000
		MaxParticles=1
		SizeScale(0)=(RelativeSize=3.000000)
		SizeScale(1)=(RelativeTime=1.000000,RelativeSize=0.500000)
		StartSizeRange=(X=(Min=6.000000,Max=6.000000))
		InitialParticlesPerSecond=2000.000000
		Texture=Texture'AW-2004Particles.Weapons.TrailBlur'
		SecondsBeforeInactive=0.000000
		LifetimeRange=(Min=500.000000,Max=500.000000)
	End Object
	Emitters(3)=TrailEmitter'TrailEmitter2050'
}
