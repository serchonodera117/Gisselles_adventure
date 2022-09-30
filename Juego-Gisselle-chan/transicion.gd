extends Node2D

onready var anim_player:AnimationPlayer = $ColorRect/AnimationPlayer

func reproducir(path: String):
   anim_player.play("transicion_basica")#--cambio de escena animacion
