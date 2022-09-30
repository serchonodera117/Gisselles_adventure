extends StaticBody2D

func _process(delta):
	if(Global.puntos > 9): queue_free()
