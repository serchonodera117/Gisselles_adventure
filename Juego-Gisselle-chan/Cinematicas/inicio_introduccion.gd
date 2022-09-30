extends Node2D

onready var dialogo_introduccion=["La aprensión comunicativa es una condición donde una persona tiene problemas para comunicarse con los demás",
"En casos extremos, este problema puede afectar la vida social de uno hasta llevarlo a caminos desastrosos",
"Pero lo más importante que debemos recordar es...",
"El hecho de que una persona tenga problemas para comunicarse, no quiere decir que esa persona no quiera comunicarse con otros..."]


func _ready():
	$caja_dialogos/Control.ruta = "res://Mapa_Casa_Gisselle/casa_gisselle.tscn"
	$Sprite/AnimatedSprite.play("cargaTitulo")
	$caja_dialogos/Control.dialog = dialogo_introduccion
	#$caja_dialogos/Control.
	
	$caja_dialogos/Control/RichTextLabel.bbcode_text = ""
	$caja_dialogos/Control.cargar_dialogo(dialogo_introduccion, "res://Mapa_Casa_Gisselle/casa_gisselle.tscn", true)
	yield(get_tree().create_timer(4),"timeout")
	$Label/AnimatedSprite2.play("c_a")

