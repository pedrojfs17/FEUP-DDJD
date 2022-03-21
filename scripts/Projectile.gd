extends Area2D

func _physics_process(_delta):
	position.x += Globals.SPEED + 10

func _on_Projectile_area_entered(area):
	area.get_parent().queue_free()
	queue_free()

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
