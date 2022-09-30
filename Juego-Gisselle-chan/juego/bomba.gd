extends KinematicBody2D

#var velocidad = 250
var gravedad = 70
var direccion = 3
var motion = Vector2(0,0)
var contadorRebote = 0

func _ready():
	$AnimatedSprite.play("droped")
	yield(get_tree().create_timer(0.7),"timeout")
	$AnimatedSprite.play("falling")
	

func _physics_process(delta):
	$AudioStreamPlayer.volume_db = Global.volumen_efectos
	check_fall()
	motion.y += gravedad * delta
	motion = move_and_slide(motion, Vector2(0,-1))

func check_fall():
	if(is_on_wall() or is_on_floor()):
		if(contadorRebote==0):
			explotar()


func explotar():
	contadorRebote+=1
	print("ejecuciones: "+String(contadorRebote))
	$AnimatedSprite.play("exploted")
	$AudioStreamPlayer.play()
	yield(get_tree().create_timer(1), "timeout")
	queue_free()


func _on_Area2D_body_entered(body):
	if(body.get_name() == "player"):
		yield(get_tree().create_timer(0.3), "timeout")
		if(Global.powerup != "nada"):
			body.lose_powerup(Global.powerup) #----solo quitar el powerup en caso de tenerlo.
		else:
			Global.salud -= 40
