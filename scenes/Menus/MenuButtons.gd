extends VBoxContainer

func _on_New_Game_pressed():
	get_tree().change_scene("res://scenes/Main.tscn")


func _on_Exit_Game_pressed():
	get_tree().quit()


func _on_How_To_Play_pressed():
	get_tree().change_scene("res://scenes/Menus/HowToPlayScreen.tscn")
