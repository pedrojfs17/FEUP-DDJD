extends CanvasLayer

func _ready():
	if Globals.SOUNDFX:
		$Hit.play()
	var distance = round(Globals.SCORE)
	var rolls = Globals.PAPER_ROLLS
	var score = distance + rolls * 2
	$PanelContainer/MarginContainer/Rows/Score.text = "Distance: " + str(distance) + "\nRolls: " + str(rolls) + "\n\nScore\n" + str(score)

func _on_Restart_pressed():
	get_tree().change_scene("res://scenes/Main.tscn")

func _on_Menu_pressed():
	get_tree().change_scene("res://scenes/Menus/TitleScreen.tscn")
