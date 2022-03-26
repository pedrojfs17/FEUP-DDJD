extends Node2D

export (PackedScene) var Enemy_Projectile

var time = 0

func _physics_process(delta):
	
	if position.x > 900 :
		position.x -= Globals.SPEED
	else:
		position.x = 900
	
	time += delta
	var freq = 2
	var amplitude = 100
	position.y = sin(time * freq) * amplitude


func shoot():
	var b = Enemy_Projectile.instance()
	add_child(b)
	b.transform = $Position2D.global_transform

func get_class(): return "FloatingEnemy"
