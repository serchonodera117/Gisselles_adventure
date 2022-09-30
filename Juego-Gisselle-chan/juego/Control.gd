extends Control

var indiceDialogo = 0
var dialogSpeed = 0.02
var visibleButtom = false
var destruir = false
onready var dialog = ["wrong execution"]
var ruta = "res://Menu/menu.tscn"
var cambio = true

func _process(delta):
	$boton_texto.visible = visibleButtom
	if Input.is_action_just_pressed("ui_accept"):
		#yield(get_tree().create_timer(3),"timeout")
		cargar_dialogo(dialog, ruta, cambio)


func cargar_dialogo(dialogo, ruta, cambioEscena):
	if indiceDialogo < dialogo.size():
		visibleButtom = false
		var velocidad_Texto = dialogSpeed * dialogo[indiceDialogo].length()
		$RichTextLabel.bbcode_text = dialogo[indiceDialogo]
		$RichTextLabel.percent_visible = 0
		$Tween.interpolate_property(
			$RichTextLabel, "percent_visible", 0, 1, velocidad_Texto,
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
		)
		$Tween.start()
	else: 
		#visible = false
		indiceDialogo = 0
		destruirCaja()
		
		if(cambioEscena):
			 get_tree().change_scene(ruta)
	indiceDialogo += 1

func _on_Tween_tween_all_completed():
	visibleButtom = true

func _on_boton_texto_pressed():
	cargar_dialogo(dialog, ruta, cambio)

func destruirCaja():
	destruir = true
	#queue_free()
