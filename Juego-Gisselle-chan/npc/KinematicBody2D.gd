extends KinematicBody2D

var velocidad = Global.velocidad_npc
var damage_value = Global.damage_value
onready var direccion = -1

var puntosRequeridos= 15

var motion = Vector2(0,0)

func _process(delta):
	movimiento()
	move_and_collide(motion)
	

func up_walk_detection():
	return $up_detection.is_colliding()

func down_walk_detection():
	return $down_detection.is_colliding()

func movimiento():
	if (velocidad != 0):
		if(direccion == 1):
			$AnimatedSprite.play("move_down")
		else:
			$AnimatedSprite.play("move_up")
	
	if(up_walk_detection() or down_walk_detection()):
		direccion *= -1
	
	motion.y = velocidad*direccion


func _on_Area2D_body_entered(body):
	if(body.get_name() == "player" and Global.puntos < puntosRequeridos):
		body.iniciarTempAnsiedad()
		body.nervios_inicio()
		Global.salud -= damage_value
		$AnimatedSprite.play("npc_idle")
		body.velocidad = 1
		velocidad = 0
		if(direccion == 1):        #---- direccion de mirada del npc
			$AnimatedSprite.play("idle_down")
		else:
			$AnimatedSprite.play("idle_up")

func _on_Area2D_body_exited(body):
	if(body.get_name() == "player"):
		body.detenerContador()
		body.nervios_final()
		body.velocidad = 3
		velocidad = 3
