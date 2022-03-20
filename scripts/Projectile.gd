extends Area2D

func _physics_process(delta):
	position.x += -Moving.SPEED*2

func _on_Projectile_area_entered(area):
	area.get_parent().queue_free()
	queue_free()
