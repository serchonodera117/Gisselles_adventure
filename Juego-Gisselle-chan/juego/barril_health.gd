extends Node2D




func _on_Area2D_body_entered(body):
	if(body.get_name()=="player"):
		if(Global.salud<100):
			Global.salud=100
			body.crearIndicador("100")
			$AnimatedSprite.play("collect")
			$collect_sound.play(0.7)
			yield(get_tree().create_timer(1),"timeout")
			queue_free()
