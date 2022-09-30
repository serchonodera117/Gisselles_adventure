extends KinematicBody2D

export var velocidad = 3;
export var gravedad = 100
export var salto = 30

var direccion = Vector2(0,0);


var nivel_actual = 0
var vidas = 1
var puntos = 5

var es_jugable = false
func _physics_process(delta):
	if(Global.gameplay == "rpg"):
		if es_jugable:
			mover()
			move_and_collide(direccion)
		animar()
	else:
		mover_p()
		animar_p()
	
		gravedad = 1300
		direccion.y += gravedad * delta
		direccion = move_and_slide(direccion, Vector2.UP)

	if(Global.vidas_j2 < 1):
		queue_free()

func mover():
	if Input.is_action_pressed("p2_marriba"):
		direccion.y = -velocidad
		direccion.x = 0
	elif Input.is_action_pressed("p2_mabajo"):
		direccion.y = velocidad
		direccion.x = 0
	elif Input.is_action_pressed("p2_mderecha"):
		direccion.x = -velocidad
		direccion.y=0
	elif Input.is_action_pressed("p2_mizquierda"):
		direccion.x = velocidad
		direccion.y=0
	else:
	   direccion.x = 0
	   direccion.y = 0 
	
func animar():
	if direccion.x>0:
		$kayolica_animaciones.flip_h=false
		$kayolica_animaciones.play("Kayolica_move")
	elif direccion.x<0:
		$kayolica_animaciones.flip_h=true
		$kayolica_animaciones.play("Kayolica_move")
	elif direccion.y<0:
		$kayolica_animaciones.flip_h=false
		$kayolica_animaciones.play("Kayolica_mup")
	elif direccion.y>0:
		$kayolica_animaciones.flip_h=false
		$kayolica_animaciones.play("Kayolica_mdown")
	else:
		$kayolica_animaciones.flip_h=false
		$kayolica_animaciones.play("kayolica_idle") 

func mover_p():
	if Input.is_action_pressed("p2_mderecha"):
		direccion.x = -velocidad*50
	elif Input.is_action_pressed("p2_mizquierda"):
		direccion.x = velocidad*50
	else:
		direccion.x = 0

				 #---- salto
func _input(event):
	if Input.is_action_just_pressed("p2_marriba"):
		if is_on_floor():
			direccion.y = -650
func herida():
	$golpe.play()
	$kayolica_animaciones.modulate = "ff7676"
	direccion.y = -500
	

func salto_player():
	direccion.y = -500

func animar_p():
	if(is_on_floor()):
		$golpe.stop()
		$kayolica_animaciones.modulate = "ffffff"
	
	if direccion.x>0 and is_on_floor():
		$kayolica_animaciones.flip_h=false
		$kayolica_animaciones.play("Kayolica_move")
	elif direccion.x<0 and is_on_floor():
		$kayolica_animaciones.flip_h=true
		$kayolica_animaciones.play("Kayolica_move")
	
	elif direccion.y<0:
		if(direccion.x > 0): $kayolica_animaciones.flip_h=false
		elif(direccion.x<0): $kayolica_animaciones.flip_h=true
		$kayolica_animaciones.play("Kayolica_salto")
		
	else:
		if is_on_floor():
			$kayolica_animaciones.flip_h=false
			$kayolica_animaciones.play("kayolica_idle") 



