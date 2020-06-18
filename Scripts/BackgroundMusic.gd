extends Node


func _ready():
	$Music.playing = true

func play():
	$Music.playing = true
	
func stop():
	$Music.playing = false
