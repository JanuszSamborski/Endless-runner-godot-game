extends Control


func _ready():
	$VBoxContainer/ButtonStart.connect("button_down", self, "startGame")
	$VBoxContainer/ButtonExit.connect("button_down", self, "exitGame")
	pass
	
func startGame():
	get_tree().change_scene("res://Level.tscn")
	
func exitGame():
	get_tree().quit()
