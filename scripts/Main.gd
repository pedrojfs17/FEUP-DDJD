extends Node2D

# Cumulative probability
# p.e ENEMY_PROB = x -> number in [PAPER_ROLL_PROB, x[
const PAPER_ROLL_PROB = 0.35
const ENEMY_PROB = 0.80
const POWER_UP_PROB = 1.0

# Paper roll patterns
const PAPER_ROLL = [
	preload("res://scenes/RollsPatterns/Pattern1.tscn"),
	preload("res://scenes/RollsPatterns/Pattern2.tscn"),
	preload("res://scenes/RollsPatterns/Pattern3.tscn")
]

# Enemies
const ENEMIES = [
	preload("res://scenes/Enemies/Banner.tscn"),
	preload("res://scenes/Enemies/StaticGroundEnemy.tscn"),
	preload("res://scenes/Enemies/WalkingGroundEnemy.tscn"),
	preload("res://scenes/Enemies/ShootingEnemy.tscn")
]

# Power-Ups
const POWER_UPS = [
	preload("res://scenes/PowerUps/Invincibility.tscn"),
	preload("res://scenes/PowerUps/SpeedUp.tscn")
]


func _reset_game():
	randomize()
	Globals.SPEED = Globals.INITIAL_SPEED
	Globals.DISTANCE = 0
	Globals.PAPER_ROLLS = 0
	Globals.ENEMIES_KILLED = 0
	Globals.EXTRAS = 0


func _ready():
	_reset_game()
	_add_wall(Vector2(0, -1), Vector2(1600, 1))
	_add_wall(Vector2(0, 769), Vector2(1600, 1))
	if Globals.MUSIC:
		$BackgroundMusic.play()


func _add_wall(position: Vector2, size: Vector2):
	var rect := RectangleShape2D.new()
	rect.set_extents(size)
	
	var collision_shape := CollisionShape2D.new()
	collision_shape.shape = rect
	
	var collision_object := StaticBody2D.new()
	collision_object.position = position
	collision_object.add_child(collision_shape)
	
	collision_object.collision_layer = 0
	collision_object.set_collision_layer_bit(3, true)
	collision_object.collision_mask = 0
	
	add_child(collision_object)


func _spawn_object(spawnables):
	var object = spawnables[randi() % spawnables.size()].instance()
	$Spawnables.add_child(object)
	object.set_owner(self)
	object.position = _get_spawnable_position(object)


func _get_spawnable_position(object) -> Vector2:
	if object.get_class() == "GroundEnemy":
		return $Spawns/GroundEnemy.position
	elif object.get_class() == "FloatingEnemy":
		return $Spawns/FloatingEnemy.position
	else:
		var area = $Spawns/SpawnArea
		return area.rect_position + Vector2(
			randf() * area.rect_size.x,
			randf() * area.rect_size.y
		)


func _on_SpawnTimer_timeout():
	var number = randf()
	
	if number < PAPER_ROLL_PROB:
		_spawn_object(PAPER_ROLL)
	elif number < ENEMY_PROB:
		_spawn_object(ENEMIES)
	elif number < POWER_UP_PROB:
		_spawn_object(POWER_UPS)
