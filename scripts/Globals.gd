extends Node

const INITIAL_SPEED: float = 3.0
const INCREASE: float = 0.1

var SPEED: float = INITIAL_SPEED
var SCORE: float = 0
var PAPER_ROLLS: int = 0

func _process(delta: float):
	if SPEED < 25:
		SPEED += INCREASE * delta
	SCORE += SPEED * delta
	
func banner_power_up():
	SCORE += 100

func catch_paper_roll():
	PAPER_ROLLS += 1
