extends KinematicBody2D
signal hit

var GRAVITY = 25
var SPEED = -300

var velocity = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()


func _physics_process(delta):
	if velocity.y < -50:
		velocity.y = -50
		
	velocity.y = velocity.y + GRAVITY
	velocity.x = 200
	
	if Input.is_action_pressed("move_up"):
		velocity.y = SPEED
		
	velocity = move_and_slide(velocity, Vector2.UP)
	
	if is_on_floor():
		$AnimatedSprite.play("Run")
	elif Input.is_action_pressed("move_up"):
		$AnimatedSprite.play("Jump")
	else:
		$AnimatedSprite.play("Fall")


func _on_Player_body_entered(body):
	hide() # Player disappears after being hit.
	emit_signal("hit")
	# Must be deferred as we can't change physics properties on a physics callback.
	$CollisionShape2D.set_deferred("disabled", true)

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false

