extends KinematicBody2D


var velocidad = Global.velocidad_npc
var damage_value = Global.damage_value
onready var direccion = -1

var puntosRequeridos = 50

var motion = Vector2(0,0)

func _process(delta):
	movimiento()
	move_and_collide(motion)

func detection_right():
	return $right_detection.is_colliding()

func detection_left():
	return $left_detection.is_colliding()
	
func movimiento():
	if(direccion == 1):
		$AnimatedSprite.flip_h = true
	else:
		$AnimatedSprite.flip_h = false
	
	if(velocidad != 0):
		$AnimatedSprite.play("move")
	
	if(detection_left() or detection_right()):
		direccion*=-1
	
	motion.x = velocidad*direccion


func _on_Area2D_body_entered(body):
	if(body.get_name() == "player"):
		body.iniciarTempAnsiedad()
		Global.salud -=damage_value
		body.nervios_inicio()
		$AnimatedSprite.play("idle")
		body.velocidad = 1
		velocidad = 0


func _on_Area2D_body_exited(body):
	if(body.get_name() == "player"):
		body.detenerContador()
		body.nervios_final()
		body.velocidad = 3
		velocidad = 3

