extends Node2D

var dialogoGameOver =["Gisselle no se vio capaz de comenzar el día.",
"Mañana será otro día, otro día igual",
"[color=#FACDBE]Gisselle:[/color] . . .",
"Gisselle ha decido encerrarse el resto de su vida",
"[color=#FACDBE]Gisselle:[/color] Gracias por jugar. . ."
]
func _ready():
	$AudioStreamPlayer.volume_db = -15
	_cargar()
	
	$caja_dialogos/Control.ruta = "res://Menu/menu.tscn"
	$caja_dialogos/Control.dialog = dialogoGameOver
	
	$caja_dialogos/Control/RichTextLabel.bbcode_text = ""
	$caja_dialogos/Control.cargar_dialogo(dialogoGameOver, "res://Menu/menu.tscn", true)
	
	

func _cargar():
	$RichTextLabel.percent_visible = 0 
	$Tween.interpolate_property($RichTextLabel, "percent_visible",0,1,1,
	Tween.TRANS_BACK,Tween.EASE_IN)
	$Tween.start()


func _on_salir_pressed(): 
	get_tree().change_scene("res://Menu/menu.tscn")
