extends KinematicBody2D
export (PackedScene) var Projectile

var GRAVITY = 15
var SPEED = -50

var score = 0
var time = 0
var velocity = Vector2.ZERO

func _physics_process(delta):
	velocity.y += GRAVITY
	
	if Input.is_action_pressed("move_up"):
		velocity.y = max(velocity.y + SPEED, -500)		
	elif velocity.y < 0:
		velocity.y += 30
	
	if Input.is_action_just_pressed("shoot"):
		shoot()
	velocity = move_and_slide(velocity, Vector2.UP)
	
	if is_on_floor():
		$AnimatedSprite.play("Run")
	elif Input.is_action_pressed("move_up"):
		$AnimatedSprite.play("Jump")
	else:
		$AnimatedSprite.play("Fall")
	
	time += delta
	if int(time) == 1:
		add_score()
		print(score)
		time=0
		

func shoot():
	var b = Projectile.instance()
	owner.add_child(b)
	b.transform = $Position2D.global_transform

func add_score():
	score += 1
