extends Node2D


var dialogo = ["[color=#FACDBE]Gisselle:[/color] KYAAAAAAAA!!!!!!!",
"[color=#FACDBE]???:[/color] Estás bien?",
 "[color=#FACDBE]???:[/color] Ouh. aamm Hola. . .?, soy Kayolica. . ., Kayolica Sittadin. . .",
"[color=#FACDBE]Gisselle:[/color] . . .Ka   . . . yolica",
"[color=#FACDBE]Kayolica:[/color] Has llegado tarde también, ¿eh...?. Tranquila, haz como el tipo de las creepypastas y no le des mucha importancia",
"[color=#FACDBE]Gisselle:[/color] hmm. . . yo . . .",
"[color=#FACDBE]Gisselle:[/color] Mi . . . nombre es. . .",
"[color=#FACDBE]Gisselle:[/color] Gisselle,  Gisselle Braun Von Degüreschaff",
"[color=#FACDBE]Kayolica:[/color] Wow, ese nombre suena imponente, me agrada. . . hmm no hablas mucho verdad?",
"[color=#FACDBE]Gisselle:[/color] . . .",
"[color=#FACDBE]Kayolica:[/color] hmm ya veo. . .",
"[color=#FACDBE]Gisselle:[/color] lo siento",
"[color=#FACDBE]Kayolica (pensamiento):[/color] La voz de gisselle se quiebra cada que piensa en decir una palabra, se ve bastante tensa",
"[color=#FACDBE]Kayolica:[/color] Gisselle! Gisselle!",
"[color=#FACDBE]Kayolica:[/color] Seamos amigas!",
"[color=#FACDBE]Kayolica:[/color] Cuando sea receso, veamonos en la cafetería ¿sí?", 
 "Gisselle se queda pensando. . .,  solo quería que el día terminara lo antes posible."
]

var k_animations =["Kayolica_idle", "kayolica_think", "kayolica_smile", 
				   "kayolica_bl",  "kayolica_laugh", "kayolica_smile", 
				   "kayolica_smile", "kayolica_smile", "kayolica_think", 
				   "Kayolica_idle","kayolica_smile"]
var g_animations = ["scared", "post_scared", "post_scared", 
					 "hand_up", "idle", "post_scared", 
					"post_scared", "hand_up", "post_scared", 
					"hand_up","idle"]

var animation_index = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	$gisslle_grito.volume_db = Global.volumen_efectos
	$music.volume_db = Global.volumen_musica
	$gisslle_grito.play()
	$caja_dialogos/Control.ruta =  "res://Mapa_escuela/Mapa_escuela.tscn"
	$caja_dialogos/Control.dialog = dialogo
	$caja_dialogos/Control.cambio = true
	
	$caja_dialogos/Control.cargar_dialogo(dialogo, "res://Mapa_escuela/Mapa_escuela.tscn", true)
	Global.nivel_actual +=1 #de posicion 0 a 1, de nivel 1 a 2
	Guardar.save_game() #almacenamiento del progreso, nivel y vidas con las que se quedó el jugador

func _process(delta):
	$gisslle_grito.volume_db = Global.volumen_efectos
	$music.volume_db = Global.volumen_musica
	

func _input(event):
	if(Input.is_action_just_pressed("ui_accept") or $caja_dialogos/Control/boton_texto.pressed):
		animation_index+=1
		if(animation_index==16):
			$kayolica.scale.x = 0.38
			$kayolica.scale.y = 0.38
			$gisselle.scale.x = 0.38
			$gisselle.scale.y = 0.36
		
		if(animation_index < 11):  #poses de las waifus
			$gisselle.play(g_animations[animation_index])
			$kayolica.play(k_animations[animation_index])
		
		#dialogo de kayolica
		if(animation_index == 1 or animation_index == 2 
		  or animation_index == 4   or animation_index == 8 
		  or animation_index == 10  or animation_index > 11 and (animation_index < 17)):
			$kayolica.scale.x = 0.4
			$kayolica.scale.y = 0.4
			$gisselle.scale.x = 0.38
			$gisselle.scale.y = 0.36
		else:                          #dialogo de gisselle
			$kayolica.scale.x = 0.38
			$kayolica.scale.y = 0.38
			$gisselle.scale.x = 0.40
			$gisselle.scale.y = 0.38
