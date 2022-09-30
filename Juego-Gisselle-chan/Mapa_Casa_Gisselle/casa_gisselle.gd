extends Node2D

# Declare member variables here. Examples:

onready var posicionX = Global.cor_houseX
onready var posicionY = Global.cor_houseY

onready var minMap=preload("res://minimapa/minimapa.tscn")
var mm


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.gameplay = "rpg"
	Global.mapaUbicacion="casa_gisselle"
	$fondo/player.controles_rpg()
	Global.mapa_nombre = "casa_gisselle"
	$AudioStreamPlayer.volume_db = Global.volumen_musica
	$fondo/player.position.x = posicionX
	$fondo/player.position.y = posicionY
	Global.ubicacion_j1 = "Casa de Gisselle"
	Global.escena_player = "res://Mapa_Casa_Gisselle/casa_gisselle.tscn"
func _process(delta):
		$AudioStreamPlayer.volume_db = Global.volumen_musica

func set_mm():
	mm=minMap.instance()
	$fondo/player/Camera2D.add_child(mm)
	mm.position=Vector2(-480,-275)

								   #---salir de casa
func _on_Area2D_body_entered(body):
	$fondo/player/GUI.cambio_reproducir("res://juego/juego.tscn")
	$AudioStreamPlayer.stop()
	Global.cor_mapX = 56.5
	Global.cor_mapY = 126.5
	Global.ubicacion_j1 = "Region Kanto"

											 #T----tirarse en la cama
func _on_cama_gisselle_body_entered(body):
	if (body.get_name() == "player"):
		$fondo/Paredes/Sprite/AnimatedSprite.visible = true
		$fondo/player.visible = false
		$fondo/player.iniciarTemporizador()#trmpotizador para curarse
		

func _on_cama_gisselle_body_exited(body):
	$fondo/Paredes/Sprite/AnimatedSprite.visible = false
	$fondo/player.visible = true


func _on_mirror_1_body_entered(body):
	$AudioStreamPlayer.stop()
	get_tree().change_scene("res://Mapa_Casa_Gisselle/bathroom_1.tscn")


func _on_mirror_2_body_entered(body):
	$AudioStreamPlayer.stop()
	get_tree().change_scene("res://Mapa_Casa_Gisselle/bathroom_2.tscn")
