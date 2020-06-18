extends Area

var position = Vector3.ZERO
var phase = 0

func _init():
	position[2] = GameVariable.SPAWN_Z
	randomize()
	position[0] = rand_range(- GameVariable.SPAWN_X_MAX, GameVariable.SPAWN_X_MAX)
	set_translation(position)
	pass

func _process(delta):
	phase+=GameVariable.ENEMY_ZIGZAG_FREQ
	translate(Vector3.BACK * GameVariable.OBJECT_SPEED * delta)
	if get_translation()[2]>GameVariable.DESPAWN_Z:
		queue_free()
	pass
