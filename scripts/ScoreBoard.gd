extends CanvasLayer


func _process(_delta):
	$ScoreBoard/VBoxContainer/TPContainer/Rolls.text = str(round(Globals.PAPER_ROLLS))
	$ScoreBoard/VBoxContainer/ScoreContainer/Score.text = str(round(Globals.SCORE))
