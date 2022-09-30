extends Node2D


func _on_Area2D_body_entered(body):
	if (body.get_name()=="player"):
		Global.powerup = "caramelo"
		$caramelo.play("collect")
		$collect_sound.play()
		yield(get_tree().create_timer(0.5), "timeout")
		body.indicator_powerup(Global.powerup)
		queue_free()
