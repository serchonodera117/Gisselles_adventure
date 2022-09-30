extends KinematicBody2D


onready var gravedad = 100
onready var can_move = true
onready var direccion = -1
var motion = Vector2(0,0)
var velocidad = 2
var vida = 100

onready var damage = false


func _process(delta):
	$Label.text = String(vida)+"/100"
	if can_move:
		movimiento()		
		motion.y += gravedad*delta
		motion = move_and_slide(motion, Vector2.UP)
		move_and_collide(motion) 

func _next_to_left_wall():
	return $izquierda.is_colliding()

func _next_to_right_wall():
	return $derecha.is_colliding()

func _floor_detection():
	return $floor_detection.is_colliding()
func _flor_detection2():
	return $floor_detection2.is_colliding()

func movimiento():
	if vida > 0:
		can_move = true
	else:
		can_move = false
		if direccion == 1:
			$AnimatedSprite.flip_h = true
		else:
			$AnimatedSprite.flip_h = false
		$AnimatedSprite.play("die")
		$destruido.play(2)
		yield(get_tree().create_timer(0.7),"timeout")
		$destruido.stop()
		queue_free()
		
	if direccion == 1:
		$AnimatedSprite.flip_h = true
		$damagebox.position.x = -12
		$escudo.position.x = 6.5
		$lastimar/lastimar.position.x = 16
	else:
		$AnimatedSprite.flip_h = false
		$damagebox.position.x = 0
		$escudo.position.x = -8.5
		$lastimar/lastimar.position.x = -16

	
	$AnimatedSprite.play("walk")
	if _next_to_right_wall() or _next_to_left_wall() or !_floor_detection() or !_flor_detection2():
		direccion *=-1
		
	motion.x = velocidad*direccion 


func _on_damagebox_body_entered(body):
	if(body.get_name()=="player"):
		Global.salud -= 20
		body.herida()
	if(body.get_name()=="caramelito_p"):
		body.free()
		vida -= 20


func _on_lastimar_body_entered(body):
	if(body.get_name()=="player"):
		Global.salud -= 20
		body.herida()
