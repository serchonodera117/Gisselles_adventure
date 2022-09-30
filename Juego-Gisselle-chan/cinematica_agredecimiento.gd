extends Node2D

var dialogo = ["el miedo y la ansiedad conducen a una abstención que puede alterar su vida. El estrés grave puede afectar tus relaciones, la rutina diaria, el trabajo, la escuela u otras actividades.",
"El trastorno de ansiedad social puede ser una afección crónica de salud mental, pero aprender la capacidad de afrontar en psicoterapia y tomar medicamentos pueden ayudarte a ganar confianza y mejorar tu capacidad para interactuar con otros.",
"Los sintomas que caracterízan el trastorno son: Temor intenso de interactuar con extraños, miedo intenso durante las situaciones sociales, enrojecimiento, latidos rápidos del corazón, dificultad para respirar, sudoración, temblores etc.",
"Es importante recordar que el hecho de que una persona  no pueda comunicarse, no quiere decir que no quiera hacerlo. Las consecuencias de este trastorno pueden ser desastrosas",
"si conoces a alguien con dicha sintomatología, un simple saludo puede comenzar a ser la diferencia. . . se paciente.",
"[color=#FACDBE]Gisselle:[/color] e. . . mm . . . ¿Hola?",
"[color=#FACDBE]Gisselle:[/color] Esto ha sido una versión beta, realmente me disculpo en el caso de haber encontrado bugs, . . . solo puedo decir. . .",
"[color=#FACDBE]Gisselle:[/color] ¡Muchas gracias por jugar!"
]
var i = 0
func _ready():
	if(Global.nivel_actual == 1):
			Global.nivel_actual +=1
			Guardar.save_game()
	
	$caja_dialogos/Control.ruta = "res://Menu/menu.tscn"
	$caja_dialogos/Control.dialog = dialogo
	$caja_dialogos/Control.cambio = true
	
	$caja_dialogos/Control.cargar_dialogo(dialogo, "res://Menu/menu.tscn", true)


func _input(event):
	if(Input.is_action_just_pressed("ui_accept") or $caja_dialogos/Control/boton_texto.pressed):
		i +=1
		if(i==5):
			$Sprite/AnimationPlayer.play("g")
		if(i == 7):
			$Sprite.play("despedida")
			
