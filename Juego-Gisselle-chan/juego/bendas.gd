extends Node2D



func _on_Area2D_body_entered(body):
	if(body.get_name()=="player"):
		if(Global.salud > 75 and Global.salud < 100):
			Global.salud = 100
			$AnimatedSprite.play("bd_collect")			
			body.crearIndicador("25")
			$collect.play()
			yield(get_tree().create_timer(0.5),"timeout")
			queue_free()
		elif(Global.salud < 100):
			Global.salud+=25
			body.crearIndicador("25")
			$AnimatedSprite.play("bd_collect")
			$collect.play()
			yield(get_tree().create_timer(0.5),"timeout")
			queue_free()
