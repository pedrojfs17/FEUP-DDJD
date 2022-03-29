extends Area2D

func _physics_process(_delta):
	position.x -= 10

func _on_EnemyProjectile_body_entered(body):
	print("You lost!")
	get_tree().change_scene("res://scenes/Menus/TitleScreen.tscn")
	
