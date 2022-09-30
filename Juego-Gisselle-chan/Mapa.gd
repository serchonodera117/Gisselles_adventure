extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	cargarMapa(Global.mapaUbicacion)

func cargarMapa(tipo):
	var mapa
	setMarkers(tipo)
	if(tipo=="ciudad"): 
		mapa=preload("res://Assets/mapas/mapa_observable.png")
	elif(tipo=="casa_gisselle"):
		 mapa=preload("res://Assets/mapas/mapa_casa_giselle.PNG")
	elif(tipo=="escuela"):
		$indicadores/escuela/target_kayolica.visible=true
		mapa=preload("res://Assets/mapas/mapa_escuela.png")
	$mapa.texture = mapa
	

func _on_TextureButton_pressed():
	cerrar()

func _input(event):
	if(Input.is_action_just_pressed("cerrar_pausa")):
		cerrar()
func cerrar():
	$cerrar.modulate="#79ff1d"
	Global.mapaActivo=false
	queue_free()


func setMarkers(tipo):
	if(tipo=="ciudad"): 
		$indicadores/ciudad/gisselle_house.visible=true
		$indicadores/ciudad/preparatoria.visible=true
		if(Global.nivel_actual==4):
			$indicadores/ciudad/kayolica_home.visible=true
	elif(tipo=="escuela"):
		$indicadores/escuela/target_kayolica.visible=true
