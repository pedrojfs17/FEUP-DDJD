extends Area2D


func _process(delta: float):
	position.x += Moving.SPEED

func _on_PaperRoll_body_entered(body):
	body.add_score()
	$AnimatedSprite.play("Catch")

func _on_AnimatedSprite_animation_finished():
	queue_free()
