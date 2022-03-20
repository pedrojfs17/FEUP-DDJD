extends Area2D

func _ready():
	collision_layer = 0
	set_collision_layer_bit(CollisionLayers.Layers.ITEM, true)
	collision_mask = 0

func _process(delta: float):
	position.x += Moving.SPEED

func _on_PaperRoll_body_entered(body):
	# Do something with the paper roll
	$AnimatedSprite.play("Catch")

func _on_AnimatedSprite_animation_finished():
	queue_free()
