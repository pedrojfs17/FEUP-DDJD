extends KinematicBody2D

var GRAVITY = 15
var SPEED = -50

var velocity = Vector2.ZERO

func _ready():
	collision_layer = 0
	set_collision_layer_bit(CollisionLayers.Layers.PLAYER, true)
	collision_mask = 0
	set_collision_mask_bit(CollisionLayers.Layers.WALL, true)
	set_collision_mask_bit(CollisionLayers.Layers.ITEM, true)

func _physics_process(delta):
	velocity.y += GRAVITY
	
	if Input.is_action_pressed("move_up"):
		velocity.y = max(velocity.y + SPEED, -500)
	elif velocity.y < 0:
		velocity.y += 30
		
	velocity = move_and_slide(velocity, Vector2.UP)
	
	if is_on_floor():
		$AnimatedSprite.play("Run")
	elif Input.is_action_pressed("move_up"):
		$AnimatedSprite.play("Jump")
	else:
		$AnimatedSprite.play("Fall")

