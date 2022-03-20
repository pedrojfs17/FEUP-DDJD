extends Node2D


func _process(delta: float):
	position.x += Moving.SPEED

func _on_banner_body_entered(body):
	print(body)
	get_tree().change_scene("res://scenes/Main.tscn")


func _on_BannerTop_body_entered(body):
	body.add_score()
