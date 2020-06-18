extends Area
signal hit
signal coin
signal dead
signal heart
signal shield
signal diamond
signal asteroid
signal ball

func _ready():
	GameVariable.PLAYER_LIVES = GameVariable.PLAYER_LIVES_MAX
	pass

func _process(delta):
	$MeshInstanceShield.rotate_z(GameVariable.SHIELD_ROTATION_SPEED*delta)
	if Input.is_action_pressed("player_left"):
		if get_translation()[0]>-GameVariable.PLAYER_MAX_X:
			translate(Vector3.LEFT * delta * GameVariable.PLAYER_MOVEMENT_SPEED)
	elif Input.is_action_pressed("player_right"):
		if get_translation()[0]<GameVariable.PLAYER_MAX_X:
			translate(Vector3.RIGHT * delta * GameVariable.PLAYER_MOVEMENT_SPEED)
	pass

func set_shield_visible(visible:bool):
	if $MeshInstanceShield.is_visible() and !visible:
		$MeshInstanceShield.set_visible(false)
	elif !$MeshInstanceShield.is_visible() and visible:
		$MeshInstanceShield.set_visible(true)
		

func _on_Player_area_entered(area):
	match area.get_parent().get_name():
		GameVariable.OBJECT_ENEMY:
			if (!GameVariable.PLAYER_HAS_SHIELD):
				GameVariable.PLAYER_LIVES-=1
				if(GameVariable.PLAYER_LIVES<=0):
					emit_signal("dead")
				else:
					emit_signal("hit")
		GameVariable.OBJECT_COIN:
			area.collect()
			emit_signal("coin")
		GameVariable.OBJECT_DIAMOND:
			area.collect()
			emit_signal("diamond")
		GameVariable.OBJECT_BALL:
			area.collect()
			emit_signal("ball")
		GameVariable.OBJECT_ASTEROID:
			emit_signal("asteroid")
		GameVariable.OBJECT_HEART:
			if GameVariable.PLAYER_LIVES<GameVariable.PLAYER_LIVES_MAX:
				GameVariable.PLAYER_LIVES+=1
			area.collect()
			emit_signal("heart")
		GameVariable.OBJECT_SHIELD:
			set_shield_visible(true)
			$TimerShield.start(GameVariable.SHIELD_DURATION)
			GameVariable.PLAYER_HAS_SHIELD = true
	pass


func _on_Game_reset():
	GameVariable.PLAYER_HAS_SHIELD = false
	set_shield_visible(false)
	GameVariable.PLAYER_LIVES = GameVariable.PLAYER_LIVES_MAX
	set_translation(Vector3.ZERO)


func _on_TimerShield_timeout():
	set_shield_visible(false)
	GameVariable.PLAYER_HAS_SHIELD = false

