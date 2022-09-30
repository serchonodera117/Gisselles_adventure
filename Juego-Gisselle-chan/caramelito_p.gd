extends KinematicBody2D


var velocidad = 250
var gravedad = 1300
var direccion = 3
var motion = Vector2(0,0)
var contadorRebote = 0
var callF=0

func _physics_process(delta):
	$candy_broke.volume_db = Global.volumen_efectos
	movimiento()
	
	motion.y += gravedad * delta
	motion = move_and_slide(motion, Vector2.UP)

func movimiento():
	motion.x = velocidad*direccion
	if(is_on_wall()):
		if(callF==0):
			callF+=1
			destruirCaramelo()         
	if (is_on_floor()):
		motion.y = -500
		contadorRebote+=1
		rotation_degrees = 90*direccion
		#print("rebotes:", contadorRebote)
	if(contadorRebote >1):
		if(callF==0):
			callF+=1
			destruirCaramelo()

func explosion():
	$AnimatedSprite.play("destroid")
	yield(get_tree().create_timer(0.5), "timeout")
	queue_free()
	

func destruirCaramelo():
	$AnimatedSprite.play("destroid")
	$candy_broke.play()
	velocidad = 0
	yield(get_tree().create_timer(0.5), "timeout")
	$candy_broke.stop()
	queue_free()

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
