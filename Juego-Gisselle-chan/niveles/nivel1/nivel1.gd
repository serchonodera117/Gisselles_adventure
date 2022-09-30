extends Node2D


# Declare member variables here. Examples:
# var b = "text"
var jefeindex = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	Global.ubicacion_j1 = "¿QUE HAGO AQUI?"
	Global.gameplay = "plataforma"
	Global.nivel_actual = 0
	$player.controles_plataforma()
	$player/Camera2D.position.y = -30
	$player/Camera2D.position.x = 50
	Global.escena_player = "res://niveles/nivel1/nivel1.tscn"

func _process(delta):
	$musica.volume_db = Global.volumen_musica


func _on_Area2D_body_entered(body):
	if(body.get_name()=="player"):
		Global.salud = 0
	elif(body.get_name()=="jefe_1"):
		body.desaparecer()


func _on_activar_jefe_body_entered(body):
	if(body.get_name()== "player" and jefeindex == 0):
		$player/AnimationPlayer.play("corners")
		print("jefe apareciendo   index:", jefeindex)
		Global.ubicacion_j1 = "¿QUE ES ESA COSA?"
		var boss = preload("res://enemigos/jefe_1/jefe_1.tscn").instance()
		boss.scale.x = 8
		boss.scale.y = 8
		boss.position.x = 6332
		boss.position.y = 200
		yield(get_tree().create_timer(2),"timeout")
		add_child(boss)
		jefeindex += 1
	elif(body.get_name() =="jefe_1"):
		Global.ubicacion_j1 = "HUYE"
		



func _on_activar_jefe_body_exited(body):
	if(body.get_name()== "player" and jefeindex == 1):
		jefeindex += 1
		$player/AnimationPlayer.play("remove_corners")


func _on_final_body_entered(body):                    #---efectos del final
	if(body.get_name()=="player"):
		body.velocidad = 0
		body.salto = false
		yield(get_tree().create_timer(2),"timeout")
		$player/AnimationPlayer.play("corners")		
		body.nervios_inicio()
		$mano.activar = true
		AudioServer.add_bus_effect(0, AudioEffectLowPassFilter.new(), 1)
		AudioServer.add_bus_effect(0, AudioEffectReverb.new(), 1)


func _on_mano_body_entered(body):                #--------- mano
	if(body.get_name()=="player"):
		body.nervios_final()
		$player/GUI.cambio_reproducir("res://Cinematicas/cinematica_end_lvl1.tscn")
		AudioServer.remove_bus_effect(0, 1)
		AudioServer.remove_bus_effect(0, 1)



func _on_muro_lvl_body_entered(body):
	if(body.get_name()=="player"):
		Global.ubicacion_j1 = "necesitas 10 monedas"
		
