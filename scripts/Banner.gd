extends Node2D

func _process(_delta: float):
	position.x -= Globals.SPEED

func _on_BannerEnemy_body_entered(_body):
	print("You lost!")
	var err = get_tree().change_scene("res://scenes/Main.tscn")
	if err: print("Failing to load scene!")

func _on_BannerPowerUp_body_entered(_body):
	Globals.banner_power_up()
