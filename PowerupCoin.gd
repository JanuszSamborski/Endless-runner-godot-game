extends SpawnedObject

var direction : float

func _ready():
	randomize()
	var rand = rand_range(-180,180)
	direction = sign(rand)
	if direction == 0:
		direction = 1
	$MeshInstance.rotate_y(rand)

func _process(delta):
	$MeshInstance.rotate_y(delta*2*direction)
	translate(Vector3.BACK*delta*variable_node.enemy_basic_speed)
	pass
