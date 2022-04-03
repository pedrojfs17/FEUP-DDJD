extends Node2D

func _process(_delta: float):
	position.x -= Globals.SPEED + 3

func _on_EnemyProfessor_body_entered(_body):
	get_tree().change_scene("res://scenes/Menus/LosingScreen.tscn")

func hit():
	Globals.kill_enemy()
	queue_free()
	
func get_class(): return "GroundEnemy"

