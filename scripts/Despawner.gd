extends Area2D

func _on_Despawner_area_entered(area):
	area.get_parent().queue_free()
