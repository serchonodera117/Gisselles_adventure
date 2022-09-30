extends KinematicBody2D


onready var gravedad = 1300
onready var can_move = true
onready var direccion = 1
var motion = Vector2(0,0)
var velocidad = 250
onready var timer = $Timer

func _ready():
	crearTimer()

func _physics_process(delta):
	#movimiento()
	detection_jump()
	motion.y += gravedad*delta
	motion = move_and_slide(motion, Vector2.UP)
	#move_and_collide(motion) 

func detection_jump():           #--- saltar cuando se detecta una pared o un proyectil
	if(($jump_wall.is_colliding() or $jump_wall2.is_colliding())and is_on_floor()):
		motion.y = -600
		motion.x = 200*direccion

func crearTimer():
	timer.wait_time = 1
	timer.start()                           #---- movimiento 
	timer.connect("timeout", self, "movimiento")

func movimiento():
	motion.x = velocidad*direccion
	yield(get_tree().create_timer(0.5), "timeout")
	motion.x = 0

func desaparecer():
	print("jefe borrado")
	queue_free()

func _on_Area2D_body_entered(body):  #--- daño al jugador 
	if(body.get_name() == "player"):
		$AnimatedSprite.play("defending")
		if(Global.powerup != "nada"):
			body.lose_powerup(Global.powerup) #---solo quitar el powerup en caso de tenerlo.
			body.herida()
		else:
			Global.salud -= 50
			body.herida()
		yield(get_tree().create_timer(0.5),"timeout")
		$AnimatedSprite.play("default")
		
	elif(body.get_name() == "caramelito_p"):
		$AnimatedSprite.play("defending")
		yield(get_tree().create_timer(0.5),"timeout")
		$AnimatedSprite.play("default")


func _on_detection_right_body_entered(body):
	if(body.get_name() == "player" and direccion == -1):
		direccion = 1
		$Area2D/CollisionShape2D.position.x = 39
		$TileMap.scale.x *= -1
		$TileMap2.scale.x *= -1
		$AnimatedSprite.flip_h = false
		
		#body.get_tree("GUI").nervios_inicio()


func _on_detection_left_body_entered(body):
	if(body.get_name() == "player" and direccion == 1):
		direccion = -1
		$Area2D/CollisionShape2D.position.x = 9
		$TileMap.scale.x *= -1
		$TileMap2.scale.x *= -1
		$AnimatedSprite.flip_h = true
