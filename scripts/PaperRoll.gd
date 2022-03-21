extends Area2D

func _process(_delta: float):
	position.x -= Globals.SPEED

func _on_PaperRoll_body_entered(_body):
	Globals.catch_paper_roll()
	$AnimatedSprite.play("Catch")

func _on_AnimatedSprite_animation_finished():
	queue_free()
