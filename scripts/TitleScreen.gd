extends CanvasLayer

var musicOnIcon = preload("res://assets/gui/music_on.png")
var musicOffIcon = preload("res://assets/gui/music_off.png")
var soundOnIcon = preload("res://assets/gui/sound_on.png")
var soundOffIcon = preload("res://assets/gui/sound_off.png")

func _ready():
	# Music
	$Music.set_normal_texture(musicOnIcon if Globals.MUSIC else musicOffIcon)
	$Music.set_scale(Vector2(0.25, 0.25))
	# Sound
	$Sound.set_normal_texture(soundOnIcon if Globals.SOUNDFX else soundOffIcon)
	$Sound.set_scale(Vector2(0.25, 0.25))

func _on_Music_pressed():
	Globals.MUSIC = not Globals.MUSIC
	$Music.set_normal_texture(musicOnIcon if Globals.MUSIC else musicOffIcon)

func _on_Sound_Effects_pressed():
	Globals.SOUNDFX = not Globals.SOUNDFX
	$Sound.set_normal_texture(soundOnIcon if Globals.SOUNDFX else soundOffIcon)
