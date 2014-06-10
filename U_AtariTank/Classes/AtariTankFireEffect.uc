class AtariTankFireEffect extends Emitter;

#exec OBJ LOAD FILE="..\Textures\AW-2004Particles.utx"

defaultproperties
{
	Begin Object Class=SpriteEmitter Name=SpriteEmitter6
		UseColorScale=True
		RespawnDeadParticles=False
		SpinParticles=True
		UseSizeScale=True
		UseRegularSizeScale=False
		UniformSize=True
		AutomaticInitialSpawning=False
		BlendBetweenSubdivisions=True
		UseRandomSubdivision=True
		ColorScale(0)=(Color=(B=255,G=255,R=255))
		ColorScale(1)=(RelativeTime=1.000000)
		Opacity=0.700000
		DetailMode=DM_SuperHigh
		StartLocationShape=PTLS_Sphere
		SphereRadiusRange=(Min=16.000000,Max=32.000000)
		StartSpinRange=(X=(Max=1.000000))
		SizeScale(0)=(RelativeSize=0.300000)
		SizeScale(1)=(RelativeTime=1.000000,RelativeSize=0.750000)
		StartSizeRange=(X=(Max=20.000000))
		InitialParticlesPerSecond=5000.000000
		Texture=Texture'U_AtariTank.AtariSmoke'
		TextureUSubdivisions=2
		TextureVSubdivisions=2
		LifetimeRange=(Min=0.250000,Max=0.350000)
	End Object
	Emitters(0)=SpriteEmitter'AtariTankFireEffect.SpriteEmitter6'

	Begin Object Class=SpriteEmitter Name=SpriteEmitter4
		UseColorScale=True
		RespawnDeadParticles=False
		SpinParticles=True
		UseSizeScale=True
		UseRegularSizeScale=False
		UniformSize=True
		AutomaticInitialSpawning=False
		UseRandomSubdivision=True
		UseVelocityScale=True
		ColorScale(0)=(Color=(B=128,G=128,R=128,A=255))
		ColorScale(1)=(RelativeTime=1.000000,Color=(B=128,G=128,R=128))
		Opacity=0.500000
		StartLocationRange=(X=(Max=10.000000))
		UseRotationFrom=PTRS_Actor
		StartSpinRange=(X=(Max=1.000000))
		SizeScale(0)=(RelativeSize=0.200000)
		SizeScale(1)=(RelativeTime=1.000000,RelativeSize=0.700000)
		StartSizeRange=(X=(Min=10.000000))
		InitialParticlesPerSecond=5000.000000
		DrawStyle=PTDS_AlphaBlend
		Texture=Texture'U_AtariTank.AtariSmoke'
		TextureUSubdivisions=2
		TextureVSubdivisions=2
		LifetimeRange=(Min=2.000000,Max=2.000000)
		StartVelocityRange=(X=(Min=75.000000,Max=350.000000))
		VelocityScale(0)=(RelativeVelocity=(X=1.000000,Y=1.000000,Z=1.000000))
		VelocityScale(1)=(RelativeTime=1.000000)
	End Object
	Emitters(2)=SpriteEmitter'AtariTankFireEffect.SpriteEmitter4'

	Begin Object Class=SpriteEmitter Name=SpriteEmitter5
		UseColorScale=True
		RespawnDeadParticles=False
		SpinParticles=True
		UseSizeScale=True
		UseRegularSizeScale=False
		UniformSize=True
		AutomaticInitialSpawning=False
		UseRandomSubdivision=True
		UseVelocityScale=True
		ColorScale(0)=(Color=(B=128,G=128,R=128,A=255))
		ColorScale(1)=(RelativeTime=1.000000,Color=(B=128,G=128,R=128))
		Opacity=0.500000
		StartLocationRange=(X=(Max=10.000000))
		UseRotationFrom=PTRS_Actor
		StartSpinRange=(X=(Max=1.000000))
		SizeScale(0)=(RelativeSize=0.200000)
		SizeScale(1)=(RelativeTime=1.000000,RelativeSize=0.700000)
		StartSizeRange=(X=(Min=10.000000,Max=20.000000))
		InitialParticlesPerSecond=5000.000000
		DrawStyle=PTDS_AlphaBlend
		Texture=Texture'U_AtariTank.AtariSmoke'
		TextureUSubdivisions=2
		TextureVSubdivisions=2
		LifetimeRange=(Min=1.500000,Max=1.500000)
		StartVelocityRange=(X=(Min=300.000000,Max=500.000000))
		VelocityScale(0)=(RelativeVelocity=(X=1.000000,Y=1.000000,Z=1.000000))
		VelocityScale(1)=(RelativeTime=0.500000,RelativeVelocity=(X=0.200000,Y=0.200000,Z=0.200000))
		VelocityScale(2)=(RelativeTime=1.000000)
	End Object
	Emitters(3)=SpriteEmitter'AtariTankFireEffect.SpriteEmitter5'

	Begin Object Class=SpriteEmitter Name=SpriteEmitter0
		UseColorScale=True
		RespawnDeadParticles=False
		SpinParticles=True
		UseSizeScale=True
		UseRegularSizeScale=False
		UniformSize=True
		AutomaticInitialSpawning=False
		ColorScale(0)=(Color=(B=255,G=255,R=255))
		ColorScale(1)=(RelativeTime=1.000000)
		MaxParticles=3
		UseRotationFrom=PTRS_Actor
		StartSpinRange=(X=(Max=1.000000))
		SizeScale(0)=(RelativeSize=1.000000)
		SizeScale(1)=(RelativeTime=1.000000,RelativeSize=3.000000)
		StartSizeRange=(X=(Min=30.000000,Max=40.000000))
		InitialParticlesPerSecond=5000.000000
		Texture=Texture'U_AtariTank.AtariTankFlash'
		LifetimeRange=(Min=0.100000,Max=0.200000)
		StartVelocityRange=(X=(Min=20.000000,Max=25.000000))
	End Object
	Emitters(4)=SpriteEmitter'AtariTankFireEffect.SpriteEmitter0'

	Begin Object Class=SpriteEmitter Name=SpriteEmitter1
		UseColorScale=True
		RespawnDeadParticles=False
		SpinParticles=True
		UseSizeScale=True
		UseRegularSizeScale=False
		UniformSize=True
		AutomaticInitialSpawning=False
		ColorScale(0)=(Color=(B=255,G=255,R=255))
		ColorScale(1)=(RelativeTime=1.000000)
		MaxParticles=3
		StartLocationOffset=(X=40.000000)
		StartLocationRange=(X=(Max=10.000000))
		UseRotationFrom=PTRS_Actor
		StartSpinRange=(X=(Max=1.000000))
		SizeScale(0)=(RelativeSize=1.000000)
		SizeScale(1)=(RelativeTime=1.000000,RelativeSize=2.000000)
		StartSizeRange=(X=(Min=20.000000,Max=20.000000))
		InitialParticlesPerSecond=5000.000000
		Texture=Texture'AW-2004Explosions.Fire.Fireball3'
		LifetimeRange=(Min=0.200000,Max=0.200000)
		StartVelocityRange=(X=(Min=60.000000,Max=75.000000))
	End Object
	Emitters(5)=SpriteEmitter'AtariTankFireEffect.SpriteEmitter1'

	Begin Object Class=SpriteEmitter Name=SpriteEmitter2
		UseColorScale=True
		RespawnDeadParticles=False
		SpinParticles=True
		UseSizeScale=True
		UseRegularSizeScale=False
		UniformSize=True
		AutomaticInitialSpawning=False
		ColorScale(0)=(Color=(B=255,G=255,R=255))
		ColorScale(1)=(RelativeTime=1.000000)
		MaxParticles=3
		StartLocationOffset=(X=65.000000)
		StartLocationRange=(X=(Max=10.000000))
		UseRotationFrom=PTRS_Actor
		StartSpinRange=(X=(Max=1.000000))
		SizeScale(0)=(RelativeSize=1.000000)
		SizeScale(1)=(RelativeTime=1.000000,RelativeSize=2.000000)
		StartSizeRange=(X=(Min=10.000000,Max=10.000000))
		InitialParticlesPerSecond=5000.000000
		Texture=Texture'AW-2004Explosions.Fire.Fireball3'
		LifetimeRange=(Min=0.100000,Max=0.200000)
		StartVelocityRange=(X=(Min=20.000000,Max=25.000000))
	End Object
	Emitters(6)=SpriteEmitter'AtariTankFireEffect.SpriteEmitter2'

	Begin Object Class=SpriteEmitter Name=SpriteEmitter3
		UseColorScale=True
		RespawnDeadParticles=False
		SpinParticles=True
		UseSizeScale=True
		UseRegularSizeScale=False
		UniformSize=True
		AutomaticInitialSpawning=False
		ColorScale(0)=(Color=(B=255,G=255,R=255))
		ColorScale(1)=(RelativeTime=1.000000)
		MaxParticles=3
		StartLocationOffset=(X=80.000000)
		StartLocationRange=(X=(Max=5.000000))
		UseRotationFrom=PTRS_Actor
		StartSpinRange=(X=(Max=1.000000))
		SizeScale(0)=(RelativeSize=1.000000)
		SizeScale(1)=(RelativeTime=1.000000,RelativeSize=2.000000)
		StartSizeRange=(X=(Min=5.000000,Max=5.000000))
		InitialParticlesPerSecond=5000.000000
		Texture=Texture'AW-2004Explosions.Fire.Fireball3'
		LifetimeRange=(Min=0.100000,Max=0.200000)
		StartVelocityRange=(X=(Min=20.000000,Max=25.000000))
	End Object
	Emitters(7)=SpriteEmitter'AtariTankFireEffect.SpriteEmitter3'

	Begin Object Class=SpriteEmitter Name=SpriteEmitter10
		UseColorScale=True
		RespawnDeadParticles=False
		SpinParticles=True
		UseSizeScale=True
		UseRegularSizeScale=False
		UniformSize=True
		AutomaticInitialSpawning=False
		UseRandomSubdivision=True
		UseVelocityScale=True
		ColorScale(0)=(Color=(B=192,G=192,R=192,A=255))
		ColorScale(1)=(RelativeTime=1.000000,Color=(B=192,G=192,R=192))
		MaxParticles=25
		StartLocationOffset=(X=-56.000000)
		UseRotationFrom=PTRS_Actor
		SpinsPerSecondRange=(X=(Max=0.050000))
		StartSpinRange=(X=(Max=1.000000))
		SizeScale(0)=(RelativeSize=0.300000)
		SizeScale(1)=(RelativeTime=1.000000,RelativeSize=0.750000)
		InitialParticlesPerSecond=50000.000000
		DrawStyle=PTDS_AlphaBlend
		Texture=Texture'U_AtariTank.AtariSmoke'
		TextureUSubdivisions=2
		TextureVSubdivisions=2
		LifetimeRange=(Min=2.500000,Max=2.500000)
		StartVelocityRange=(X=(Min=-600.000000,Max=600.000000),Y=(Min=300.000000,Max=1500.000000),Z=(Min=-600.000000,Max=600.000000))
		VelocityScale(0)=(RelativeVelocity=(X=1.000000,Y=1.000000,Z=1.000000))
		VelocityScale(1)=(RelativeTime=0.125000,RelativeVelocity=(X=0.200000,Y=0.200000,Z=0.200000))
		VelocityScale(2)=(RelativeTime=1.000000)
	End Object
	Emitters(8)=SpriteEmitter'AtariTankFireEffect.SpriteEmitter10'

	Begin Object Class=SpriteEmitter Name=SpriteEmitter17
		UseColorScale=True
		RespawnDeadParticles=False
		SpinParticles=True
		UseSizeScale=True
		UseRegularSizeScale=False
		UniformSize=True
		AutomaticInitialSpawning=False
		UseRandomSubdivision=True
		UseVelocityScale=True
		ColorScale(0)=(Color=(B=192,G=192,R=192,A=255))
		ColorScale(1)=(RelativeTime=1.000000,Color=(B=192,G=192,R=192))
		MaxParticles=25
		StartLocationOffset=(X=-56.000000)
		UseRotationFrom=PTRS_Actor
		SpinsPerSecondRange=(X=(Max=0.050000))
		StartSpinRange=(X=(Max=1.000000))
		SizeScale(0)=(RelativeSize=0.300000)
		SizeScale(1)=(RelativeTime=1.000000,RelativeSize=0.750000)
		InitialParticlesPerSecond=50000.000000
		DrawStyle=PTDS_AlphaBlend
		Texture=Texture'U_AtariTank.AtariSmoke'
		TextureUSubdivisions=2
		TextureVSubdivisions=2
		LifetimeRange=(Min=2.500000,Max=2.500000)
		StartVelocityRange=(X=(Min=-600.000000,Max=600.000000),Y=(Min=-300.000000,Max=-1500.000000),Z=(Min=-600.000000,Max=600.000000))
		VelocityScale(0)=(RelativeVelocity=(X=1.000000,Y=1.000000,Z=1.000000))
		VelocityScale(1)=(RelativeTime=0.125000,RelativeVelocity=(X=0.200000,Y=0.200000,Z=0.200000))
		VelocityScale(2)=(RelativeTime=1.000000)
	End Object
	Emitters(9)=SpriteEmitter'AtariTankFireEffect.SpriteEmitter17'

	AutoDestroy=True
	bNoDelete=False
	AmbientGlow=254
}
