extends Node2D




func _on_Area2D_body_entered(body):
	if(body.get_name()=="player"):
		if(Global.salud<50):
			Global.salud+=50
			body.crearIndicador("50")
			$botiquin.play("collect")
			$collect_sound.play()
			yield(get_tree().create_timer(0.5), "timeout")
			queue_free()
		elif(Global.salud <100 and Global.salud>=50):
			Global.salud=100
			body.crearIndicador("50")			
			$botiquin.play("collect")
			yield(get_tree().create_timer(1), "timeout")
			queue_free()
