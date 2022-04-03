extends TextureButton

var soundOnIcon = preload("res://assets/gui/sound_on.png")
var soundOffIcon = preload("res://assets/gui/sound_off.png")

func _ready():
	if Globals.SOUNDFX:
		set_normal_texture(soundOnIcon)
	else:
		set_normal_texture(soundOffIcon)
	set_scale(Vector2(0.25, 0.25))

func _on_Sound_Effects_pressed():
	if Globals.SOUNDFX:
		Globals.SOUNDFX = false
		set_normal_texture(soundOffIcon)
	else:
		Globals.SOUNDFX = true
		set_normal_texture(soundOnIcon)
