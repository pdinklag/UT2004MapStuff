class FlareFlashHit extends ONSPlasmaHitBlue
	placeable;

simulated function PostNetBeginPlay()
{	
	Super.PostNetBeginPlay();

	Emitters[2].Disabled = false;
}	

defaultproperties
{
	Begin Object Class=SpriteEmitter Name=SpriteEmitter11326
		UseDirectionAs=PTDU_Normal
		ProjectionNormal=(X=1.000000,Z=0.000000)
		UseColorScale=True
		RespawnDeadParticles=False
		SpinParticles=True
		UseSizeScale=True
		UseRegularSizeScale=False
		UniformSize=True
		AutomaticInitialSpawning=False
		ColorScale(0)=(Color=(B=120,G=200,R=228))
		ColorScale(1)=(RelativeTime=0.800000,Color=(B=60,G=200,R=255))
		ColorScale(2)=(RelativeTime=1.000000)
		Opacity=0.800000
		MaxParticles=1
		StartLocationOffset=(X=-2.000000)
		UseRotationFrom=PTRS_Actor
		StartSpinRange=(X=(Max=1.000000))
		SizeScale(0)=(RelativeSize=0.500000)
		SizeScale(1)=(RelativeTime=1.000000,RelativeSize=1.000000)
		StartSizeRange=(X=(Min=400.000000,Max=450.000000))
		InitialParticlesPerSecond=500.000000
		Texture=Texture'AW-2004Particles.Weapons.PlasmaStar'
		LifetimeRange=(Min=0.200000,Max=0.200000)
	End Object
	Emitters(0)=SpriteEmitter'SpriteEmitter11326'

	Begin Object Class=SpriteEmitter Name=SpriteEmitter11327
		UseDirectionAs=PTDU_Scale
		UseColorScale=True
		RespawnDeadParticles=False
		SpinParticles=True
		UniformSize=True
		AutomaticInitialSpawning=False
		ColorScale(0)=(Color=(B=100,G=200,R=255))
		ColorScale(1)=(RelativeTime=0.700000,Color=(B=40,G=180,R=255))
		ColorScale(2)=(RelativeTime=1.000000)
		MaxParticles=1
		StartLocationOffset=(X=-4.000000)
		UseRotationFrom=PTRS_Actor
		StartSpinRange=(X=(Max=1.000000))
		StartSizeRange=(X=(Min=120.000000,Max=150.000000))
		InitialParticlesPerSecond=5000.000000
		Texture=Texture'EpicParticles.Flares.FlashFlare1'
		LifetimeRange=(Min=0.300000,Max=0.300000)
	End Object
	Emitters(1)=SpriteEmitter'SpriteEmitter11327'

	Begin Object Class=SpriteEmitter Name=SpriteEmitter11328
		UseColorScale=True
		RespawnDeadParticles=False
		SpinParticles=True
		UseSizeScale=True
		UseRegularSizeScale=False
		UniformSize=True
		AutomaticInitialSpawning=False
		BlendBetweenSubdivisions=True
		UseRandomSubdivision=True
		ColorScale(0)=(Color=(B=200,G=210,R=255))
		ColorScale(1)=(RelativeTime=1.000000)
		Opacity=0.700000
		StartLocationShape=PTLS_Sphere
		SphereRadiusRange=(Min=16.000000,Max=32.000000)
		StartSpinRange=(X=(Max=1.000000))
		SizeScale(0)=(RelativeSize=0.750000)
		SizeScale(1)=(RelativeTime=1.000000,RelativeSize=1.750000)
		StartSizeRange=(X=(Min=120.000000,Max=150.000000))
		InitialParticlesPerSecond=5000.000000
		Texture=Texture'AW-2004Particles.Fire.GrenadeTest'
		TextureUSubdivisions=2
		TextureVSubdivisions=2
		LifetimeRange=(Min=0.350000,Max=0.450000)
	End Object
	Emitters(2)=SpriteEmitter'SpriteEmitter11328'

	Begin Object Class=SpriteEmitter Name=SpriteEmitter11329
		UseColorScale=True
		RespawnDeadParticles=False
		SpinParticles=True
		UniformSize=True
		AutomaticInitialSpawning=False
		Acceleration=(Z=-500.000000)
		ColorScale(0)=(Color=(B=94,G=203,R=255))
		ColorScale(1)=(RelativeTime=0.600000,Color=(B=40,G=180,R=255))
		ColorScale(2)=(RelativeTime=1.000000)
		MaxParticles=45
		DetailMode=DM_High
		StartLocationShape=PTLS_Polar
		StartLocationPolarRange=(Y=(Max=65536.000000),Z=(Max=30.000000))
		UseRotationFrom=PTRS_Actor
		RotationOffset=(Yaw=16384)
		SpinsPerSecondRange=(X=(Max=0.050000))
		StartSpinRange=(X=(Max=1.000000))
		StartSizeRange=(X=(Min=5.000000,Max=15.000000))
		InitialParticlesPerSecond=5000.000000
		Texture=Texture'AW-2004Particles.Weapons.PlasmaStar2'
		LifetimeRange=(Min=0.500000,Max=1.000000)
		StartVelocityRange=(Y=(Min=50.000000,Max=150.000000))
		StartVelocityRadialRange=(Min=-100.000000,Max=-200.000000)
		GetVelocityDirectionFrom=PTVD_AddRadial
	End Object
	Emitters(3)=SpriteEmitter'SpriteEmitter11329'
}
