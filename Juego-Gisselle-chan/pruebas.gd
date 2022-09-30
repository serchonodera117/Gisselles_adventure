extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.gameplay="plataforma"


#func _on_Button_pressed():
	#generar_bomba()

func generar_bomba():
	var x = preload("res://juego/bomba.tscn").instance()
	x.position.x=170
	x.position.y=-225
	add_child(x)
