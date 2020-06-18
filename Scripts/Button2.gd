extends Button


func _ready():
	pass


func _on_Button2_pressed():
	get_tree().change_scene("res://Scenes/Rank.tscn")
	get_tree().paused = false

