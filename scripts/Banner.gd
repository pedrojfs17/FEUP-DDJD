extends Node2D

func _process(_delta: float):
	position.x -= Globals.SPEED

func _on_BannerEnemy_body_entered(_body):
	get_tree().change_scene("res://scenes/Menus/LosingScreen.tscn")

func _on_BannerPowerUp_body_entered(_body):
	Globals.banner_power_up()

func hit():
	Globals.kill_enemy()
	queue_free()

func get_class(): return "Banner"
