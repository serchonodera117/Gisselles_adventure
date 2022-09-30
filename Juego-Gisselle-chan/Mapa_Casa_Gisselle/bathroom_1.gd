extends Node2D

var dialogo_bathroom = ["[color=#FACDBE]Gisselle (pensamiento): [/color] Hoy será el día. . . ",
"[color=#FACDBE]Gisselle (pensamiento):[/color] Mundo cerrado heridas abiertas",
"[color=#FACDBE]Gisselle:[/color] Hhhh. . ."]

func _ready():
	$caja_dialogos/Control.ruta =  "res://Mapa_Casa_Gisselle/casa_gisselle.tscn"
	$caja_dialogos/Control.dialog = dialogo_bathroom
	$caja_dialogos/Control.cambio = false
	
	$caja_dialogos/Control.cargar_dialogo(dialogo_bathroom, "res://Mapa_Casa_Gisselle/casa_gisselle.tscn", false)


func _on_TextureButton_pressed():
	Global.cor_houseX = 317
	Global.cor_houseY = 178
	get_tree().change_scene("res://Mapa_Casa_Gisselle/casa_gisselle.tscn")
	

func _input(event):
	if(Input.is_action_just_pressed("cerrar_pausa")):
		Global.cor_houseX = 317
		Global.cor_houseY = 178
		get_tree().change_scene("res://Mapa_Casa_Gisselle/casa_gisselle.tscn")
		
