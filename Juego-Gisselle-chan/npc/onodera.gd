extends KinematicBody2D

var dialogo = ["[color=#FACDBE]Serch Onodera:[/color] El cielo está vacío de toda luz, player, no existe un paríso al cual esapar.", "."]


func _ready():
	$AnimatedSprite.play("ilde")

func _on_Area2D_body_entered(body):
	if(body.get_name() =="player"):
		body.cargarDialogo(dialogo, "ruta", false)



