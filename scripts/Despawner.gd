extends Area2D

func _on_Despawner_area_entered(area):
	area.queue_free() if area.get_class() == "PowerUp" else area.get_parent().queue_free()
