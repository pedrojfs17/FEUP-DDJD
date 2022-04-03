extends TextureButton

var musicOnIcon = preload("res://assets/gui/music_on.png")
var musicOffIcon = preload("res://assets/gui/music_off.png")

func _ready():
	if Globals.MUSIC:
		set_normal_texture(musicOnIcon)
	else:
		set_normal_texture(musicOffIcon)
	set_scale(Vector2(0.1, 0.1))

func _on_Music_pressed():
	if Globals.MUSIC:
		Globals.MUSIC = false
		set_normal_texture(musicOffIcon)
	else:
		Globals.MUSIC = true
		set_normal_texture(musicOnIcon)
