extends Node2D

export (PackedScene) var Enemy_Projectile

var LIVES = 3

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
	
func hit():
	$AnimationPlayer.play("hit")

func _on_Hit_animation_finished(anim_name):
	LIVES -= 1
	if LIVES == 0:
		Globals.kill_enemy()
		queue_free()

func get_class(): return "FloatingEnemy"
