extends Node
								#--- Nombre del archivo de guardado. 
var nombre_guardado= "user://save_game.save" 
var new_obj
			 #---- función para guardar partida
func save_game():
	var save_file = File.new()
	save_file.open(nombre_guardado, File.WRITE)
	var saved = Global.get_save_status()
	save_file.store_line(to_json(saved))




	  #--- función para cargar partida
func load_game():
	var archivo_guardado = File.new()
	if not archivo_guardado.file_exists(nombre_guardado):
		return
	
						 #--- lectura del archivo guardado existente.
	archivo_guardado.open(nombre_guardado, File.READ)
	
	while archivo_guardado.get_position() < archivo_guardado.get_len():
		var node_data = parse_json(archivo_guardado.get_line()) #--- se guarda el nodo en json
		Global.load_save_stats(node_data)
		 


