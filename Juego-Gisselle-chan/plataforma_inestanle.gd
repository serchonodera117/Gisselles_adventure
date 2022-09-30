extends Node2D

onready var timerI = $TimerI  #timer para rotación y compostura izquierda
onready var timerD = $TimerD

onready var timerI_B = $TimerI_B  #timer para rotación y compostura derecha
onready var timerD_B = $TimerD_B
var tiempo = 0.1
var grados_inclinacion = 2

func iniciar_rotacionI():            #---------------rotación y compostura de la inclinación izquierda. 
	timerI.wait_time = tiempo
	timerI.start()
	timerI.connect("timeout", self, "rotarI")
	#print("Iniciando inclinación I")

func iniciar_composturaI():
	timerD.wait_time = tiempo
	timerD.start()
	timerD.connect("timeout", self, "composturaI")
	#print("Iniciando compostura I")

func rotarI():                            #--- inclinarse a la izquierad
	#print("inclinación I: " + String($plataforma_fragil.rotation_degrees))	
	if($plataforma_fragil.rotation_degrees > -90):
		$plataforma_fragil.rotation_degrees -= grados_inclinacion
	else:
		timerI.stop()
		
	
func composturaI():                            #--volver a la inclinación inicial
	#print("compostura I: " + String($plataforma_fragil.rotation_degrees))		
	if($plataforma_fragil.rotation_degrees < 0):
		$plataforma_fragil.rotation_degrees += grados_inclinacion
	else:
		timerD.stop()

func _on_izquierda_body_entered(body):
	timerD.stop()
	iniciar_rotacionI()

func _on_izquierda_body_exited(body):
	#print("untoutch platform")
	timerI.stop()
	iniciar_composturaI()

					  #------------------------ inclinación y compostura de la parte derecha. 
func iniciar_rotacionD():
	timerI_B.wait_time = tiempo
	timerI_B.start()
	timerI_B.connect("timeout", self, "rotarD")
	#print("Iniciando inclinación D")

func iniciar_composturaD():
	timerD_B.wait_time = tiempo
	timerD_B.start()
	timerD_B.connect("timeout", self, "composturaD")
	#print("Iniciando compostura D")

func rotarD():
	#print("inclinación D: " + String($plataforma_fragil.rotation_degrees))	
	if($plataforma_fragil.rotation_degrees < 90):
		$plataforma_fragil.rotation_degrees += grados_inclinacion
	else:
		timerI_B.stop()

func composturaD():
	#print("compostura D: " + String($plataforma_fragil.rotation_degrees))		
	if($plataforma_fragil.rotation_degrees > 0):
		$plataforma_fragil.rotation_degrees -= grados_inclinacion	
	else:
		timerD_B.stop()


func _on_derecha_body_entered(body):
	timerD_B.stop()
	iniciar_rotacionD()

func _on_derecha_body_exited(body):
	#print("untoutch platform")
	timerI_B.stop()
	iniciar_composturaD()
