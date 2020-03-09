extends SpawnedObject

var time : float

func _ready():
	randomize()
	time = rand_range(0,2)

func _process(delta):
	time+=delta
	var change_z = delta*variable_node.enemy_basic_speed
	var change_x = sin(time*variable_node.enemy_zigzag_sin_mult)*variable_node.enemy_zigzag_z_speed
	translate(Vector3(change_x,0,change_z))
	pass
