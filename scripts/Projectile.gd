extends Area2D

func _physics_process(_delta):
	position.x += 10

func _on_Projectile_area_entered(area):
	area.get_parent().hit()
	queue_free()

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
