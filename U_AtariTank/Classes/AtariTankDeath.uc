class AtariTankDeath extends Emitter;

#exec OBJ LOAD FILE="..\Textures\ExplosionTex.utx"
#exec OBJ LOAD FILE="..\StaticMeshes\ONSDeadVehicles-SM.usx"

defaultproperties
{
	Begin Object Class=SpriteEmitter Name=SpriteEmitter20
		UseColorScale=True
		RespawnDeadParticles=False
		UseSizeScale=True
		UseRegularSizeScale=False
		UniformSize=True
		AutomaticInitialSpawning=False
		UseRandomSubdivision=True
		ColorScale(0)=(Color=(A=255))
		ColorScale(1)=(RelativeTime=0.400000,Color=(A=255))
		ColorScale(2)=(RelativeTime=1.000000)
		MaxParticles=6
		DetailMode=DM_High
		StartLocationRange=(X=(Min=-100.000000,Max=100.000000),Y=(Min=-50.000000,Max=50.000000),Z=(Min=-64.000000,Max=64.000000))
		AddLocationFromOtherEmitter=1
		StartLocationShape=PTLS_Sphere
		UseRotationFrom=PTRS_Actor
		SizeScale(0)=(RelativeSize=0.500000)
		SizeScale(1)=(RelativeTime=1.000000,RelativeSize=1.000000)
		InitialParticlesPerSecond=500.000000
		DrawStyle=PTDS_AlphaBlend
		Texture=Texture'U_AtariTank.AtariSmoke'
		TextureUSubdivisions=2
		TextureVSubdivisions=2
		LifetimeRange=(Min=0.600000,Max=0.800000)
		InitialDelayRange=(Min=0.100000,Max=0.100000)
		AddVelocityFromOtherEmitter=1
	End Object
	Emitters(0)=SpriteEmitter'AtariTankDeath.SpriteEmitter20'

	Begin Object Class=SpriteEmitter Name=SpriteEmitter15
		RespawnDeadParticles=False
		SpinParticles=True
		UseSizeScale=True
		UseRegularSizeScale=False
		UniformSize=True
		AutomaticInitialSpawning=False
		BlendBetweenSubdivisions=True
		MaxParticles=20
		StartLocationRange=(X=(Min=-100.000000,Max=100.000000),Y=(Min=-50.000000,Max=50.000000),Z=(Min=-32.000000,Max=32.000000))
		UseRotationFrom=PTRS_Actor
		StartSpinRange=(X=(Max=1.000000))
		SizeScale(0)=(RelativeSize=0.200000)
		SizeScale(1)=(RelativeTime=1.000000,RelativeSize=1.000000)
		InitialParticlesPerSecond=100.000000
		Texture=Texture'U_AtariTank.AtariExplosion'
		TextureUSubdivisions=2
		TextureVSubdivisions=2
		LifetimeRange=(Min=0.400000,Max=0.600000)
		StartVelocityRadialRange=(Min=-50.000000,Max=-100.000000)
		GetVelocityDirectionFrom=PTVD_AddRadial
	End Object
	Emitters(1)=SpriteEmitter'AtariTankDeath.SpriteEmitter15'

	Begin Object Class=MeshEmitter Name=MeshEmitter17
		StaticMesh=StaticMesh'U_AtariTank.BentBarrel'
		RespawnDeadParticles=False
		SpinParticles=True
		AutomaticInitialSpawning=False
		Acceleration=(Z=-600.000000)
		MaxParticles=1
		DetailMode=DM_High
		StartLocationOffset=(X=-64.000000,Z=48.000000)
		UseRotationFrom=PTRS_Actor
		SpinCCWorCW=(Y=0.000000)
		SpinsPerSecondRange=(Y=(Min=1.000000,Max=2.000000))
		InitialParticlesPerSecond=5000.000000
		LifetimeRange=(Min=1.500000,Max=2.000000)
		StartVelocityRange=(X=(Min=-100.000000,Max=-200.000000),Z=(Min=500.000000,Max=800.000000))
	End Object
	Emitters(2)=MeshEmitter'AtariTankDeath.MeshEmitter17'

	Begin Object Class=MeshEmitter Name=MeshEmitter18
		StaticMesh=StaticMesh'U_AtariTank.Cube'
		RespawnDeadParticles=False
		SpinParticles=True
		AutomaticInitialSpawning=False
		Acceleration=(Z=-500.000000)
		MaxParticles=1
		DetailMode=DM_High
		StartLocationOffset=(Y=-20.000000,Z=16.000000)
		UseRotationFrom=PTRS_Actor
		SpinCCWorCW=(Z=1.000000)
		SpinsPerSecondRange=(Y=(Max=0.100000),Z=(Min=1.000000,Max=2.000000))
		InitialParticlesPerSecond=5000.000000
		LifetimeRange=(Min=1.000000,Max=1.000000)
		StartVelocityRange=(Y=(Min=-300.000000,Max=-400.000000),Z=(Min=400.000000,Max=500.000000))
	End Object
	Emitters(3)=MeshEmitter'AtariTankDeath.MeshEmitter18'

	Begin Object Class=MeshEmitter Name=MeshEmitter21
		StaticMesh=StaticMesh'U_AtariTank.Cube'
		RespawnDeadParticles=False
		SpinParticles=True
		AutomaticInitialSpawning=False
		Acceleration=(Z=-500.000000)
		MaxParticles=1
		DetailMode=DM_High
		StartLocationOffset=(Y=20.000000,Z=16.000000)
		UseRotationFrom=PTRS_Actor
		SpinCCWorCW=(Z=0.000000)
		SpinsPerSecondRange=(Y=(Max=0.100000),Z=(Min=1.000000,Max=2.000000))
		StartSizeRange=(X=(Min=-1.000000,Max=-1.000000))
		InitialParticlesPerSecond=5000.000000
		LifetimeRange=(Min=1.000000,Max=1.000000)
		StartVelocityRange=(Y=(Min=300.000000,Max=400.000000),Z=(Min=200.000000,Max=300.000000))
	End Object
	Emitters(4)=MeshEmitter'AtariTankDeath.MeshEmitter21'

	Begin Object Class=SpriteEmitter Name=SpriteEmitter28
		RespawnDeadParticles=False
		SpinParticles=True
		UseSizeScale=True
		UseRegularSizeScale=False
		UniformSize=True
		AutomaticInitialSpawning=False
		BlendBetweenSubdivisions=True
		ColorScale(0)=(Color=(A=255))
		ColorScale(1)=(RelativeTime=1.000000)
		MaxParticles=5
		DetailMode=DM_SuperHigh
		AddLocationFromOtherEmitter=6
		StartLocationShape=PTLS_Sphere
		SphereRadiusRange=(Max=16.000000)
		UseRotationFrom=PTRS_Actor
		StartSpinRange=(X=(Max=1.000000))
		SizeScale(0)=(RelativeSize=0.200000)
		SizeScale(1)=(RelativeTime=0.200000,RelativeSize=1.000000)
		SizeScale(2)=(RelativeTime=1.000000,RelativeSize=1.500000)
		StartSizeRange=(X=(Min=40.000000,Max=60.000000))
		InitialParticlesPerSecond=6.500000
		Texture=Texture'U_AtariTank.AtariExplosion'
		TextureUSubdivisions=2
		TextureVSubdivisions=4
		LifetimeRange=(Min=0.500000,Max=0.500000)
	End Object
	Emitters(5)=SpriteEmitter'AtariTankDeath.SpriteEmitter28'

	Begin Object Class=MeshEmitter Name=MeshEmitter22
		StaticMesh=StaticMesh'U_AtariTank.TreadLeft'
		UseMeshBlendMode=False
		UseParticleColor=True
		UseCollision=True
		UseColorScale=True
		RespawnDeadParticles=False
		SpinParticles=True
		DampRotation=True
		AutomaticInitialSpawning=False
		Acceleration=(Z=-300.000000)
		ExtentMultiplier=(X=0.500000,Y=0.500000,Z=0.500000)
		DampingFactorRange=(X=(Min=0.400000,Max=0.400000),Y=(Min=0.400000,Max=0.400000),Z=(Min=0.300000,Max=0.300000))
		ColorScale(0)=(Color=(B=192,G=192,R=192,A=255))
		ColorScale(1)=(RelativeTime=0.850000,Color=(B=128,G=128,R=128,A=255))
		ColorScale(2)=(RelativeTime=1.000000,Color=(B=128,G=128,R=128))
		MaxParticles=1
		DetailMode=DM_High
		StartLocationOffset=(X=80.000000,Y=64.000000,Z=-32.000000)
		UseRotationFrom=PTRS_Actor
		SpinsPerSecondRange=(X=(Max=0.300000),Y=(Max=0.300000),Z=(Max=0.300000))
		StartSpinRange=(X=(Max=1.000000))
		InitialParticlesPerSecond=500.000000
		DrawStyle=PTDS_AlphaBlend
		LifetimeRange=(Min=2.000000,Max=2.000000)
		StartVelocityRange=(X=(Min=300.000000,Max=500.000000),Y=(Min=300.000000,Max=500.000000),Z=(Min=100.000000,Max=100.000000))
	End Object
	Emitters(6)=MeshEmitter'AtariTankDeath.MeshEmitter22'

	Begin Object Class=SpriteEmitter Name=SpriteEmitter30
		RespawnDeadParticles=False
		SpinParticles=True
		UseSizeScale=True
		UseRegularSizeScale=False
		UniformSize=True
		AutomaticInitialSpawning=False
		BlendBetweenSubdivisions=True
		MaxParticles=5
		DetailMode=DM_SuperHigh
		AddLocationFromOtherEmitter=8
		StartLocationShape=PTLS_Sphere
		SphereRadiusRange=(Max=16.000000)
		UseRotationFrom=PTRS_Actor
		StartSpinRange=(X=(Max=1.000000))
		SizeScale(0)=(RelativeSize=0.200000)
		SizeScale(1)=(RelativeTime=0.200000,RelativeSize=1.000000)
		SizeScale(2)=(RelativeTime=1.000000,RelativeSize=1.500000)
		StartSizeRange=(X=(Min=40.000000,Max=60.000000))
		InitialParticlesPerSecond=6.500000
		Texture=Texture'U_AtariTank.AtariExplosion'
		TextureUSubdivisions=2
		TextureVSubdivisions=4
		LifetimeRange=(Min=0.500000,Max=0.500000)
	End Object
	Emitters(7)=SpriteEmitter'AtariTankDeath.SpriteEmitter30'

	Begin Object Class=MeshEmitter Name=MeshEmitter23
		StaticMesh=StaticMesh'U_AtariTank.TreadRight'
		UseMeshBlendMode=False
		UseParticleColor=True
		UseCollision=True
		UseColorScale=True
		RespawnDeadParticles=False
		SpinParticles=True
		DampRotation=True
		AutomaticInitialSpawning=False
		Acceleration=(Z=-300.000000)
		ExtentMultiplier=(X=0.500000,Y=0.500000,Z=0.500000)
		DampingFactorRange=(X=(Min=0.400000,Max=0.400000),Y=(Min=0.400000,Max=0.400000),Z=(Min=0.300000,Max=0.300000))
		ColorScale(0)=(Color=(B=192,G=192,R=192,A=255))
		ColorScale(1)=(RelativeTime=0.850000,Color=(B=128,G=128,R=128,A=255))
		ColorScale(2)=(RelativeTime=1.000000,Color=(B=128,G=128,R=128))
		MaxParticles=1
		DetailMode=DM_High
		StartLocationOffset=(X=80.000000,Y=-64.000000,Z=-32.000000)
		UseRotationFrom=PTRS_Actor
		SpinsPerSecondRange=(X=(Max=0.300000),Y=(Max=0.300000),Z=(Max=0.300000))
		StartSpinRange=(X=(Max=1.000000))
		InitialParticlesPerSecond=500.000000
		DrawStyle=PTDS_AlphaBlend
		LifetimeRange=(Min=2.000000,Max=2.000000)
		StartVelocityRange=(X=(Min=200.000000,Max=300.000000),Y=(Min=-300.000000,Max=-500.000000),Z=(Min=100.000000,Max=100.000000))
	End Object
	Emitters(8)=MeshEmitter'AtariTankDeath.MeshEmitter23'

	Begin Object Class=SpriteEmitter Name=SpriteEmitter31
		RespawnDeadParticles=False
		SpinParticles=True
		UseSizeScale=True
		UseRegularSizeScale=False
		UniformSize=True
		AutomaticInitialSpawning=False
		BlendBetweenSubdivisions=True
		MaxParticles=5
		DetailMode=DM_SuperHigh
		AddLocationFromOtherEmitter=10
		StartLocationShape=PTLS_Sphere
		SphereRadiusRange=(Max=16.000000)
		UseRotationFrom=PTRS_Actor
		StartSpinRange=(X=(Max=1.000000))
		SizeScale(0)=(RelativeSize=0.200000)
		SizeScale(1)=(RelativeTime=0.200000,RelativeSize=1.000000)
		SizeScale(2)=(RelativeTime=1.000000,RelativeSize=1.500000)
		StartSizeRange=(X=(Min=40.000000,Max=60.000000))
		InitialParticlesPerSecond=6.500000
		Texture=Texture'U_AtariTank.AtariExplosion'
		TextureUSubdivisions=2
		TextureVSubdivisions=4
		LifetimeRange=(Min=0.500000,Max=0.500000)
	End Object
	Emitters(9)=SpriteEmitter'AtariTankDeath.SpriteEmitter31'

	Begin Object Class=MeshEmitter Name=MeshEmitter24
		StaticMesh=StaticMesh'U_AtariTank.Cube'
		UseCollision=True
		UseColorScale=True
		RespawnDeadParticles=False
		SpinParticles=True
		DampRotation=True
		AutomaticInitialSpawning=False
		Acceleration=(Z=-300.000000)
		ExtentMultiplier=(X=0.500000,Y=0.500000,Z=0.500000)
		DampingFactorRange=(X=(Min=0.400000,Max=0.400000),Y=(Min=0.400000,Max=0.400000),Z=(Min=0.300000,Max=0.300000))
		ColorScale(0)=(Color=(B=192,G=192,R=192,A=255))
		ColorScale(1)=(RelativeTime=0.850000,Color=(B=128,G=128,R=128,A=255))
		ColorScale(2)=(RelativeTime=1.000000,Color=(B=128,G=128,R=128))
		MaxParticles=1
		DetailMode=DM_High
		StartLocationOffset=(X=-80.000000,Y=64.000000,Z=-32.000000)
		UseRotationFrom=PTRS_Actor
		SpinsPerSecondRange=(X=(Max=0.300000),Y=(Max=0.300000),Z=(Max=0.300000))
		StartSpinRange=(X=(Max=1.000000))
		InitialParticlesPerSecond=500.000000
		DrawStyle=PTDS_AlphaBlend
		LifetimeRange=(Min=2.000000,Max=2.000000)
		StartVelocityRange=(X=(Min=-300.000000,Max=-400.000000),Y=(Min=300.000000,Max=500.000000),Z=(Min=50.000000,Max=100.000000))
	End Object
	Emitters(10)=MeshEmitter'AtariTankDeath.MeshEmitter24'

	Begin Object Class=SpriteEmitter Name=SpriteEmitter32
		RespawnDeadParticles=False
		SpinParticles=True
		UseSizeScale=True
		UseRegularSizeScale=False
		UniformSize=True
		AutomaticInitialSpawning=False
		BlendBetweenSubdivisions=True
		MaxParticles=5
		DetailMode=DM_SuperHigh
		AddLocationFromOtherEmitter=12
		StartLocationShape=PTLS_Sphere
		SphereRadiusRange=(Max=16.000000)
		UseRotationFrom=PTRS_Actor
		StartSpinRange=(X=(Max=1.000000))
		SizeScale(0)=(RelativeSize=0.200000)
		SizeScale(1)=(RelativeTime=0.200000,RelativeSize=1.000000)
		SizeScale(2)=(RelativeTime=1.000000,RelativeSize=1.500000)
		StartSizeRange=(X=(Min=40.000000,Max=60.000000))
		InitialParticlesPerSecond=6.500000
		Texture=Texture'U_AtariTank.AtariExplosion'
		TextureUSubdivisions=2
		TextureVSubdivisions=4
		LifetimeRange=(Min=0.500000,Max=0.500000)
	End Object
	Emitters(11)=SpriteEmitter'AtariTankDeath.SpriteEmitter32'

	Begin Object Class=MeshEmitter Name=MeshEmitter25
		StaticMesh=StaticMesh'U_AtariTank.Cube'
		UseMeshBlendMode=False
		UseParticleColor=True
		UseCollision=True
		UseColorScale=True
		RespawnDeadParticles=False
		SpinParticles=True
		DampRotation=True
		AutomaticInitialSpawning=False
		Acceleration=(Z=-300.000000)
		ExtentMultiplier=(X=0.500000,Y=0.500000,Z=0.500000)
		DampingFactorRange=(X=(Min=0.400000,Max=0.400000),Y=(Min=0.400000,Max=0.400000),Z=(Min=0.300000,Max=0.300000))
		ColorScale(0)=(Color=(B=192,G=192,R=192,A=255))
		ColorScale(1)=(RelativeTime=0.850000,Color=(B=128,G=128,R=128,A=255))
		ColorScale(2)=(RelativeTime=1.000000,Color=(B=128,G=128,R=128))
		MaxParticles=1
		DetailMode=DM_High
		StartLocationOffset=(X=-80.000000,Y=-64.000000,Z=-32.000000)
		UseRotationFrom=PTRS_Actor
		SpinsPerSecondRange=(X=(Max=0.300000),Y=(Max=0.300000),Z=(Max=0.300000))
		StartSpinRange=(X=(Max=1.000000))
		InitialParticlesPerSecond=500.000000
		DrawStyle=PTDS_AlphaBlend
		LifetimeRange=(Min=2.000000,Max=2.000000)
		StartVelocityRange=(X=(Min=-200.000000,Max=-300.000000),Y=(Min=-300.000000,Max=-500.000000),Z=(Min=100.000000,Max=100.000000))
	End Object
	Emitters(12)=MeshEmitter'AtariTankDeath.MeshEmitter25'

	Begin Object Class=MeshEmitter Name=MeshEmitter5
		StaticMesh=StaticMesh'U_AtariTank.TankBody'
		UseParticleColor=True
		UseColorScale=True
		RespawnDeadParticles=False
		SpinParticles=True
		AutomaticInitialSpawning=False
		Acceleration=(Z=-400.000000)
		ColorScale(0)=(Color=(B=192,G=192,R=192,A=255))
		ColorScale(1)=(RelativeTime=0.850000,Color=(B=128,G=128,R=128,A=255))
		ColorScale(2)=(RelativeTime=1.000000,Color=(B=128,G=128,R=128))
		MaxParticles=15
		DetailMode=DM_SuperHigh
		StartLocationShape=PTLS_Sphere
		SphereRadiusRange=(Min=8.000000,Max=8.000000)
		SpinsPerSecondRange=(X=(Max=0.200000),Y=(Max=0.200000),Z=(Max=0.200000))
		StartSpinRange=(X=(Max=1.000000),Y=(Max=1.000000),Z=(Max=1.000000))
		StartSizeRange=(X=(Min=0.500000),Y=(Min=0.500000),Z=(Min=0.500000))
		InitialParticlesPerSecond=5000.000000
		DrawStyle=PTDS_AlphaBlend
		LifetimeRange=(Min=1.500000,Max=2.000000)
		StartVelocityRadialRange=(Min=300.000000,Max=800.000000)
		VelocityLossRange=(X=(Min=0.500000,Max=1.000000),Y=(Min=0.500000,Max=1.000000),Z=(Min=0.500000,Max=1.000000))
		GetVelocityDirectionFrom=PTVD_AddRadial
	End Object
	Emitters(13)=MeshEmitter'AtariTankDeath.MeshEmitter5'

	Begin Object Class=MeshEmitter Name=MeshEmitter6
		StaticMesh=StaticMesh'U_AtariTank.Cube'
		RenderTwoSided=True
		UseParticleColor=True
		UseColorScale=True
		RespawnDeadParticles=False
		SpinParticles=True
		AutomaticInitialSpawning=False
		Acceleration=(Z=-800.000000)
		ColorScale(0)=(Color=(B=192,G=192,R=192,A=255))
		ColorScale(1)=(RelativeTime=0.850000,Color=(B=128,G=128,R=128,A=255))
		ColorScale(2)=(RelativeTime=1.000000,Color=(B=128,G=128,R=128))
		MaxParticles=15
		DetailMode=DM_SuperHigh
		StartLocationShape=PTLS_Sphere
		SphereRadiusRange=(Min=8.000000,Max=8.000000)
		SpinsPerSecondRange=(X=(Max=0.200000),Y=(Max=0.200000),Z=(Max=0.200000))
		StartSpinRange=(X=(Max=1.000000),Y=(Max=1.000000),Z=(Max=1.000000))
		StartSizeRange=(X=(Min=0.500000),Y=(Min=0.500000),Z=(Min=0.500000))
		InitialParticlesPerSecond=5000.000000
		DrawStyle=PTDS_AlphaBlend
		LifetimeRange=(Min=1.500000,Max=2.000000)
		StartVelocityRange=(Z=(Min=100.000000,Max=300.000000))
		StartVelocityRadialRange=(Min=300.000000,Max=800.000000)
		VelocityLossRange=(X=(Min=0.500000,Max=1.000000),Y=(Min=0.500000,Max=1.000000),Z=(Min=0.500000,Max=1.000000))
		GetVelocityDirectionFrom=PTVD_AddRadial
	End Object
	Emitters(14)=MeshEmitter'AtariTankDeath.MeshEmitter6'

	AutoDestroy=True
	bNoDelete=False
}
