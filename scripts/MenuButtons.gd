extends CanvasLayer

func _ready():
	$New_Game.set_scale(Vector2(0.1, 0.1))

func _on_New_Game_pressed():
	get_tree().change_scene("res://scenes/Main.tscn")


func _on_Exit_Game_pressed():
	get_tree().quit()


func _on_How_To_Play_pressed():
	get_tree().change_scene("res://scenes/Menus/HowToPlayScreen.tscn")
