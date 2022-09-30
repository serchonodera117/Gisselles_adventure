extends Node2D


var dialogo = ["[color=#FACDBE]Gisselle:[/color] Si pienso que debería volar. . ", 
"[color=#FACDBE]Gisselle:[/color] y en lugar de hacerlo me arrastro. . .  solo puedo deprimirme",
"[color=#FACDBE]Gisselle:[/color] Pensamiento feliz...","[color=#FACDBE]Gisselle:[/color] pensamiento feliz", 
"[color=#FACDBE]Gisselle:[/color] Hoy será mi primer día", "[color=#FACDBE]Gisselle:[/color] mi. . . hhh",
"Antes de abrir la puerta, la mente de Gisselle es un caos"]

var index = 0
func _ready():
	$intro.volume_db = Global.volumen_musica
	$latidos.volume_db = Global.volumen_musica
	
	$caja_dialogos/Control.ruta = "res://niveles/nivel1/nivel1.tscn"
	$caja_dialogos/Control.dialog = dialogo
	#$caja_dialogos/Control.
	
	$caja_dialogos/Control/RichTextLabel.bbcode_text = ""
	$caja_dialogos/Control.cargar_dialogo(dialogo, "res://niveles/nivel1/nivel1.tscn", true)
	

func _process(delta):
		$intro.volume_db = Global.volumen_musica
		$latidos.volume_db = Global.volumen_musica

func _input(event):
	if(Input.is_action_just_pressed("ui_accept") or $caja_dialogos/Control/boton_texto.pressed):
		index+=1
		#print(index)
		if(index == 3):
			$latidos.play()
