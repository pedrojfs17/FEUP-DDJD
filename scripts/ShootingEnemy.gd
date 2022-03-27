extends Node2D

export (PackedScene) var Enemy_Projectile

var time = 0
var freq = 1
var amplitude = 300

func _physics_process(delta):
	if position.x > 900 :
		position.x -= Globals.SPEED
	
	time += delta
	position.y = sin(time * freq) * amplitude + 384

func shoot():
	var b = Enemy_Projectile.instance()
	owner.add_child(b)
	b.transform = $Position2D.global_transform

func get_class(): return "FloatingEnemy"
