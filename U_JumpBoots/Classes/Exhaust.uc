//=============================================================================
// Exhaust for jump boots.
// http://come.to/MrEvil
//=============================================================================
class Exhaust extends Emitter;

defaultproperties
{
     Begin Object Class=SpriteEmitter Name=SpriteEmitter0
         UseCollision=True
         UseColorScale=True
         FadeOut=True
         FadeIn=True
         RespawnDeadParticles=False
         AutoDestroy=True
         UniformSize=True
         AutomaticInitialSpawning=False
         BlendBetweenSubdivisions=True
         Acceleration=(Z=-950.000000)
         DampingFactorRange=(Z=(Min=0.100000,Max=0.500000))
         ColorMultiplierRange=(X=(Min=0.190000,Max=0.200000),Y=(Min=0.190000,Max=0.200000),Z=(Min=0.190000,Max=0.200000))
         FadeOutStartTime=0.500000
         FadeInEndTime=0.200000
         MaxParticles=50
         StartSizeRange=(X=(Min=10.000000,Max=20.000000),Y=(Min=10.000000,Max=20.000000),Z=(Min=10.000000,Max=20.000000))
         InitialParticlesPerSecond=300.000000
         Texture=Texture'EmitterTextures.MultiFrame.smoke_a'
         TextureUSubdivisions=4
         TextureVSubdivisions=4
         LifetimeRange=(Min=1.000000,Max=2.000000)
         StartVelocityRange=(X=(Min=-40.000000,Max=40.000000),Y=(Min=-40.000000,Max=40.000000),Z=(Min=-100.000000,Max=-50.000000))
     End Object
     Emitters(0)=SpriteEmitter'SpriteEmitter0'

     Begin Object Class=SpriteEmitter Name=SpriteEmitter1
         UseCollision=True
         UseColorScale=True
         FadeOut=True
         RespawnDeadParticles=False
         AutoDestroy=True
         UniformSize=True
         AutomaticInitialSpawning=False
         BlendBetweenSubdivisions=True
         Acceleration=(Z=-950.000000)
         DampingFactorRange=(Z=(Min=0.100000,Max=0.500000))
         ColorMultiplierRange=(X=(Min=0.290000,Max=0.300000),Y=(Min=0.290000,Max=0.300000),Z=(Min=0.290000,Max=0.300000))
         FadeOutStartTime=0.500000
         MaxParticles=30
         StartSizeRange=(X=(Min=10.000000,Max=20.000000),Y=(Min=10.000000,Max=20.000000),Z=(Min=10.000000,Max=20.000000))
         InitialParticlesPerSecond=180.000000
         DrawStyle=PTDS_Darken
         Texture=Texture'EmitterTextures.MultiFrame.smoke_a'
         TextureUSubdivisions=4
         TextureVSubdivisions=4
         LifetimeRange=(Min=1.000000,Max=2.000000)
         StartVelocityRange=(X=(Min=-40.000000,Max=40.000000),Y=(Min=-40.000000,Max=40.000000),Z=(Min=-60.000000,Max=-10.000000))
     End Object
     Emitters(1)=SpriteEmitter'SpriteEmitter1'

     bNoDelete=False
     bNetTemporary=True
     bSkipActorPropertyReplication=True
     RemoteRole=ROLE_DumbProxy
}
