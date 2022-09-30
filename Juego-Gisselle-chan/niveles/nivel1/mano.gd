extends KinematicBody2D

var velocidad = 1
var direccion = -1
var activar = false
var motion = Vector2(0,0)

func _physics_process(delta):
	if(activar):
		mover()
		move_and_collide(motion)

func mover():
	motion.x = velocidad*direccion
