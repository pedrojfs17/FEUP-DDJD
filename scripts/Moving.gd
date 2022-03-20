extends Node

var SPEED: float = -4.5

func _process(delta: float):
	SPEED -= 0.01 * delta
