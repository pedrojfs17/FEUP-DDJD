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

func _on_New_Game_pressed():
	get_tree().change_scene("res://scenes/Main.tscn")

func _on_Exit_Game_pressed():
	get_tree().quit()

func _on_How_To_Play_pressed():
	get_tree().change_scene("res://scenes/Menus/HowToPlayScreen.tscn")
