extends Node2D

onready var timer = $shadow/Timer
var segundos = 0

var velocidad = 25
export var direccion = 1
var motion = Vector2(0,0)

func _ready():
	iniciar_movimiento()

func iniciar_movimiento():
	timer.wait_time = 0.5
	timer.start()
	timer.connect("timeout", self, "mover")

func mover():
	if(direccion == 1):
		$shadow/AnimatedSprite.flip_h = false
	else:
		$shadow/AnimatedSprite.flip_h = true
	position.x +=  velocidad*direccion
	if(segundos>30):
		direccion *= -1
		segundos = 0
	segundos+=1

func _on_shadow_body_entered(body):
	if(body.get_name()=="player"):
		if(Global.powerup != "nada"):
			body.lose_powerup(Global.powerup) #---solo quitar el powerup en caso de tenerlo.
			body.herida()
		else:
			body.herida() #--- daño al player
			Global.salud -= 10
