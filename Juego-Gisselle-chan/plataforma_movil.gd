extends Node2D

export var durationInactive:float = 1.2

export var mover_a: Vector2
export var cell:Vector2
export var velocidadPlataform: float = 3.0

var seguir:Vector2 = Vector2.ZERO
onready var transportador = $KinematicBody2D
onready var miTween = $Moving_tween

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
