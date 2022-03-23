extends Area2D

func _process(_delta: float):
	position.x -= Globals.SPEED

func _on_PowerUp_body_entered(body):
	print("A")
	body.catch_invincibility()
	$AnimatedSprite.play("Catch")

func _on_AnimatedSprite_animation_finished():
	queue_free()
