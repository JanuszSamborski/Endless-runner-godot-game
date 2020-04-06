extends Area
signal hit
signal coin

func _ready():
	pass

func _process(delta):
	if Input.is_action_pressed("player_left"):
		if get_translation()[0]>-GameVariable.PLAYER_MAX_X:
			translate(Vector3.LEFT * delta * GameVariable.PLAYER_MOVEMENT_SPEED)
	elif Input.is_action_pressed("player_right"):
		if get_translation()[0]<GameVariable.PLAYER_MAX_X:
			translate(Vector3.RIGHT * delta * GameVariable.PLAYER_MOVEMENT_SPEED)
	pass



func _on_Player_area_entered(area):
	match area.get_parent().get_name():
		GameVariable.OBJECT_ENEMY:
			emit_signal("hit")
		GameVariable.OBJECT_COIN:
			area.collect()
			emit_signal("coin")
	pass


func _on_Game_reset():
	set_translation(Vector3.ZERO)
