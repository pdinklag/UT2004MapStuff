class FlareRaptorMuzzleFlash extends NewMinigunMFlash
	placeable;

defaultproperties
{
	Begin Object Class=SpriteEmitter Name=SpriteEmitter5176
		UseDirectionAs=PTDU_Normal
		ProjectionNormal=(X=1.000000,Z=0.000000)
		UseColorScale=True
		RespawnDeadParticles=False
		SpinParticles=True
		UseSizeScale=True
		UseRegularSizeScale=False
		UniformSize=True
		AutomaticInitialSpawning=False
		ColorScale(1)=(RelativeTime=0.200000,Color=(B=113,G=255,R=244))
		ColorScale(2)=(RelativeTime=0.600000,Color=(B=130,G=196,R=255))
		ColorScale(3)=(RelativeTime=1.000000)
		CoordinateSystem=PTCS_Relative
		MaxParticles=2
		StartSpinRange=(X=(Max=1.000000))
		SizeScale(0)=(RelativeSize=0.250000)
		SizeScale(1)=(RelativeTime=1.000000,RelativeSize=1.000000)
		StartSizeRange=(X=(Min=60.000000,Max=60.000000))
		InitialParticlesPerSecond=500.000000
		Texture=Texture'AW-2004Particles.Weapons.PlasmaFlare'
		LifetimeRange=(Min=0.250000,Max=0.250000)
	End Object
	Emitters(0)=SpriteEmitter'SpriteEmitter5176'

	AutoDestroy=True
}
