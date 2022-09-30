extends KinematicBody2D

var dir= Vector2(0,0)
var mY = -70
var mX = -50

onready var myt = $Timer

func _ready():
	initDestruction()


func _physics_process(delta):
	mv()
	dir.y += mY * delta
	dir = move_and_slide(dir, Vector2.UP)

func mv():
	dir.x = mX*3


func initDestruction():
	myt.wait_time=0.5
	myt.start()
	myt.connect("timeout", self, "destruir")

func animIndicador(tipo):
	$anim.play(tipo)

func destruir():
	queue_free()
