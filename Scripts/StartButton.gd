extends Button


func _ready():
	pass


func _on_Button_pressed():
	get_tree().change_scene("res://Scenes/HowToPlay.tscn")


func _on_Button2_pressed():
	get_tree().change_scene("res://Scenes/Main.tscn")
