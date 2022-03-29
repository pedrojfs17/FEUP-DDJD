extends Node2D

func _process(_delta: float):
	position.x -= Globals.SPEED + 3

func _on_EnemyProfessor_body_entered(_body):
	print("You lost!")
	var err = get_tree().change_scene("res://scenes/Menus/TitleScreen.tscn")
	if err: print("Failing to load scene!")

func get_class(): return "GroundEnemy"

