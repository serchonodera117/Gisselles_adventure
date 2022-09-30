extends Node2D

func _ready():
	Global.gameplay = "rpg"
	Global.mapaUbicacion="escuela"
	$base_fondo/suelo/player.controles_rpg()
	Global.ubicacion_j1 = "FACULTAD DE TELEMATICA"
	$rola.volume_db = Global.volumen_musica
	$base_fondo/suelo/player.position.x = Global.cor_escX
	$base_fondo/suelo/player.position.y = Global.cor_escY
	Global.escena_player = "res://Mapa_escuela/Mapa_escuela.tscn"
func _process(delta):
	$rola.volume_db = Global.volumen_musica	



func _on_Area2D_body_entered(body):
	if(body.get_name()=="player"):
		$rola.stop()
		$base_fondo/suelo/player/GUI.cambio_reproducir("res://juego/juego.tscn")
		Global.ubicacion_j1 = "Ciudad B"
		Global.cor_mapX = 2867
		Global.cor_mapY = 249


func _on_kayolica_body_entered(body):
	if(body.get_name() == "player"):
		$rola.stop()
		$base_fondo/suelo/player/GUI.cambio_reproducir("res://Cinematicas/cinematica_agredecimiento.tscn")
