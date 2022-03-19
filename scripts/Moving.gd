extends Node

var SPEED: float = -7.5

func _process(delta: float):
	SPEED -= 0.1 * delta
