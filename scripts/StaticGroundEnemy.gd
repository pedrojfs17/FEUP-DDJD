extends Node2D

func _process(_delta: float):
	position.x -= Globals.SPEED

func _on_EnemyDoctor_body_entered(_body):
	get_tree().change_scene("res://scenes/Menus/LosingScreen.tscn")

func get_class(): return "GroundEnemy"
