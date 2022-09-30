extends Node

#----- vidas del jugador
var mapa_nombre = "casa_gisselle"
var salud = 100
var vidas_j1 = 5
var vidas_j2 = 5
var nivel_actual = 0
var puntos = 0
var pts_volatiles = 0  #puntos de nivel, si se pierde se restan a los acumulados. 
var escena_player = "res://Mapa_Casa_Gisselle/casa_gisselle.tscn" #--default

#-----powerups
var powerup = "nada" #"caramelo", "volar", "espada", besos.
func get_save_status():
	return {
		'filename': get_filename(), #nombre del archivo
		'vidas': vidas_j1,
		'nivel': nivel_actual,
		'puntos': puntos,
		'salud': salud,
		'escena': escena_player
	}
	
func load_save_stats(stats):  #---recargar atributos guardados
	vidas_j1 = stats.vidas
	nivel_actual = stats.nivel
	puntos = stats.puntos
	salud = stats.salud
	escena_player =  stats.escena

 
				   #---- modo de juego (plataforma, rpg) 
var gameplay = "rpg"

				  #---- ubicación del jugador
var ubicacion_j1 = "Casa de Gisselle"
				   #---- coordenadas de gisselle en casa
var cor_houseX = -91
var cor_houseY = 180

				 #---- coordenadas del mapa
var cor_mapX = 56.5
var cor_mapY = 126.5

#---- coordenadas de la escuela
var cor_escX = 1193  
var cor_escY = 1365

#--- volumen de la musica.
var volumen_musica = -10
var volumen_efectos = -10

#--- npc valores
var velocidad_npc = 3
var damage_value = 10


#---mapa
var mapaUbicacion="casa_gisselle" #"ciudad", "casa_gisselle", "escuela", "nivel_N"(1,2,3...)
var mapaActivo=false
#---pause
var pausando=false
