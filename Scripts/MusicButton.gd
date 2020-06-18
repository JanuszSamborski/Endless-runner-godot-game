extends Button

var mute: Texture
var sound: Texture
var muted: bool

func _ready():
	BackgroundMusic.play()
	mute = load("res://Resources/mute.png")
	sound = load("res://Resources/soundon.png")
	muted = false


func _on_Button3_pressed():
	if muted==false:
		icon = mute
		muted = true
		BackgroundMusic.stop()
	else:
		icon = sound
		muted = false
		BackgroundMusic.play()
		
