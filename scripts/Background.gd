extends Sprite

var g_texture_width: float = 0

func _ready():
	g_texture_width = texture.get_size().x * scale.x
	
func _process(_delta: float):
	position.x -= Globals.SPEED
	_attempt_reposition()
	
func _attempt_reposition():
	if position.x < -g_texture_width:
		position.x += 2 * g_texture_width
