extends Area
var position = Vector3.ZERO
var phase = 0
var direction : float

func _ready():
	position[2] = GameVariable.SPAWN_Z
	randomize()
	position[0] = rand_range(-GameVariable.SPAWN_X_MAX, GameVariable.SPAWN_X_MAX)
	$MeshInstance.set_rotation(Vector3.UP*PI*rand_range(0,2))
	direction = sign(rand_range(-1,1))
	if direction == 0:
		direction = 1
	set_translation(position)
	pass

func _process(delta):
	$MeshInstance.rotate(Vector3.UP, GameVariable.DIAMOND_ROTATION * delta * direction)
	translate(Vector3.BACK * GameVariable.OBJECT_SPEED * delta)
	if get_translation()[2]>GameVariable.DESPAWN_Z:
		queue_free()
	pass

func collect():
	queue_free()
