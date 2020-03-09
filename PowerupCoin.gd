extends SpawnedObject

func _ready():
	pass

func _process(delta):
	translate(Vector3.BACK*delta*variable_node.enemy_basic_speed)
	pass
