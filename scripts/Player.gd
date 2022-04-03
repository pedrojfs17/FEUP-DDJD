extends KinematicBody2D

export (PackedScene) var Projectile
var FlatulenceMeter

var GRAVITY = 15
var SPEED = -50

const FLATULENCE_MAX = 7.0
const FLATULENCE_MIN = 0.0
var FLATULENCE

var INVINCIBLE = false

var SHIELD_TIME = -1
var SPEEDUP_TIME = -1
var SPEEDUP_SPEED = -1

var RECOVERING = false

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
	
	if Globals.SOUNDFX:
		if Input.is_action_just_pressed("move_up"):
			$Sounds/Propulsor.play()
		elif Input.is_action_just_released("move_up"):
			$Sounds/Propulsor.stop()
	
	if Input.is_action_pressed("move_up") and not RECOVERING:
		velocity.y = max(velocity.y + SPEED, -500)
		FLATULENCE = max(FLATULENCE - 2 * delta, 0)
	elif velocity.y < 0:
		FLATULENCE = min(FLATULENCE + delta, FLATULENCE_MAX)
		velocity.y += 30
	else:
		FLATULENCE = min(FLATULENCE + delta, FLATULENCE_MAX)
	
	if Input.is_action_just_pressed("shoot") and FLATULENCE > 1:
		shoot()
		FLATULENCE = max(FLATULENCE - 1, 0)
		
	FlatulenceMeter.value = FLATULENCE
	FlatulenceMeter.tint_progress = Color(1, FLATULENCE / FLATULENCE_MAX, FLATULENCE / FLATULENCE_MAX, 1)
	
	if FLATULENCE == 0: RECOVERING = true
	elif FLATULENCE > 1 and RECOVERING: RECOVERING = false
		
	velocity = move_and_slide(velocity, Vector2.UP)
	
	if is_on_floor():
		$AnimatedSprite.play("Run")
	elif Input.is_action_pressed("move_up"):
		$AnimatedSprite.play("Jump")
	else:
		$AnimatedSprite.play("Fall")

	if SPEEDUP_TIME >= 0:
		SPEEDUP_TIME += delta
		if SPEEDUP_TIME > 2:
			SPEEDUP_TIME = -1
			Globals.SPEED = SPEEDUP_SPEED
			enable_collisions()
	
	if SHIELD_TIME >= 0:
		SHIELD_TIME += delta
		if SHIELD_TIME > 5:
			SHIELD_TIME = -1
			$Shield.visible = false
			enable_collisions()

func shoot():
	if Globals.SOUNDFX:
		$Sounds/Shoot.play()
		
	var b = Projectile.instance()
	owner.add_child(b)
	b.transform = $Position2D.global_transform
	
func catch_invincibility():
	print("Caught Invincibility")
	SHIELD_TIME = 0
	disable_collision()
	$Shield.visible = true
	
func catch_speedup():
	print("Caught Speed")
	if SPEEDUP_TIME == -1:
		SPEEDUP_SPEED = Globals.SPEED
	SPEEDUP_TIME = 0
	disable_collision()
	Globals.SPEED = 100

func disable_collision():
	self.set_collision_layer_bit(0, false)
	self.set_collision_layer_bit(6, true)
	self.set_collision_mask_bit(2,false)
	INVINCIBLE = true
	print("Disabled enemy collision")
	
func enable_collisions():
	self.set_collision_layer_bit(0, true)
	self.set_collision_layer_bit(6, false)
	self.set_collision_mask_bit(2,true)
	INVINCIBLE = false
	print("Not invincible")
