extends KinematicBody2D

export (PackedScene) var Projectile
var FlatulenceMeter

var GRAVITY = 15
var SPEED = -50

const FLATULENCE_MAX = 5.0
const FLATULENCE_MIN = 0.0
var FLATULENCE

var velocity = Vector2.ZERO

func _ready():
	FLATULENCE = FLATULENCE_MAX
	FlatulenceMeter = get_tree().get_root().get_node('Main/GUI/FlatulenceMeter')
	FlatulenceMeter.max_value = FLATULENCE_MAX
	FlatulenceMeter.min_value = FLATULENCE_MIN
	FlatulenceMeter.step = 0.01
	FlatulenceMeter.value = FLATULENCE_MAX

func _physics_process(delta):
	velocity.y += GRAVITY
	
	if Input.is_action_pressed("move_up"):
		velocity.y = max(velocity.y + SPEED, -500)
		FLATULENCE = max(FLATULENCE - 2 * delta, 0)
	elif velocity.y < 0:
		FLATULENCE = min(FLATULENCE + delta, 5)
		velocity.y += 30
	else:
		FLATULENCE = min(FLATULENCE + delta, 5)
	
	FlatulenceMeter.value = FLATULENCE
	FlatulenceMeter.tint_progress = Color(1, FLATULENCE / FLATULENCE_MAX, FLATULENCE / FLATULENCE_MAX, 1)
	
	if FLATULENCE == 0:
		get_tree().change_scene("res://scenes/Main.tscn")
		print("You lost due to shit yourself!")
	
	if Input.is_action_just_pressed("shoot"):
		shoot()
		
	velocity = move_and_slide(velocity, Vector2.UP)
	
	if is_on_floor():
		$AnimatedSprite.play("Run")
	elif Input.is_action_pressed("move_up"):
		$AnimatedSprite.play("Jump")
	else:
		$AnimatedSprite.play("Fall")
	

func shoot():
	var b = Projectile.instance()
	owner.add_child(b)
	b.transform = $Position2D.global_transform
