extends Node

const INITIAL_SPEED: float = 3.0
const INCREASE: float = 0.25

var SPEED: float = INITIAL_SPEED

var DISTANCE: float = 0
var PAPER_ROLLS: int = 0
var ENEMIES_KILLED: int = 0
var EXTRAS: int = 0

var MUSIC: bool = true
var SOUNDFX: bool = true

func _process(delta: float):
	if SPEED < 25:
		SPEED += INCREASE * delta
	DISTANCE += SPEED * delta
	
func banner_power_up():
	EXTRAS += 100

func catch_paper_roll():
	PAPER_ROLLS += 1
	
func kill_enemy():
	ENEMIES_KILLED += 1
