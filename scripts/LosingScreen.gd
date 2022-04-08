extends CanvasLayer

func _ready():
	if Globals.SOUNDFX:
		$Hit.play()
  
	var distance = round(Globals.DISTANCE)
	var rolls = Globals.PAPER_ROLLS
	var enemies = Globals.ENEMIES_KILLED
	var extra = Globals.EXTRAS
	var score = distance + rolls * 2 + enemies * 25 + extra
	
	var text = ""
	text += "Distance: " + str(distance) + "\n"
	text += "Rolls: " + str(rolls) + "\n"
	text += "Enemies Killed: " + str(enemies) + "\n"
	text += "Extras: " + str(extra) + "\n\n"
	text += "Score\n" + str(score)
	
	$PanelContainer/MarginContainer/Score.text = text

func _on_Menu_pressed():
	get_tree().change_scene("res://scenes/Menus/TitleScreen.tscn")


func _on_New_Game_pressed():
	get_tree().change_scene("res://scenes/Main.tscn")
