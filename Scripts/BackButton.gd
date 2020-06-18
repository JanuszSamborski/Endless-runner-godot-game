extends Button


func _ready():
	pass


func _on_BackButton_pressed():
	emit_signal("reset")
	GameVariable.OBJECT_SPEED = GameVariable.START_OBJECT_SPEED
	get_tree().change_scene("res://Scenes/StartScreen.tscn")
