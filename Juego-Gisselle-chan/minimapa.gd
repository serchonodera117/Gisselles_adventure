extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$ViewportContainer/Viewport/mapa_ciudad/suelo/Caminos_tierra/player/Camera2D.zoom=Vector2(10,10)
	$ViewportContainer/Viewport/mapa_ciudad/suelo/Caminos_tierra/player.velocidad=3
	$ViewportContainer/Viewport/mapa_ciudad/suelo/Caminos_tierra/player.esMinimapa = true


