extends KinematicBody2D

var velocidad = Global.velocidad_npc
var damage_value = Global.damage_value
onready var direccion = -1

var puntosRequeridos = 30

var motion = Vector2(0,0)

func _process(delta):
	movimiento()
	move_and_collide(motion)

func wall_right_detection():
	return $colision_frontal2.is_colliding()
	

func wall_left_detection():
	return $colision_frontal.is_colliding()
	

func movimiento ():
	
	if (direccion == 1):
		$AnimatedSprite.flip_h = true
	else:
		$AnimatedSprite.flip_h = false
	
	if (velocidad != 0):
		$AnimatedSprite.play("npc_horizontal_walk")
	
	
	if (wall_right_detection() or wall_left_detection()):
		direccion *= -1
	
	motion.x = velocidad*direccion


func _on_Area2D_body_entered(body):
	if(body.get_name() == "player" and puntosRequeridos > Global.puntos):
		Global.salud -=damage_value
		body.nervios_inicio()
		$AnimatedSprite.play("npc_idle")
		body.velocidad = 1
		velocidad = 0
		body.iniciarTempAnsiedad()
	


func _on_Area2D_body_exited(body):
	if(body.get_name() == "player"):
		body.nervios_final()
		body.velocidad = 3
		velocidad = 3
		body.detenerContador()
