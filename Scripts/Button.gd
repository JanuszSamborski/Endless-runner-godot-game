extends Button


func _ready():
	pass


func _on_Button_pressed():
	print("haha")
	get_tree().change_scene("res://Scenes/StartScreen.tscn")
