extends Area
class_name SpawnedObject


var variable_node : Node

func _ready():
	variable_node = get_node("/root/GameVariable")
	pass

func get_translation_z():
	return get_translation()[2]
