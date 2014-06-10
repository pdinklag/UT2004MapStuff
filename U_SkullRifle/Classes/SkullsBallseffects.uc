//=============================================================================
// SkullsBallseffects.
//=============================================================================
class SkullsBallseffects extends ShockBall
	placeable;

defaultproperties
{
     Begin Object Class=SpriteEmitter Name=SpriteEmitter12
         UniformSize=True
         Acceleration=(Z=-130.000000)
         ColorMultiplierRange=(Y=(Min=0.000000,Max=0.000000),Z=(Min=0.000000,Max=0.000000))
         Opacity=0.900000
         MaxParticles=3
         StartLocationShape=PTLS_Sphere
         SphereRadiusRange=(Min=12.000000,Max=15.000000)
         StartSizeRange=(X=(Min=5.000000,Max=7.000000))
         Texture=Texture'U_SkullRifle.Tex.waterdropen'
         LifetimeRange=(Min=2.450000,Max=2.500000)
         StartVelocityRange=(Z=(Min=-240.000000,Max=-250.000000))
     End Object
     Emitters(0)=SpriteEmitter'SpriteEmitter12'

     Begin Object Class=SpriteEmitter Name=SpriteEmitter13
         UniformSize=True
         Acceleration=(Z=-130.000000)
         ColorMultiplierRange=(Y=(Min=0.000000,Max=0.000000),Z=(Min=0.000000,Max=0.000000))
         Opacity=0.900000
         MaxParticles=3
         StartLocationShape=PTLS_Sphere
         SphereRadiusRange=(Min=12.000000,Max=15.000000)
         StartSizeRange=(X=(Min=5.000000,Max=7.000000))
         Texture=Texture'U_SkullRifle.Tex.waterdropen'
         LifetimeRange=(Min=2.450000,Max=2.500000)
         StartVelocityRange=(Z=(Min=-240.000000,Max=-250.000000))
     End Object
     Emitters(1)=SpriteEmitter'SpriteEmitter13'

     Begin Object Class=SpriteEmitter Name=SpriteEmitter14
         UseDirectionAs=PTDU_Normal
         UseColorScale=True
         FadeOut=True
         FadeIn=True
         SpinParticles=True
         UniformSize=True
         Acceleration=(Z=100.000000)
         ColorScale(0)=(Color=(G=162,R=185,A=255))
         ColorScale(1)=(RelativeTime=1.000000,Color=(B=92,G=44,R=69,A=50))
         FadeOutStartTime=0.800000
         FadeInEndTime=0.200000
         MaxParticles=3
         StartSpinRange=(X=(Max=1.000000))
         StartSizeRange=(X=(Min=75.000000,Max=75.000000),Y=(Min=75.000000,Max=75.000000),Z=(Min=75.000000,Max=75.000000))
         Texture=Texture'U_SkullRifle.Tex.pentagramm'
         LifetimeRange=(Min=1.400000,Max=1.400000)
         WarmupTicksPerSecond=2.000000
         RelativeWarmupTime=2.000000
     End Object
     Emitters(2)=SpriteEmitter'SpriteEmitter14'

}
