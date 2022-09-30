extends Control

func _process(delta):
	if($Control.destruir):
		queue_free()
