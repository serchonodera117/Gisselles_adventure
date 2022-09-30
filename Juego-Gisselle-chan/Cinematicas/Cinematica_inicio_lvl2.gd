extends Node2D


var dialogo_cinematica = ["El trastorno de ansiedad es una condición donde una persona tiene problemas para comunicarse, en casos extremos puede afectar terriblemente la vida de una persona. . .",
							"¿Y si el sufriemiento llega al límite?", 
							"[color=#FACDBE]Gisselle:[/color] . . .",
							"[color=#FACDBE]Gisselle:[/color]  hmph b-  b- buenos. . .",
							"[color=#FACDBE]Profesora:[/color] Ha llegado tarde señorita",
							"[color=#FACDBE]Profesora:[/color] Tome asiento. ¡entre!, está reportada, deme su nombre",
							"[color=#FACDBE]Gisselle:[/color]  ehm no. . . yo. . . eh, soy , yo so-lo  hhhh",
							"[color=#FACDBE]Profesora:[/color] No entiendo lo que dice",
							"[color=#FACDBE]Profesora:[/color] En mi clase hable Fuerte y claro",
							"[color=#FACDBE]Profesora:[/color] Dejese de juegos!",
							"[color=#FACDBE]Gisselle:[/color]  h h hh",
							"[color=#FACDBE]Profesora:[/color] ¿En serio vas a llorar por eso?",
							"[color=#FACDBE]Gisselle:[/color] ahh h hhah . . .  hhahh",
							"[color=#FACDBE]Gisselle (Pensamiento):[/color] ¿Dónde está Kayolica?",
							"[color=#FACDBE]Gisselle (Pensamiento): [/color] ¿Dónde? ¿Dónde? ¿Dónde? ¿Dónde? ¿Dónde? ¿Dónde? ¿Dónde? ¿Dónde? ¿Dónde? ¿Dónde? ¿Dónde? ¿Dónde? ¿Dónde? ¿Dónde? ¿Dónde? ¿Dónde? ¿Dónde? ¿Dónde? ¿Dónde? ¿Dónde? ¿Dónde? ¿Dónde?",
							"¿Y si el sufrimeinto de la persona llega al límite?",
							"Ellos tendrán que lidiar con sus emociones por si solos.   .   ."]
var anim =["g-basic",
			"g-inicio-a",
			"g-regazo",
			"g-inicio-crying",
			"g-crying",
			"g-red-crying"]
var animation_index = 0
func _ready():
	$bg_theme.volume_db = Global.volumen_musica
	$latidos.volume_db = Global.volumen_efectos
	
	$caja_dialogos/Control.ruta =  "res://Mapa_Casa_Gisselle/casa_gisselle.tscn"
	$caja_dialogos/Control.dialog = dialogo_cinematica
	$caja_dialogos/Control.cambio = true
	$caja_dialogos/Control.cargar_dialogo(dialogo_cinematica, "res://Mapa_Casa_Gisselle/casa_gisselle.tscn", true)
	pass # Replace with function body.


func _input(event):
	if(Input.is_action_just_pressed("ui_accept") or$caja_dialogos/Control/boton_texto.pressed):
		animation_index +=1
		
		if(animation_index==2):
			$fondo/inicio_aula/AnimationPlayer.play("mostrar_clase1")
		if(animation_index==3):
			$gisselle/AnimationPlayer.play("show_gisselle")
		if(animation_index==6):
			$gisselle.play(anim[1])
			$latidos.play()
		if(animation_index==10):
			$gisselle.play(anim[3])
			$nervous.play(1)
		
		
		if((animation_index==4 or animation_index==5) or 
		   (animation_index>=7 and animation_index < 10) or
			(animation_index==11 or animation_index>=15)): #control de visibilidad
			hide_items()
		else: show_items()
		
		if(animation_index==12):
			$gisselle.play(anim[3])
			yield(get_tree().create_timer(1.5), "timeout")
			$proyector.play()
			$reflector.visible = true
			$gisselle.play(anim[4])
		if(animation_index==13):
			$gisselle.play(anim[5])
		if(animation_index==15):
			$reflector.visible=false
		if(animation_index==16):
			$latidos.stop()
			$nervous.stop()
			$bg_theme.stop()

func hide_items():
	$gisselle.visible = false
	$fondo/inicio_aula.visible = false


func show_items():
	$gisselle.visible = true
	$fondo/inicio_aula.visible = true
