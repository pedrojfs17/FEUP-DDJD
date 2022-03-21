extends Node2D

# Cumulative probability
# p.e ENEMY_PROB = x -> number in [PAPER_ROLL_PROB, x[
const PAPER_ROLL_PROB = 0.75
const ENEMY_PROB = 1.0
const POWER_UP_PROB = 1.0

# Paper roll patterns
const PAPER_ROLL = [
	preload("res://scenes/RollsPatterns/Pattern1.tscn"),
	preload("res://scenes/RollsPatterns/Pattern2.tscn"),
	preload("res://scenes/RollsPatterns/Pattern3.tscn")
]

# Enemies
const ENEMIES = [
	preload("res://scenes/Banner.tscn")
]

# Power-Ups
#const POWER_UPS = []


func _reset_game():
	randomize()
	Globals.SPEED = Globals.INITIAL_SPEED
	Globals.SCORE = 0
	Globals.PAPER_ROLLS = 0


func _ready():
	_reset_game()
	_add_wall(Vector2(0, -1), Vector2(1600, 1))
	_add_wall(Vector2(0, 769), Vector2(1600, 1))


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
	object.position = _get_spawnable_position()


func _get_spawnable_position() -> Vector2:
	var area = $SpawnArea
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
	#else:
	#	_spawn_object(POWER_UPS)
