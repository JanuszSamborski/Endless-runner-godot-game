extends SpawnedObject

func _ready():
	for i in range(0,432):
		var mat = load("res://coin_material_test.tres")
		$MeshInstance.set_surface_material(i, mat)
	pass

func _process(delta):
	translate(Vector3.BACK*delta*variable_node.enemy_basic_speed)
	pass
