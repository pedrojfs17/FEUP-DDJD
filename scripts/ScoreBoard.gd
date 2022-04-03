extends CanvasLayer


func _process(_delta):
	$ScoreBoard/VBoxContainer/DistanceContainer/Distance.text = str(round(Globals.DISTANCE)) + " "
	$ScoreBoard/VBoxContainer/TPContainer/Rolls.text = str(round(Globals.PAPER_ROLLS)) + " "
