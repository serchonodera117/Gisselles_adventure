extends KinematicBody2D

onready var gravedad = 130
onready var can_move = true
onready var direccion = -1
var motion = Vector2(0,0)
var velocidad = 200

onready var damage = false
var llamadas_morir=0

func _process(delta):
	if can_move:
		movimiento()
			
		motion.y += gravedad*delta
		motion = move_and_slide(motion, Vector2.UP)
		#move_and_collide(motion) 

func _next_to_left_wall():
	return $deteccion_izquqierda.is_colliding()

func _next_to_right_wall():
	return $deteccion_derecha.is_colliding()

func _floor_detection():
	return $deteccion_suelo.is_colliding()
func _flor_detection2():
	return $deteccion_suelo2.is_colliding()

func movimiento():
	if direccion == 1:
		$AnimatedSprite.flip_h = true
	else:
		$AnimatedSprite.flip_h = false
	if _next_to_right_wall() or _next_to_left_wall() or _floor_detection() or _flor_detection2():
		direccion *=-1
		$deteccion_suelo.scale.x*=-1
	
	motion.x = velocidad*direccion 
	
	if damage and llamadas_morir==0:
		llamadas_morir+=1
		$AnimatedSprite.play("moricion")
		$golpe.play(0)
		velocidad = 0
		yield(get_tree().create_timer(0.6), "timeout")
		queue_free()

func _on_Area2D_body_entered(body): #-----daño al jugador (objeto enyrando al area)
	if(body.get_name()=="player"):
		if(Global.powerup != "nada"):
			body.lose_powerup(Global.powerup) #--solo quitar el powerup en caso de tenerlo.
			body.herida()
		else:                   #--- daño al jugador
			Global.salud -= 20
			body.herida()

	elif(body.get_name()=="player2"):
		Global.vidas_j2 -=1
		body.herida()
	
	elif(body.get_name()=="caramelito_p"):
		body.explosion()
		damage = true

func _on_Area2D_body_exited(body):
	if(body.get_name()=="player" or body.get_name()=="player2"):
		$golpe.stop()


func _on_hitboxArea_body_entered(body):
	if(body.get_name()=="player"): #-------------dañar al mob
		body.salto_player()
		damage = true
	elif(body.get_name()=="player2"):
		body.salto_player()
		damage = true
	elif(body.get_name()=="caramelito_p"): #-- proyectil
		body.explosion()
		damage = true



