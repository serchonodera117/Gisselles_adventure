extends Node2D
func _ready():
	$recoleccion.volume_db = Global.volumen_efectos

func _process(delta):
	$recoleccion.volume_db = Global.volumen_efectos

func _on_Area2D_body_entered(body):
	if(body.get_name() == "player" or body.get_name() == "player2"):
		Global.puntos += 1
		Global.pts_volatiles += 1
		$recoleccion.play()
		$AnimatedSprite.play("taken")
		body.crearIndicador("uno")
		yield(get_tree().create_timer(0.3),"timeout")
		$recoleccion.stop()
		queue_free()
