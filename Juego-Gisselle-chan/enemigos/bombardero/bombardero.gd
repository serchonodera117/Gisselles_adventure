extends Node2D



export var durationInactive:float = 2

export var mover_a: Vector2
export var cell:Vector2
export var velocidadPlataform: float = 3.0

var seguir:Vector2 = Vector2.ZERO
onready var transportador = $bombardero
onready var miTween = $Tween

func _ready():
	iniciar_tween()

func _physics_process(delta):
	transportador.position = seguir

func iniciar_tween():
	mover_a *= cell
	var duration = mover_a.length()/velocidadPlataform 
	
	miTween.interpolate_property(self, "seguir", Vector2.ZERO, mover_a, duration, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT, durationInactive)
	miTween.interpolate_property(self, "seguir", mover_a, Vector2.ZERO, duration,Tween.TRANS_LINEAR, Tween.EASE_IN_OUT, duration + durationInactive*2)
	miTween.start()

func _on_Tween_tween_completed(object, key):
	$bombardero/AnimatedSprite.play("drop") 
	var bomba = preload("res://juego/bomba.tscn").instance() #--- soltar bomba
	bomba.position.y = $bombardero.position.y + 10
	bomba.position.x = $bombardero.position.x
	add_child(bomba)


func _on_Tween_tween_started(object, key):
	$bombardero.scale.x *= -1
	$bombardero/AnimatedSprite.play("fly") # Replace with function body.


func _on_Area2D_body_entered(body):
	if(body.get_name() == "player"):
		if(Global.powerup != "nada"):
			body.lose_powerup(Global.powerup) #---solo quitar el powerup en caso de tenerlo.
			body.herida()
		else:
			Global.salud -=25
			body.herida()
	elif(body.get_name() == "caramelito_p"):
		$bombardero/AnimatedSprite/AnimationPlayer.play("die")
		yield(get_tree().create_timer(0.5), "timeout")
		queue_free()
