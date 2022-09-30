extends Node2D

onready var btn1 = $VBoxContainer/jugar

func _ready():
	btn1.grab_focus()

	Guardar.load_game()
# Called when the node enters the scene tree for the first time.
func _process(delta):
	$AudioStreamPlayer.volume_db = Global.volumen_musica

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass




func _on_jugar_pressed(): #cargar la cinematica e3l inicio, o directamente la escena guardada
	if(Global.nivel_actual > 0):
		get_tree().change_scene(Global.escena_player)
	else:
		get_tree().change_scene("res://Cinematicas/inicio_introduccion.tscn")


func _on_salir_pressed():
	get_tree().quit()


func _on_opciones_pressed():
	$CanvasLayer/las_opciones.visible = true


func _on_Button_pressed():
	$CanvasLayer/las_opciones.visible = false


func _on_HSlider_value_changed(value):
	Global.volumen_musica = value
	


func _on_HSlider2_value_changed(value):
	Global.volumen_efectos = value




func _on_controles_pressed():
	get_tree().change_scene("res://Menu/controles.tscn")


func _on_creditos_pressed():
	get_tree().change_scene("res://Menu/Creditos.tscn")
