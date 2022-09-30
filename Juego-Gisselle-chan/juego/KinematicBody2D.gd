extends KinematicBody2D

#var velocidad = 250
var gravedad = 1
var direccion = 3
var motion = Vector2(0,0)
var contadorRebote = 0

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


func _physics_process(delta):
	movimiento()
	motion.y += gravedad * delta
	motion = move_and_slide(motion, Vector2(0,-1))

func movimiento():
	
	if(is_on_wall()):
		queue_free()
	elif (is_on_floor()):
		queue_free()

func explosion():
	$AnimatedSprite.play("destroid")
	yield(get_tree().create_timer(0.5), "timeout")
	queue_free()
