extends KinematicBody2D

export (PackedScene) var Projectile
var FlatulenceMeter

var GRAVITY = 15
var SPEED = -50

const FLATULENCE_MAX = 5.0
const FLATULENCE_MIN = 0.0
var FLATULENCE

var INVINCIBLE = false
var invincibilityTime = 0
var speedup_speed = 0

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
		FLATULENCE = max(FLATULENCE - 1.2 * delta, 0)
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
		
	if INVINCIBLE:
		invincibilityTime += delta
		if (int(invincibilityTime) >= 5):
			INVINCIBLE = false
			invincibilityTime = 0
			if speedup_speed != 0:
				Globals.SPEED = speedup_speed
				speedup_speed = 0
			else:
				  $Sprite.visible = false
		
		

func shoot():
	var b = Projectile.instance()
	owner.add_child(b)
	b.transform = $Position2D.global_transform
	
func catch_invincibility():
	disable_collision()
	$Sprite.visible = true
	
func catch_speedup():
	disable_collision()
	speedup_speed=Globals.SPEED
	Globals.SPEED += 20

func disable_collision():
	self.set_collision_layer_bit(0, false)
	self.set_collision_layer_bit(6, true)
	self.set_collision_mask_bit(2,false)
	print("Disabled enemy collision")
	INVINCIBLE = true
	
func enable_collisions():
	print("Not invincible")
	self.set_collision_layer_bit(0, true)
	self.set_collision_layer_bit(6, false)
	self.set_collision_mask_bit(2,true)
