extends Node

const INITIAL_SPEED: float = 5.0
const INCREASE: float = 0.1

var SPEED: float = INITIAL_SPEED
var SCORE: float = 0
var PAPER_ROLLS: int = 0

func _process(delta: float):
	SCORE += SPEED * delta
	SPEED += INCREASE * delta
	
func banner_power_up():
	SCORE += 100

func catch_paper_roll():
	PAPER_ROLLS += 1
